<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,com.foodapp.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Restaurant Page</title>
<link rel="stylesheet" href="restaurant">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  crossorigin="anonymous" referrerpolicy="no-referrer" />            

<style>
    @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Pacifico&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Moderustic:wght@700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Bungee+Tint&display=swap');
	
* {
	box-sizing: border-box;
	margin: 0;
}

.allrestaurants{
	position : fixed;
	top : 3px;
	display: flex;
	flex-direction : column;
	justify-content:space-around;
	width : 18em;
	box-shadow : 0px 0px 1px ;
	max-height: 95vh;
    overflow-y: auto;
}
.listname{
	font-family: "Calistoga", serif;
	font-size : 1.8em;
	margin : 1rem 0rem 1.5rem 1rem;
}
.listrestaurants{
	font-family: "Moderustic", sans-serif;
	font-size : 1.2rem;
	padding : 0.5em;
	margin : 0em 0.5em 0em 0.5em ;
	text-decoration : none;
	color : black;
}
.listrestaurants:hover{
	color : white;
	background-color : rgba(255, 179, 0, 0.991);
}
.restaurantcontainer{
	
	display: flex;
	flex-direction :row;
	justify-content:space-between;
	flex-wrap: wrap;
	position : fixed;
	width : 80%;
	top : 5em;
	left : 20em;
	max-height: 90vh;
    overflow-y: auto;
    padding : 1rem;
}
.restaurant-card{
	margin : 0em 0em 2em 0em;
	width : 25em;
	height : 20em;
	border : 1px solid silver;
	border-radius : 10px 10px 0px 0px ;
}
.restaurantnav{
	display: flex;
	flex-direction :row;
	justify-content:space-around;
	position : fixed;
	left : 18.2em;
	width :90%;
	height : 3em;
	box-shadow : 1px 1px 2px ;
}
.restaurant-home{
	font-family: "Calistoga", serif;
	padding : 1em 5em;
	color :  #080808;
	text-decoration : none;
	
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
.restaurant-home:hover{
	color : white;
	background-color : rgba(0, 0, 0, 0.902);
}
.restaurant-img{
	height : 200px;
	width : 396px;
	border-radius : 10px 10px 0px 0px ;
}
.restaurant-name{
	font-family: "Moderustic", sans-serif;
	font-size : 1.5rem;
	color : silver;
}
.card-details{
	height : 7em;
	
	border-radius : 3px;
}
.card-details2{
	margin : 0.2rem 0rem 0rem 0rem;
	display: flex;
	flex-direction :row;
	justify-content:space-around;
	
}
.restaurant-cuisine{
	padding : 0.3em 0em;
	font-weight : bold;
	color : grey;
}
.breakline{
	font-size : 29px;
}
.restaurant-delivarttime{
	padding : 0.4em 0em;
	font-weight : bold;
	color : grey;
}
.restaurant-ratings{
	font-weight : bold;
	margin : 0em 0em 0.2em 0em;
}
.restaurant-isactive{
	padding : 0.4em 0em;
}
.cuisinetype{
	padding : 0.1rem 0.5rem;
	border-radius : 10px;
	background-color : rgba(240, 188, 188, 0.998);
	color : red;
	font-weight : bold;
	margin : 0rem 0rem 0rem 0.3rem;
}
.ratingstar{
	font-size : 1.3em;
	color : gold;
	font-weight : bold;
}
.restaurant-open{
	font-family :impact;
	color : rgb(2, 174, 2);
}
.restaurant-closed{
	font-family :impact;
	color : red;

}
.restaurant-address{
	font-family :verdana;
	padding : 0.5em 0em 0em 0.5em;
	font-size : 1rem;
	font-weight: 100;
	color : grey;
}
.viewcart-container{
	display: flex;
	flex-direction :row;
	justify-content:space-between;
	
}
.viewcart{
	font-weight : bold;
	margin : 0.5rem;
	padding : 0.3rem 0.5rem 0.3rem 0.5rem;
	color : orangered;
	border-radius : 5px;
	box-shadow : 0px 0px 4px orangered;
	text-decoration : none;
	font-family: "Moderustic", sans-serif; 
}
.viewcart:hover{
	font-family: "Calistoga", serif;
	background-color : rgb(219, 5, 112);
	transition : 0.5s;
	color :white;
	font-weight : lighter;
	box-shadow : 1px 1px 10px rgb(219, 5, 112);
}
.empty-restaurant{
	display : flex;
	flex-direction : row;
	justify-content:center;
	align-items : center;
	height : 80vh;
}
.empty-restaurant-msg{
	font-family : "Calistoga", serif;
	font-size : 2rem;
	color : skyblue;
}

.night-mode {
            background-color:  #080808;
        }
 .night-mode .restaurantnav, .night-mode .allrestaurants{
 	border : 2px solid white;
 }
 .night-mode .listrestaurants{
 	color : rgb(3, 185, 124);
 }
 .night-mode .listrestaurants:hover{
 	background-color : rgb(245, 132, 47);
 	color : white;
 }
 .night-mode .listname, .night-mode .restaurant-home, .night-mode .bottomicon, .night-mode .restaurant-ratings{
 	color : white;
 }
  .night-mode .restaurant-home:hover, .night-mode .bottomicon:hover{
 	background-color : rgb(245, 132, 47);
 	color : white;
 }

 .night-mode .card-details{
 	border-top : 1px solid white;
 }
 .night-mode .viewcart{
 	color : rgb(3, 185, 124);
 }
 .night-mode .viewcart:hover{
 	color : white;
 }
{
 	
 }
 
 
    
	
</style>         
</head>
<body id="body">
	<% ArrayList<Restaurant> restaurantList =  (ArrayList<Restaurant>)session.getAttribute("restaurantList"); %>
	
	<% 
    int userId = 0;
	 if (session.getAttribute("userId") != null) {
		 userId = (Integer) session.getAttribute("userId");
	    }
	%>
	
	<%String email = (String)session.getAttribute("email"); %>
	<nav id="restaurantnav" class="restaurantnav">
		<a href="home.jsp" class="restaurant-home">Home</a>
		<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
            </a>
	</nav>
	
	<%if(restaurantList != null){ %>
	<div class="allrestaurants">
		<p class="listname">ALL RESTAURANTS</p>
		<% for(Restaurant restaurant : restaurantList){ %>
			<a class="listrestaurants" href="#<%=restaurant.getRestaurantName()%>"><%out.println(restaurant.getRestaurantName()); %></a><br>
		<%} %>
	</div>
		<div class="restaurantcontainer">
		<%for(Restaurant restaurant : restaurantList){ %>
		
			<div id="<%=restaurant.getRestaurantName() %>" class="restaurant-card">
			<img class="restaurant-img" alt="<%=restaurant.getRestaurantName() %>" src="<%=restaurant.getImgPath()%>">
			<div class="card-details">
			<span class="restaurant-name"><%out.println(restaurant.getRestaurantName());%></span><br>
			<div class="card-details2">
				<span class="restaurant-cuisine">Cusine <span class="cuisinetype"><%out.println(restaurant.getCuisineType());%></span></span>
				<span class="restaurant-delivarttime">25-<%out.println(restaurant.getDeliveryTime());%> min</span>
				<span class="restaurant-ratings"><%out.println(restaurant.getRatings());%> <span class="ratingstar">&#x2605;</span></span>
				<span class="restaurant-isactive">
				<%if(restaurant.getIsActive().toLowerCase().equals("yes")){%>
				<span class="restaurant-open">Open</span>
				<%}else{ %>
				<span class="restaurant-closed">Closed</span>
				<%} %>
				</span>
			</div>
			<div class="viewcart-container">
				<p class="restaurant-address"><%out.println(restaurant.getAddress());%></p>
				
				<%if(restaurant.getIsActive().toLowerCase().equals("yes")){ %>
				<a class="viewcart" href="MenuServlet?restaurantId=<% out.println(restaurant.getRestaurantId());
				%>&&restaurantName=<%out.println(restaurant.getRestaurantName());
				%>&&address=<%out.println(restaurant.getAddress());
				%>&&ratings=<%out.println(restaurant.getRatings());
				%>&&userId=<%=userId%>&&email=<%=email%>">View Menu</a>
				<%} %>
			</div>
			</div>
		</div>
		<%} %>
	  </div>
	  <%}else{ %>
	  	<div class="empty-restaurant">
        	<p class="empty-restaurant-msg">No Restaurants Avialable !!...</p>
        </div>
	  <%} %>
	  <script>
        const toggleButton = document.getElementById('nightModeToggle');
		const body = document.getElementById('body');
		const modeIcon = document.getElementById('modeIcon');
		const restaurantnav = document.getElementById('restaurantnav');
		
        toggleButton.addEventListener('click', function() {
            body.classList.toggle('night-mode');
            restaurantnav.classList.toggle('night-mode');
            
            if (restaurantnav.classList.contains('night-mode')) {
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