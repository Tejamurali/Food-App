<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.foodapp.model.Menu,java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu Page</title>
<link rel="stylesheet" href="menu">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  crossorigin="anonymous" referrerpolicy="no-referrer" />            

<style>
    @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Pacifico&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Merienda:wght@300..900&family=Pacifico&family=Timmana&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Moderustic:wght@700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Bungee+Tint&display=swap');
	
@charset "ISO-8859-1";

* {
    box-sizing: border-box;
    margin: 0;
}
.allmenus{
	position : fixed;
	display: flex;
	flex-direction : column;
	justify-content:space-around;
	width : 17vw;
	box-shadow : 0px 0px 1px ;
	max-height: 95vh;
    overflow-y: auto;
}
.listname{
	font-family: "Calistoga", serif;
	font-size : 1.8em;
	margin : 1rem 0rem 1.5rem 1rem;
}
.listmenus{
	font-family: "Moderustic", sans-serif;
	font-size : 1.2rem;
	padding : 0.5em;
	margin : 0em 0.5em 0em 0.5em ;
	text-decoration : none;
	color : black;
}
.listmenus:hover{
	color : white;
	background-color : rgba(255, 179, 0, 0.991);
}
.menunav{
	display: flex;
	flex-direction :row;
	justify-content:space-around;
	position : fixed;
	top : 0;
	left : 17vw;
	width: calc(100vw - 17vw);
	height : 3em;
	box-shadow : 0px 0px 1px ;
}
.menu-home{
	font-family: "Calistoga", serif;
	padding : 1em 5em;
	color :  #080808;
	text-decoration : none;
	
}
.menu-home:hover{
	color : white;
	background-color :  #080808;
}
.menu-container{
	display: flex;
	flex-direction :column;
	justify-content : flex-start;
	position : fixed;
	top : 14vh;
	left : 17vw;
	width: calc(100vw - 17vw);
	margin : 0 auto;
	gap : 20px;
	max-height: 83vh;
    overflow-y: auto;
    padding : 0.3rem 2rem;
}
.menucard{
	display: flex;
	justify-content : space-between;
	width: 100%;
	border-bottom : 2px solid silver;
	padding : 0.3rem 0rem;
}
.menucard-details-container{
	display: flex;
	flex-direction :column;
	width : 80%;
	
}
.restaurant-details{
	display: flex;
	flex-direction :row;
	justify-content :flex-start;
	width: calc(100vw - 19vw);
	position : fixed;
	left : 19vw;
	top : 7vh;
}
.restaurant-name{
	font-family: "Merienda", cursive;
	font-size : 2rem;
	background : linear-gradient(to right,rgb(2, 192, 244),rgb(2, 192, 244),rgb(3, 173, 116),rgb(244, 2, 228),red);
	-webkit-background-clip : text;
	background-clip : text;
	color : transparent;
	font-weight : bold;
}
.restaurant-address{
	font-size : 0.9rem;
	font-family : verdana;
}
.item-image{
	height : auto;
	width : 250px;
	border-radius : 5px;
}
.item-name{
	font-family: verdana;
	font-size : 1.3rem;
	font-weight : bold;
}
.item-price{
	font-family: "Calistoga", serif;
	font-size : 1.2rem;
	color : grey;
	margin : 0.5em 0em 0em 0em;
}
.item-description{
	font-family :verdana;
	max-width : 70%;
	color : grey;
	margin : 0.5em 0em 0em 0em;
}
.item-ratings{
	font-size : 1.2rem;
	margin : 0.5em 0em 0em 0.3em;
	font-family : verdana;
}
.ratingstar{
	color : gold;
	font-size : 1.3rem;
	font-weight : bold;
}
.menu-available{
	font-size : 1.2rem;
	font-family: impact;
	color : rgb(2, 174, 2);
}
.menu-notavailable{
	font-family :impact;
	color : red;

}
.item-isavailable{
	margin : 1em 0em 1em 0.1em;
}
.add-to-cart-btn{
	border : 0;
	padding : 0.3em;
	font-family : verdana;
	font-weight : lighter;
	text-decoration : none;
	cursor : pointer;
	background-color : white;
	color : black;
	margin : 0.3rem 0rem;
	box-shadow : 0px 0px 3px black;
}
.add-to-cart-btn:hover{
	font-family: "Calistoga", serif;
	background-color : rgb(219, 5, 112);
	transition : 0.5s;
	color :white;
	font-weight : lighter;
	box-shadow : 1px 1px 5px rgb(219, 5, 112);
	text-align : center;
	border : 0;
	padding : 0.4em;
	border-radius : 2px;
}
.quantity{
    border : 2px solid skyblue;
	height : 20px;
	font-size : 1rem;
	cursor : pointer;
}
.quantity:focus{
	color : green;
	font-weight : bold;
}

.cart-popup {
	display: flex;
	flex-direction :row;
	justify-content :space-between;
    position: fixed;
    bottom: 0px;
    left: 59%;
    transform: translateX(-50%);
    background-color:green;
    color : white;
    padding:0px 10px 0px 10px;
    border-radius: 5px;
    opacity: 0;
    width : 78%;
    transition: bottom 0.3s ease, opacity 0.3s ease;
}

.cart-popup.show {
    bottom: -15px;
    opacity: 1;
}
.viewCartLink{
    color: white;
    text-decoration: none;
    font-weight: bold;
    padding :0.5rem 2rem;
    border-radius : 5px;
    border : 0;
    background-color : green;
    cursor : pointer;
    margin : 0.5rem 0rem 0rem 0rem;
    
}

.viewCartLink:hover {
	background-color : white;
	color :  #080808;
    font-weight: bold;
    transition : 0.5s;
    box-shadow : 0px 0px 10px white;
}
.bottomicon{
	font-family: "Calistoga", serif;
	padding : 1em 5em;
	color :  #080808;
	text-decoration : none;
}
.bottomicon:hover{
	color : white;
	background-color : rgba(0, 0, 0, 0.902);
}
.empty-menu{
	display : flex;
	flex-direction : row;
	justify-content:center;
	align-items : center;
	height : 80vh;
}
.empty-menu-msg{
	font-family : "Calistoga", serif;
	font-size : 2rem;
	color : skyblue;
}
.night-mode {
            background-color:  #080808;
        }
.night-mode .menunav, .night-mode .allmenus{
 	border : 2px solid white;
 }
 .night-mode .listmenus{
 	color : rgb(3, 185, 124);
 }
 .night-mode .listmenus:hover{
 	background-color : rgb(245, 132, 47);
 	color : white;
 }
 .night-mode .listname, .night-mode .menu-home, .night-mode .bottomicon, .night-mode .item-name,
  .night-mode .item-description, .night-mode .itemprice, .night-mode .item-ratings
 {
 	color : white;
 }
  .night-mode .menu-home:hover, .night-mode .bottomicon:hover{
 	background-color : rgb(245, 132, 47);
 	color : white;
 }
 .night-mode .menucard{
 	border-bottom : 1px solid white;
 	transition : ease-in-out 1s;
 	
 }
 .night-mode  .add-to-cart-btn{
 	background-color :  #080808;
 	color : white;
 	border : 1px solid rgb(219, 5, 112);
 }
 .night-mode .add-to-cart-btn:hover{
	font-family: "Calistoga", serif;
	background-color : rgb(219, 5, 112);
	transition : 0.5s;
	color :white;
	font-weight : lighter;
	box-shadow : 1px 1px 10px rgb(219, 5, 112);
	text-align : center;
	border : 0;
	padding : 0.4em;
	border-radius : 2px;
}

.night-mode .quantity{
	background-color :  #080808;
	color : white;
}

</style> 
</head>
<body id="body">
	<% ArrayList<Menu> menuList = (ArrayList) session.getAttribute("menuList"); %>
	<% 
    int userId = 0;
	 if (session.getAttribute("userId") != null) {
		 userId = (Integer) session.getAttribute("userId");
	    }
	%>
	
	<nav id="menunav" class="menunav">
		<a href="home.jsp" class="menu-home">Home</a>
		<a href="RestaurantServlet?userId=<%=userId %>" class="menu-home">Restaurants</a>
		
		<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
         </a>
	</nav>
	<%if(menuList != null){ %>
	
	
	<% String email = (String) session.getAttribute("email"); %>
	
	
	<div class="restaurant-details">
		<p class="restaurant-name">${sessionScope.restaurantName}<span class="restaurant-address">&nbsp;&nbsp;&nbsp;- ${sessionScope.address}</span></p>
	</div>
	
	<div class="allmenus">
		<p class="listname">MENU</p>
		<% for(Menu menu: menuList) { %>
			<a  class="listmenus" href="#<%=menu.getMenuName()%>"><%out.println(menu.getMenuName()); %></a><br>
		<%} %>
	</div>

	<div class="menu-container">
		<% for(Menu menu: menuList) { %>
    	<div id="<%=menu.getMenuName()%>" class="menucard">
        
        <div class="menucard-details-container">
        <span class="item-name"><% out.println(menu.getMenuName()); %></span>
        <span class="item-price">&#8377; <% out.println(menu.getPrice()); %></span>
        <span class="item-ratings"><% out.println(session.getAttribute("ratings")); %><span class="ratingstar"> &#x2605;</span></span>
        <span class="item-description"><% out.println(menu.getDescription()); %></span>
       
        <span class="item-isavailable">
            <% if(menu.getIsAvailable().toLowerCase().equals("yes")) { %>
            <span class="menu-available">Available</span>
            
            <% } else { %>
            <span class="menu-notavailable">Not Available</span>
         	<% } %>
        </span>
        <%if(menu.getIsAvailable().toLowerCase().equals("yes")){ %>
        <form action="CartServlet">
        <button class="add-to-cart-btn">ADD TO CART</button>
         &nbsp; <input class="quantity" name="quantity" type="number" value="1" min="1">
         <input type="hidden" name="itemId" value="<%out.println(menu.getMenuId()); %>" >
         <input type="hidden" name="action" value="add">
         <input type="hidden" name="userId" value="<%=userId%>">
         <input type="hidden" name="email" value="<%=email%>">
         </form>
         <%} %>
         </div>
         
         <div class="menucard-img-container">
        	<img class="item-image" alt="<%=menu.getMenuName() %>" src="<%=menu.getImgPath()%>">
        </div>
         
    </div>
		<% } %>
	</div>
	<%}else{ %>
		<div class="empty-menu">
        	<p class="empty-menu-msg">No Menu Avialable !!...</p>
        </div>
	<%} %>
 <script>
        const toggleButton = document.getElementById('nightModeToggle');
		const body = document.getElementById('body');
		const modeIcon = document.getElementById('modeIcon');
		const menunav = document.getElementById('menunav');
		
        toggleButton.addEventListener('click', function() {
            body.classList.toggle('night-mode');
            menunav.classList.toggle('night-mode');
            
            if (menunav.classList.contains('night-mode')) {
                modeIcon.innerHTML = "<i class='fas fa-sun'></i>"; 
                toggleButton.innerHTML = "<span id='modeIcon'><i class='fas fa-sun'></i></span> Day Mode";
            } else {
                modeIcon.innerHTML = "<i class='fas fa-moon'></i>";
                toggleButton.innerHTML = "<span id='modeIcon'><i class='fas fa-moon'></i></span> Night Mode";
            }
        });
    </script>
    
</body>
</html>