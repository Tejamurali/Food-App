# Food-App - Food Ordering & Delivery System

## 📱 Project Overview

**Food-App** is a comprehensive Java-based web application for food ordering and delivery. It connects customers with restaurants, allowing them to browse menus, place orders, and track their delivery status.

**Type**: Full-stack Web Application  
**Architecture**: 3-Layer MVC (Model-View-Controller)  
**Target Users**: Customers, Restaurants, Delivery Partners  

---

## ✨ Key Features

### 👤 User Management
- **User Registration** - Create new customer accounts
- **User Login/Logout** - Secure authentication
- **Profile Management** - Update personal information
- **Address Management** - Multiple delivery addresses
- **Order History** - View all previous orders

### 🏪 Restaurant & Menu
- **Browse Restaurants** - Search and filter by cuisine/location
- **Menu Exploration** - View items, prices, descriptions
- **Category Filtering** - Filter items by food category
- **Cuisine Filter** - Find restaurants by cuisine type
- **Ratings & Reviews** - View restaurant ratings

### 🛒 Shopping Cart
- **Add to Cart** - Add food items with quantity
- **Cart Management** - Update quantities, remove items
- **Price Calculation** - Automatic total calculation
- **Persistent Session** - Cart saved during session

### 🎫 Order Management
- **Place Order** - Confirm and submit order
- **Order Confirmation** - View order details and confirmation
- **Billing Details** - Itemized bill display
- **Order Tracking** - Track order status
- **Order History** - View all past orders

### 🔒 Security
- **Password Protection** - Encrypted password storage
- **Session Management** - Secure user sessions
- **Input Validation** - Server-side validation
- **SQL Injection Prevention** - Prepared statements

---

## 🛠️ Technology Stack

### Backend
- **Language**: Java 11
- **Framework**: Apache Servlets & JSP (Java Server Pages)
- **Build Tool**: Maven 3.6+
- **Web Server**: Apache Tomcat 9.0+

### Frontend
- **Templates**: JSP (Java Server Pages)
- **Styling**: CSS 3
- **Scripts**: JavaScript (for client-side interactions)
- **Template Engine**: JSTL (JSP Standard Tag Library)

### Database
- **DBMS**: MySQL 5.7+
- **Driver**: MySQL JDBC Connector
- **Access Pattern**: DAO (Data Access Object) Pattern

### Additional Libraries
- **Servlet API** 4.0.1
- **JSP API** 2.3.3
- **JSTL** 1.2
- **JUnit** 4.13 (Testing)

---

## 📋 System Requirements

### Minimum Requirements
- **OS**: Windows 7+, macOS 10.12+, Ubuntu 16.04+
- **RAM**: 2GB
- **Disk Space**: 500MB
- **Java**: JDK 11 or higher
- **Maven**: 3.6 or higher
- **MySQL**: 5.7 or higher

### Recommended Requirements
- **RAM**: 4GB+
- **Disk Space**: 1GB+
- **Processor**: Intel i5 or equivalent
- **IDE**: IntelliJ IDEA, Eclipse, or VS Code

---

## 🚀 Quick Start

### 1️⃣ Prerequisites
```bash
# Verify Java
java -version

# Verify Maven
mvn -version

# Verify MySQL
mysql --version
```

### 2️⃣ Database Setup
```bash
mysql -u root -p
CREATE DATABASE foodapp_db;
USE foodapp_db;
# Run SQL scripts from docs/database.sql
```

### 3️⃣ Clone Project
```bash
git clone https://github.com/Tejamurali/Food-App.git
cd Food-App
```

### 4️⃣ Configure Database
Edit `src/main/resources/db.properties`:
```properties
db.username=root
db.password=your_password
```

### 5️⃣ Build Project
```bash
mvn clean install
```

### 6️⃣ Run Application
```bash
mvn tomcat7:run
```

### 7️⃣ Access Application
Open browser and navigate to:
```
http://localhost:8080/Food-App
```

---

## 📁 Project Structure

```
Food-App/
├── src/
│   ├── main/
│   │   ├── java/com/foodapp/          ← Java source code
│   │   │   ├── connection/            ← Database connection
│   │   │   ├── model/                 ← Entity classes
│   │   │   ├── dao/                   ← DAO interfaces
│   │   │   ├── daoimpl/               ← DAO implementations
│   │   │   └── servlets/              ← Request handlers
│   │   ├── resources/                 ← Configuration files
│   │   │   └── db.properties          ← Database config
│   │   └── webapp/                    ← Web content
│   │       ├── WEB-INF/               ← Deployment descriptor
│   │       └── *.jsp                  ← JSP pages
│   └── test/                          ← Unit tests
│
├── target/                            ← Build output
├── pom.xml                            ← Maven configuration
├── README.md                          ← This file
├── STRUCTURE.md                       ← Project structure guide
├── SETUP.md                           ← Installation guide
└── DEVELOPMENT.md                     ← Developer guide
```

---

## 📊 Database Schema

### Core Tables

| Table | Purpose | Key Columns |
|-------|---------|------------|
| `users` | User accounts | user_id, email, password, phone |
| `restaurants` | Restaurant info | restaurant_id, name, location, rating |
| `menu` | Food items | menu_id, item_name, price, restaurant_id |
| `category` | Food categories | category_id, category_name |
| `orders` | Order records | order_id, user_id, total_amount, order_date |
| `order_items` | Order line items | order_item_id, order_id, menu_id, quantity |
| `cart` | Shopping carts | cart_id, user_id |
| `order_history` | Historical orders | history_id, user_id, order_date |

---

## 🔄 User Workflow

### Customer Journey

```
1. REGISTRATION/LOGIN
   ├─ Register new account
   └─ Login with credentials

2. BROWSE
   ├─ View restaurants
   ├─ Filter by cuisine type
   └─ View restaurant details

3. SHOPPING
   ├─ View menu items
   ├─ Select category
   ├─ Add items to cart
   └─ Review cart

4. CHECKOUT
   ├─ View billing details
   ├─ Confirm order
   └─ Place order

5. TRACKING
   ├─ View order confirmation
   ├─ Check order status
   └─ View order history

6. ACCOUNT
   ├─ Update profile
   ├─ Manage addresses
   └─ Logout
```

---

## 🎯 API Endpoints (Servlets)

### Authentication
- `POST /login` - User login
- `POST /register` - New user registration
- `GET /logout` - User logout

### Browsing
- `GET /category` - View food categories
- `GET /cuisine` - Filter by cuisine
- `GET /restaurant` - View restaurant details
- `GET /menu` - View menu items

### Shopping
- `POST /cart` - Add/update cart
- `GET /cart` - View cart
- `POST /placeOrder` - Place order

### Account
- `GET /profile` - View profile
- `POST /updateProfile` - Update profile
- `GET /orderHistory` - View past orders
- `GET /bill` - View bill details

---

## 🔐 Security Features

### Authentication
- ✅ Secure login with email/password
- ✅ Session management
- ✅ Session timeout (30 minutes)
- ✅ Automatic logout

### Data Protection
- ✅ Prepared statements (SQL injection prevention)
- ✅ Input validation
- ✅ HTTPS ready
- ✅ XSS protection

### Database
- ✅ Encrypted passwords (recommended: BCrypt)
- ✅ Primary/Foreign key constraints
- ✅ Database integrity checks

---

## 📈 Performance Features

### Optimization
- Connection pooling for database
- Optimized SQL queries with indexes
- Session caching for users
- Minimal database calls

### Scalability
- Stateless servlet design
- Horizontal scalability ready
- Load balancer compatible
- Database clustering ready

---

## 🧪 Testing

### Unit Tests
```bash
mvn test
```

### Integration Tests
1. Manual testing via UI
2. API testing using Postman/curl
3. Database verification

### Test Credentials
```
Email: john@example.com
Password: password123
```

---

## 📚 Documentation

| Document | Purpose |
|----------|---------|
| **README.md** | Project overview (you are here) |
| **STRUCTURE.md** | Complete project structure guide |
| **SETUP.md** | Installation & configuration guide |
| **DEVELOPMENT.md** | Developer guide & best practices |

---

## 🐛 Troubleshooting

### Common Issues

**Issue**: "Connection refused" error
```
Solution: Ensure MySQL server is running
mysql.server start
```

**Issue**: Port 8080 already in use
```
Solution: Kill process or use different port
lsof -i :8080
kill -9 <PID>
```

**Issue**: Build fails
```
Solution: Clean and rebuild
mvn clean install
```

For more issues, see [SETUP.md](./SETUP.md) troubleshooting section.

---

## 🤝 Contributing

### Development Workflow
1. Create feature branch
2. Make changes
3. Test locally
4. Commit with clear messages
5. Push to GitHub
6. Create Pull Request

### Code Standards
- Follow Java conventions
- Use meaningful variable names
- Add comments for complex logic
- Validate all inputs
- Test before pushing

---

## 📝 License

This project is open source and available under the MIT License.

---

## 👨‍💻 Author

**Tejamurali**  
GitHub: [@Tejamurali](https://github.com/Tejamurali)  
Repository: [Food-App](https://github.com/Tejamurali/Food-App)

---

## 🔗 Useful Links

- [Java Documentation](https://docs.oracle.com/javase/11/)
- [Apache Servlet Documentation](https://projects.eclipse.org/projects/ee4j.servlet)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Maven Guide](https://maven.apache.org/guides/)
- [Apache Tomcat](https://tomcat.apache.org/)

---

## 📞 Support

### Getting Help
1. Check [SETUP.md](./SETUP.md) for troubleshooting
2. Review [DEVELOPMENT.md](./DEVELOPMENT.md) for examples
3. Check [STRUCTURE.md](./STRUCTURE.md) for project details
4. Create GitHub Issues for bugs

### Report Issues
Visit: https://github.com/Tejamurali/Food-App/issues

---

## 🎉 Getting Started

**Ready to get started?**

1. Follow [SETUP.md](./SETUP.md) for installation
2. Review [STRUCTURE.md](./STRUCTURE.md) for project organization
3. Read [DEVELOPMENT.md](./DEVELOPMENT.md) for coding guidelines
4. Start developing!

---

## 📊 Project Statistics

- **Total Java Classes**: 29
- **Total JSP Pages**: 14
- **CSS Files**: 12
- **Database Tables**: 8
- **Servlets**: 13
- **Lines of Code**: ~5000+
- **Development Time**: Active
- **Version**: 1.0.0

---

## 🚀 Roadmap

### v1.0 (Current)
- ✅ User authentication
- ✅ Restaurant browsing
- ✅ Order placement
- ✅ Order tracking

### v1.1 (Planned)
- 🔄 Payment gateway integration
- 🔄 Real-time order tracking
- 🔄 User reviews & ratings
- 🔄 Mobile responsiveness

### v2.0 (Future)
- 📋 REST API
- 📋 Mobile app
- 📋 Admin dashboard
- 📋 Analytics

---

**Last Updated**: April 28, 2026  
**Version**: 1.0.0  
**Status**: Active Development  
