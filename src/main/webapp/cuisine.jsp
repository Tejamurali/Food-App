<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,com.foodapp.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cuisine Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  crossorigin="anonymous" referrerpolicy="no-referrer" />            

<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Merienda:wght@300..900&family=Pacifico&family=Timmana&display=swap');
	 @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
	

* {
    box-sizing: border-box;
    margin: 0;
}
.title{
	position : fixed;
	width : 100%;
	display : flex;
	justify-content : space-around;
	font-size : 1.1rem;
	box-shadow : 1px 1px 3px black;
	font-family : "Calistoga", serif;
}
.your-cart{
	color : rgb(245, 132, 47);
	padding : 0.5em 5em;
	font-size : 1.1rem;
}
.bottomicon{
	font-family: "Calistoga", serif;
	padding : 0.5em 5em;
	color : rgb(245, 132, 47);
	text-decoration : none;
}
.bottomicon:hover{
	color : white;
	background-color : #080808;
}
.home{
	font-family: "Calistoga", serif;
	padding : 0.5em 5em;
	color : rgb(245, 132, 47);
	text-decoration : none;
	text-align : left;
}
.home:hover{
	color : white;
	background-color : rgba(0, 0, 0, 0.902);
}
.cuisine-container{
	position : fixed;
	top : 4rem;
	width : 100vw;
	height : 90vh;
	display : flex;
	justify-content : space-between;
	flex-wrap : wrap;
	padding : 1rem;
	gap : 5%;
	overflow-y : auto;
}
.cuisine-card{
	border : 2px solid black;
	box-shadow : 0px 0px 2px black;
	border-radius : 5px;
	width : 28%;
	height : 18%;
	margin : 1rem 0rem ;
	display : flex;
	flex-direction : row;
	justify-content : space-between;
	align-items : center;
	padding : 0.2rem;
}
.cuisine-name{
	font-family: "Moderustic", sans-serif;
	text-decoration : none;
	font-weight : bold;
	font-size : 1.5rem;
	background : linear-gradient(to right ,black,rgb(4, 183, 254),rgb(4, 183, 254),black,black,black);
	-webkit-background-clip : text;
	background-clip : text;
	color : transparent;
}
.cuisine-img{
	height : 15vh;
	width : 13vw;
}
.explore{
 	text-decoration : none;
 	color : black;
 	font-size : 1rem;
 	font-family: "Moderustic", sans-serif;
 	padding : 0.3rem 1rem;
 	color : grey;
 	font-weight : bold;
}
.explore:hover{
	background : linear-gradient(to right ,black,rgb(4, 183, 254),rgb(4, 183, 254),black);
	color : white;
	transition : 0.3s;
}
.empty-cuisine{
	display : flex;
	flex-direction : row;
	justify-content:center;
	align-items : center;
	height : 80vh;
}
.empty-cuisine-msg{
	font-family : "Calistoga", serif;
	font-size : 2rem;
	color : skyblue;
}

.night-mode {
            background-color : #080808;
        }
.night-mode .title{
	border : 2px solid white;
	box-shadow : 1px 1px 5px white;
}

 .night-mode .your-cart, .night-mode .home, .night-mode .bottomicon
 {
 	color : white;
 }
 .night-mode .bottomicon:hover, .night-mode .home:hover{
 	background-color : rgb(245, 132, 47);
 	color : white;
 }
 .night-mode .cuisine-name{
	
	background : linear-gradient(to right ,white,rgb(4, 183, 254),rgb(4, 183, 254),white);
	-webkit-background-clip : text;
	background-clip : text;
	color : transparent;
}
.night-mode .cuisine-card{
	border : 2px solid white;
	box-shadow : 0px 0px 2px white;
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

	<div id="title" class="title">
		
		<a class="your-cart">&#x1F37D; Cuisine</a>
		<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
         </a>
		<a href="home.jsp"  class="home">Home</a>
	</div>
		<%if(restaurantList != null) {%>
	<div class="cuisine-container">
		<%for(Restaurant rest : restaurantList){ %>
		<div class="cuisine-card">
		<img class="cuisine-img" alt="<%=rest.getRestaurantName() %>" src="<%=rest.getImgPath()%>">
		<a class="cuisine-name"><%=rest.getCuisineType() %></a>
		<a href="RestaurantServlet?userId=<%=userId %>" class="explore">Explore</a>
		</div>
		<%} %>
	</div>
	<%}else{ %>
	<div class="empty-cuisine">
        	<p class="empty-cuisine-msg">No Cuisines Avialable !!...</p>
        </div>
	<%} %>
	<script>
        const toggleButton = document.getElementById('nightModeToggle');
		const body = document.getElementById('body');
		const modeIcon = document.getElementById('modeIcon');
		const title = document.getElementById('title');
		
        toggleButton.addEventListener('click', function() {
            body.classList.toggle('night-mode');
            title.classList.toggle('night-mode');
            
            if (title.classList.contains('night-mode')) {
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