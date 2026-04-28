# Food-App Development Guide

## 📚 Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Three-Layer Architecture](#three-layer-architecture)
3. [Development Workflow](#development-workflow)
4. [Code Examples](#code-examples)
5. [Best Practices](#best-practices)
6. [Performance Tips](#performance-tips)
7. [Security Guidelines](#security-guidelines)
8. [Testing & Debugging](#testing--debugging)

---

## 🏗️ Architecture Overview

Food-App follows a classic **3-Layer Architecture** pattern:

```
┌─────────────────────────────────────────────────┐
│         Presentation Layer (JSP/HTML)           │
│  Responsible for User Interface & Display       │
└────────────────────┬────────────────────────────┘
                     │ HTTP Request/Response
                     ↓
┌─────────────────────────────────────────────────┐
│    Business Logic Layer (Servlets)              │
│  Handles Request Processing & Business Logic    │
└────────────────────┬────────────────────────────┘
                     │ DAO Method Calls
                     ↓
┌─────────────────────────────────────────────────┐
│    Data Access Layer (DAO/DAOImpl)               │
│  Manages Database Operations & SQL Queries      │
└────────────────────┬────────────────────────────┘
                     │ JDBC Connections
                     ↓
┌─────────────────────────────────────────────────┐
│         Database Layer (MySQL)                  │
│    Persistent Data Storage                      │
└─────────────────────────────────────────────────┘
```

---

## 🎯 Three-Layer Architecture

### Layer 1: Presentation Layer (JSP/HTML)

**Location**: `src/main/webapp/*.jsp`

**Responsibility**: Display data to users and collect input

**Example Flow**:
```
User Input → HTML Form → JSP Page → Servlet
```

**Key Files**:
- `home.jsp` - Landing page
- `login.jsp` - Authentication page
- `menu.jsp` - Food items display
- `cart.jsp` - Shopping cart
- `order*.jsp` - Order status

**Best Practices**:
```jsp
<%@ page language="java" contentType="text/html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Use JSTL for logic instead of scriptlets -->
<c:forEach items="${restaurants}" var="restaurant">
    <div>
        <h3>${restaurant.name}</h3>
        <p>${restaurant.location}</p>
    </div>
</c:forEach>

<!-- Avoid: <%= restaurant.getName() %> -->
<!-- Use: ${restaurant.name} -->
```

### Layer 2: Business Logic Layer (Servlets)

**Location**: `src/main/java/com/foodapp/servlets/`

**Responsibility**: 
- Handle HTTP requests
- Validate user input
- Coordinate with DAO layer
- Manage sessions & redirects

**Servlet Lifecycle**:
```
Request → doGet()/doPost() → DAO Call → Response → JSP/Redirect
```

**Example Servlet**:
```java
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response) throws ServletException, IOException {
        
        // Step 1: Get request parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Step 2: Validate input
        if (email == null || email.isEmpty()) {
            request.setAttribute("error", "Email required");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        // Step 3: Call DAO layer
        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.getByEmail(email);
        
        // Step 4: Process result
        if (user != null && user.getPassword().equals(password)) {
            // Step 5a: Create session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("home.jsp");
        } else {
            // Step 5b: Error handling
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
```

**Key Patterns**:
```java
// Pattern 1: Forward to JSP (server-side)
request.getRequestDispatcher("page.jsp").forward(request, response);

// Pattern 2: Redirect (client-side)
response.sendRedirect("home.jsp");

// Pattern 3: Set session data
HttpSession session = request.getSession();
session.setAttribute("key", value);

// Pattern 4: Retrieve session data
User user = (User) session.getAttribute("user");
```

### Layer 3: Data Access Layer (DAO/DAOImpl)

**Location**: 
- Interfaces: `src/main/java/com/foodapp/dao/`
- Implementation: `src/main/java/com/foodapp/daoimpl/`

**Responsibility**: All database operations

**DAO Pattern**:
```java
// Interface: UserDAO.java
public interface UserDAO {
    void add(User user);                    // CREATE
    User getById(int userId);               // READ
    User getByEmail(String email);          // READ
    List<User> getAll();                    // READ ALL
    void update(User user);                 // UPDATE
    void delete(int userId);                // DELETE
}

// Implementation: UserDAOImpl.java
public class UserDAOImpl implements UserDAO {
    private Connection con = MyConnection.getConnection();
    
    @Override
    public void add(User user) {
        String query = "INSERT INTO users (name, email, password, phone, address) "
                     + "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public User getById(int userId) {
        String query = "SELECT * FROM users WHERE user_id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("user_id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));
        return user;
    }
}
```

**SQL Best Practices**:
```java
// ✅ Good: Use PreparedStatement (prevents SQL injection)
String query = "SELECT * FROM users WHERE email = ?";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1, email);
ResultSet rs = ps.executeQuery();

// ❌ Bad: String concatenation (SQL injection vulnerability)
String query = "SELECT * FROM users WHERE email = '" + email + "'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(query);
```

---

## 🔄 Development Workflow

### Adding a New Feature (Example: User Profile Update)

#### Step 1: Create/Update Model
```java
// src/main/java/com/foodapp/model/User.java
public class User {
    private int userId;
    private String name;
    private String email;
    private String phone;
    private String address;
    
    // Constructors, Getters, Setters, toString()
}
```

#### Step 2: Create DAO Interface
```java
// src/main/java/com/foodapp/dao/UserDAO.java
public interface UserDAO {
    void update(User user);  // Add this method
}
```

#### Step 3: Implement DAO
```java
// src/main/java/com/foodapp/daoimpl/UserDAOImpl.java
@Override
public void update(User user) {
    String query = "UPDATE users SET name=?, phone=?, address=? WHERE user_id=?";
    try (PreparedStatement ps = con.prepareStatement(query)) {
        ps.setString(1, user.getName());
        ps.setString(2, user.getPhone());
        ps.setString(3, user.getAddress());
        ps.setInt(4, user.getUserId());
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
```

#### Step 4: Create Servlet
```java
// src/main/java/com/foodapp/servlets/UpdateUserServlet.java
@WebServlet("/updateProfile")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        // Update user properties from form
        user.setName(request.getParameter("name"));
        user.setPhone(request.getParameter("phone"));
        user.setAddress(request.getParameter("address"));
        
        // Call DAO to update database
        UserDAO userDAO = new UserDAOImpl();
        userDAO.update(user);
        
        // Update session
        session.setAttribute("user", user);
        
        response.sendRedirect("profile.jsp?success=true");
    }
}
```

#### Step 5: Create/Update JSP Page
```jsp
<!-- src/main/webapp/updateDetails.jsp -->
<%@ page import="com.foodapp.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<form method="POST" action="updateProfile">
    <input type="text" name="name" value="${user.name}" required>
    <input type="tel" name="phone" value="${user.phone}">
    <textarea name="address">${user.address}</textarea>
    <button type="submit">Update Profile</button>
</form>
```

#### Step 6: Add to web.xml (if needed)
Already auto-mapped via `@WebServlet` annotation in Servlet

---

## 💡 Code Examples

### Example 1: User Registration Flow

**Servlet**:
```java
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response) 
        throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User newUser = new User();
        newUser.setName(name);
        newUser.setEmail(email);
        newUser.setPassword(password); // Hash in production!
        
        UserDAO userDAO = new UserDAOImpl();
        userDAO.add(newUser);
        
        request.setAttribute("message", "Registration successful! Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
```

### Example 2: Menu Retrieval

**Servlet**:
```java
@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, 
                        HttpServletResponse response) 
        throws ServletException, IOException {
        
        int restaurantId = Integer.parseInt(request.getParameter("rid"));
        
        MenuDAO menuDAO = new MenuDAOImpl();
        List<Menu> menuItems = menuDAO.getByRestaurant(restaurantId);
        
        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
```

**JSP**:
```jsp
<table>
    <tr>
        <th>Item Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${menuItems}" var="item">
        <tr>
            <td>${item.itemName}</td>
            <td>${item.category}</td>
            <td>$${item.price}</td>
            <td>
                <form method="POST" action="cart">
                    <input type="hidden" name="menuId" value="${item.menuId}">
                    <input type="hidden" name="action" value="add">
                    <input type="number" name="qty" min="1" value="1">
                    <button type="submit">Add to Cart</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
```

### Example 3: Order Placement

**Servlet**:
```java
@WebServlet("/placeOrder")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response) 
        throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        // Get cart and restaurant
        Cart cart = (Cart) session.getAttribute("cart");
        int restaurantId = Integer.parseInt(request.getParameter("rid"));
        
        // Create order
        OrderTable order = new OrderTable();
        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setTotalAmount(cart.getTotalPrice());
        
        OrderTableDAO orderDAO = new OrderTableDAOImpl();
        int orderId = orderDAO.add(order);
        
        // Add order items
        OrderItemDAO orderItemDAO = new OrderItemDAOImpl();
        for (CartItem item : cart.getItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(orderId);
            orderItem.setMenuId(item.getMenuId());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setItemPrice(item.getPrice());
            orderItemDAO.add(orderItem);
        }
        
        // Clear cart
        session.removeAttribute("cart");
        
        response.sendRedirect("orderSuccess.jsp?orderId=" + orderId);
    }
}
```

---

## ✨ Best Practices

### 1. Database Design
```sql
-- Use meaningful column names
-- Use appropriate data types
-- Always use primary and foreign keys
-- Add NOT NULL constraints where applicable
-- Use TIMESTAMP for audit trails

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_email (email)  -- Add indexes for frequent queries
);
```

### 2. DAO Implementation
```java
// Always use try-with-resources for automatic resource closing
try (PreparedStatement ps = con.prepareStatement(query)) {
    ps.setString(1, value);
    ResultSet rs = ps.executeQuery();
} catch (SQLException e) {
    e.printStackTrace();
    // Log error appropriately
}

// Avoid catching generic exceptions
// Catch specific exceptions and handle appropriately
```

### 3. Servlet Validation
```java
// Validate all inputs
String email = request.getParameter("email");
if (email == null || email.trim().isEmpty()) {
    request.setAttribute("error", "Email is required");
    request.getRequestDispatcher("form.jsp").forward(request, response);
    return;
}

// Validate email format
if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
    request.setAttribute("error", "Invalid email format");
    request.getRequestDispatcher("form.jsp").forward(request, response);
    return;
}
```

### 4. Session Management
```java
// Always check if user is logged in
HttpSession session = request.getSession();
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

// Invalidate session on logout
session.invalidate();
```

### 5. Code Organization
```
One responsibility per class
Keep methods small and focused
Use meaningful names
Add comments for complex logic
Separate concerns (UI, Business Logic, Data Access)
```

---

## ⚡ Performance Tips

### 1. Database Queries
```java
// ✅ Good: Specify only needed columns
String query = "SELECT user_id, name, email FROM users WHERE active = 1";

// ❌ Bad: Select all columns
String query = "SELECT * FROM users";

// ✅ Good: Use LIMIT for pagination
String query = "SELECT * FROM orders LIMIT 10 OFFSET 0";

// ✅ Good: Use indexes on frequently searched columns
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_order_userId ON orders(user_id);
```

### 2. Caching
```java
// Cache frequently accessed data
private static List<Restaurant> restaurantCache;
private static long cacheTime = 0;
private static final long CACHE_DURATION = 3600000; // 1 hour

public List<Restaurant> getAllRestaurants() {
    long currentTime = System.currentTimeMillis();
    
    if (restaurantCache == null || 
        currentTime - cacheTime > CACHE_DURATION) {
        restaurantCache = loadFromDatabase();
        cacheTime = currentTime;
    }
    
    return restaurantCache;
}
```

### 3. Connection Pooling
```java
// Already configured in db.properties
db.pool.size=10  // Adjust based on load

// Reuse connections instead of creating new ones
Connection con = MyConnection.getConnection();
// Use connection
// Close in finally block
```

---

## 🔒 Security Guidelines

### 1. Input Validation
```java
// Always validate and sanitize user input
String username = request.getParameter("username");
if (username != null) {
    username = username.trim();
    if (username.length() < 3 || username.length() > 50) {
        // Error: Invalid length
    }
}
```

### 2. SQL Injection Prevention
```java
// ✅ Always use PreparedStatement
String query = "SELECT * FROM users WHERE email = ? AND password = ?";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1, email);
ps.setString(2, password);

// ❌ Never concatenate strings
String query = "SELECT * FROM users WHERE email = '" + email + "'";
```

### 3. Password Security
```java
// ✅ Good: Hash passwords
String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
user.setPassword(hashedPassword);

// ✅ Good: Verify hashed password
boolean isPasswordValid = BCrypt.checkpw(providedPassword, storedHash);

// ❌ Bad: Store plain text passwords
user.setPassword(password);  // Never do this!
```

### 4. Session Security
```java
// Regenerate session ID after login
session = request.getSession(true);
session.setAttribute("user", user);

// Set session timeout
session.setMaxInactiveInterval(1800); // 30 minutes

// Invalidate session on logout
session.invalidate();
```

### 5. Cross-Site Scripting (XSS) Prevention
```jsp
<!-- ✅ Good: Use JSTL tags (automatically escapes HTML) -->
<p>${user.name}</p>

<!-- ❌ Bad: Direct output -->
<p><%= user.getName() %></p>

<!-- ✅ Good: Explicitly escape if using scriptlets -->
<p><%= java.lang.String.valueOf(user.getName()).replaceAll("<", "&lt;") %></p>
```

---

## 🧪 Testing & Debugging

### 1. Unit Testing Example
```java
import org.junit.Test;
import static org.junit.Assert.*;

public class UserDAOTest {
    
    @Test
    public void testAddUser() {
        UserDAO userDAO = new UserDAOImpl();
        User user = new User();
        user.setName("John Doe");
        user.setEmail("john@example.com");
        
        userDAO.add(user);
        
        User retrievedUser = userDAO.getByEmail("john@example.com");
        assertNotNull(retrievedUser);
        assertEquals("John Doe", retrievedUser.getName());
    }
}
```

### 2. Debugging with Logging
```java
import java.util.logging.Logger;

public class UserDAOImpl implements UserDAO {
    private static final Logger logger = Logger.getLogger(UserDAOImpl.class.getName());
    
    @Override
    public void add(User user) {
        logger.info("Adding user: " + user.getEmail());
        
        try {
            // Database operation
            logger.info("User added successfully");
        } catch (SQLException e) {
            logger.severe("Error adding user: " + e.getMessage());
        }
    }
}
```

### 3. Debugging JSP Pages
```jsp
<!-- Add debug output -->
<%@ page import="java.util.logging.Logger" %>
<%
    Logger logger = Logger.getLogger(this.getClass().getName());
    logger.info("Loaded menu page");
    
    List<Menu> items = (List<Menu>) request.getAttribute("menuItems");
    if (items != null) {
        logger.info("Menu items count: " + items.size());
    } else {
        logger.warning("No menu items found!");
    }
%>
```

### 4. Browser Developer Tools
```
1. Press F12 in browser
2. Check Console for JavaScript errors
3. Check Network tab for failed requests
4. Check Application tab for session/cookies
```

---

## 🔍 Common Development Issues

### Issue 1: Data Not Saving to Database
```
Check:
1. DAO is using correct table/column names
2. SQL syntax is correct
3. Connection is established
4. No SQL exceptions in logs
5. Transaction is committed (if using transactions)
```

### Issue 2: JSP Pages Not Displaying
```
Check:
1. JSP file path in request.getRequestDispatcher()
2. JSP file exists in src/main/webapp/
3. web.xml has correct welcome files
4. No compilation errors in JSP
```

### Issue 3: Session Data Lost
```
Check:
1. HttpSession obtained correctly: request.getSession()
2. Attributes set before setting response
3. Session timeout not exceeded
4. Browser cookies enabled
5. Not invalidating session accidentally
```

---

## 📈 Scaling Considerations

### For Production:
1. **Add connection pooling** (HikariCP)
2. **Implement caching** (Redis/Memcached)
3. **Use logging framework** (SLF4J/Logback)
4. **Add monitoring** (Prometheus/Grafana)
5. **Implement pagination** for large result sets
6. **Add load balancing** for multiple instances
7. **Use CDN** for static assets
8. **Implement API rate limiting**

---

## 🚀 Next Steps

1. Review the [STRUCTURE.md](./STRUCTURE.md) for detailed component descriptions
2. Follow [SETUP.md](./SETUP.md) for development environment setup
3. Start by modifying existing features
4. Gradually add new features following the workflow
5. Test thoroughly before deployment

---

**Last Updated**: April 28, 2026
**Version**: 1.0.0
