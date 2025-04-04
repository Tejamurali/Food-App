<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,com.foodapp.model.Category" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category Page</title>
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
	box-shadow : 0px 0px 3px black;
	border-radius : 0px 5px 5px 0px;;
	width : 28%;
	height : 16%;
	margin : 1rem 0rem ;
	background : linear-gradient(130deg,white,white,#FFCE01,#FFCE01,#FFCE01);
	display : flex;
	flex-direction : row;
	justify-content : space-between;
	align-items : center;
}
.cuisine-name{
	font-family: "Moderustic", sans-serif;
	text-decoration : none;
	font-weight : bold;
	font-size : 1.5rem;
	background : linear-gradient(130deg,white,white,black,black,black);
	-webkit-background-clip : text;
	background-clip : text;
	color : transparent;
}
.cuisine-img{
	height : auto;
	width : 30%;
	border-radius : 0px 5px 5px 0px;
}
.explore{
 	text-decoration : none;
 	color : black;
 	font-size : 1rem;
 	font-family: "Moderustic", sans-serif;
 	padding : 0.3rem 1rem;
 	color : white;
 	border : 1px solid white;
 	margin : 0rem 0.2rem; 
 	font-weight : bold;
 	
}
.explore:hover{
	background : linear-gradient(to right ,white,rgb(4, 183, 254),rgb(4, 183, 254),rgb(4, 183, 254),white);
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

.night-mode .cuisine-card{
	border : 2px solid white;
	box-shadow : 0px 0px 5px white;
}
</style>
</head>
<body id="body">
	<% ArrayList<Category> categoryList =  (ArrayList<Category>)session.getAttribute("categoryList"); %>
	<% 
    int userId = 0;
	 if (session.getAttribute("userId") != null) {
		 userId = (Integer) session.getAttribute("userId");
	    }
	%>

	<div id="title" class="title">
		
		<a class="your-cart">&#x1F37D; Category</a>
		<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
         </a>
		<a href="home.jsp"  class="home">Home</a>
	</div>
		<%if(categoryList != null) {%>
	<div class="cuisine-container">
		<%for(Category category : categoryList){ %>
		<div class="cuisine-card">
		<img class="cuisine-img" alt="<%=category.getCategoryName() %>" src="<%=category.getImgPath()%>">
		<a class="cuisine-name"><%=category.getCategoryName() %></a>
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