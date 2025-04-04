<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ page import="java.util.ArrayList,com.foodapp.model.User,com.foodapp.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="home">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  crossorigin="anonymous" referrerpolicy="no-referrer" />            

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.4/lottie.min.js"></script>
 <script>
        function showSuccessPopup(userName) {
        	
            var popup = document.createElement('div');
            popup.className = 'popup';

            var popupContent = document.createElement('div');
            popupContent.className = 'popup-content';

            var closeButton = document.createElement('span');
            closeButton.className = 'popup-close';
            closeButton.innerText = '×';
            closeButton.onclick = function() {
                document.body.removeChild(popup);
            };

            var message = document.createElement('p');
            message.innerText = " Welcome " + userName + " \n\n" +
            	" You're Successfully Registered...\n\n"+
                "You can now log in and start exploring all the features we offer.\n\n" +
                "If you need any help or have any questions, feel free to reach out to our help?.";

            popupContent.appendChild(closeButton);
            popupContent.appendChild(message);
            popup.appendChild(popupContent);
            document.body.appendChild(popup);

            popup.style.display = 'block';

            window.onclick = function(event) {
                if (event.target === popup) {
                    document.body.removeChild(popup);
                }
            }
        }
    </script>

</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Moderustic:wght@700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Bungee+Tint&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Merienda:wght@300..900&family=Pacifico&family=Timmana&display=swap');
	

* {
    box-sizing: border-box;
    margin: 0;
}

.leftnavbar {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    position: fixed;
    height: 100vh; 
    width: 15vw; 
    box-shadow: 1px 1px 5px;
    overflow-y: auto; 
}


.topnavbar {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    position: fixed;
    height: 3.4rem; 
    width: calc(100vw - 15vw); 
    margin-left: 15vw; 
    box-shadow: 1px 1px 5px;
    z-index: 1;
}

.logo {
    font-size: 1.2rem; 
    font-family: "Bungee Tint", sans-serif;
    padding: 1rem 1rem 0.5rem;
    box-shadow: 1px 1px 5px rgb(245, 132, 47);
}

.topicon, .bottomicon {
    font-family: "Moderustic", sans-serif;
    margin: 1rem 0.5rem;
    display: block;
    color: black;
    text-decoration: none;
    padding: 0.5rem 0.5rem 0.5rem 1rem;
    font-size: 1.2rem; 
}


.topicon:hover, .bottomicon:hover  {
    background-color: rgb(245, 132, 47);
    color: white;
}

#help {
    font-size: 1rem; 
    border: 1px solid black;
    padding: 0rem 0.5rem; 
    border-radius: 30px;
    margin: 0 0.2rem;
}

.line {
    height: 1px;
    width: 80%; 
    background-color: grey;
    margin: 0 auto;
}

.tools {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    width: 13rem;
}

.welcomemsg {
    font-family: "Moderustic", sans-serif;
    font-weight : bold;
    font-size : 1.5rem;
}
.welcomemsg2 {
    font-family: "Moderustic", sans-serif;
    font-weight : bold;
    font-size : 1.5rem;
}
.welcome{
	display : flex;
	justify-content : space-around;
 	width : 25%;
 	text-align : center;
 	align-items : center;
}
.searchinput {
    letter-spacing: 0.2ch;
    font-family: "Calistoga", serif;
    width: 40vw; 
    height: 2em;
    border: 2px solid black;
    margin: 0.5rem;
}

#searchinput:focus {
    color: red;
    outline-color : rgb(1, 181, 252);
}

.searchinput::placeholder {
    font-size: 1.3em;
}

.searchbtn {
    width: 8vw; 
    height: 2rem;
    border: 0;
    color: white;
    border-radius: 5px;
    background-color: black;
}

.searchbtn:hover {
    background-color: rgb(245, 132, 47);
    color: white;
    font-weight: bold;
    border: 0;
    cursor: pointer;
    box-shadow: 1px 1px 10px rgb(245, 132, 47);
}

.profileimg {
    width: 3rem;
    height: 3rem;
    border-radius : 30px;
}

.notification {
    font-size: 1.3rem;
    margin: 0.5em 0em 0em 1em ;
}

.settings {
	margin : 0.15em 0em 0em 0em;
    font-size: 1.8rem;
}

.discountcarousel {
    position:fixed;
    left: 16vw; 
    top: 4rem;
    height: 20rem; 
    width: calc(98.5vw - 15vw); 
    border-radius: 5px;
}

#carouselimg1, #carouselimg2, #carouselimg3 {
    height: 100%; 
    width: 100%; 
    border-radius: 5px;
}

#logoutbtn {
	color : red;
    border: 0;
    background-color: white;
}

#logoutbtn:hover {
    background-color: rgb(245, 132, 47);
    color: white;
}

@media (max-width: 768px) {
    .leftnavbar, .topnavbar, .discountcarousel{
        width: 100vw; 
        left: 0;
        margin-left: 0;
    }
    .scroll-container{
    	width: 100vw; 
    }

    .discountcarousel {
        height: 10rem; 
    }

    .searchinput {
        width: 80vw; 
    }

    .searchbtn {
        width: 30vw; 
    }
}

@media (max-width: 480px) {
    .logo {
        font-size: 1.2rem; 
    }

    .topicon, .bottomicon {
        font-size: 0.9rem; 
        padding: 0.4rem 0.5rem; 
    }

    .searchinput {
        width: 90vw; 
    }

    .searchbtn {
        width: 40vw; 
    }
}
#cart-symbol:hover{
	color : white;
	
}

.scroll-container {
    position: fixed;
    top: calc(100vh - 58vh);
    left: 16vw;
    height: 27vh; 
    width: calc(98.5vw - 15vw);
    display : flex;
    justify-content : space-between;
    overflow-x: auto;     
    white-space: nowrap;   
    box-sizing: border-box;
    padding : 0.5em;
    border : 3px solid silver;
    border-radius : 5px;
}

.content {
    display: inline-block;
}

.category-img2{
	 width: 10vw;
   	 height:15vh;
   	 border-radius : 100px;
}
.category-title{
	font-family: "Calistoga", serif;
	font-size : 1.2rem;
	color : black;
}
.category-view-all{
	font-family: "Calistoga", serif;
	font-size : 1.1rem;
	padding : 0rem 2rem;
	text-decoration : none;
	color : rgb(245, 132, 47);
}
.category-view-all:hover{
	color :  rgb(6, 78, 245);
}

.scroll-container2 {
    position: fixed;
    top: calc(100vh - 23vh);
    left: 15.5vw;
    height: 35vh; 
    width: calc(100vw - 15.5vw);
    overflow-x: auto;     
    white-space: nowrap;  
    box-sizing: border-box;
}

.content-items{
	width: 25vw;
    height: 22vh;
	border : 3px solid silver;
	margin : 0rem 1rem 0rem 0.5rem;
}
.content-items2{
	width: 20vw;
    height: 22vh;
	margin : 0rem 1rem 0rem 0.5rem;
}
.popular-title{
	font-family: "Calistoga", serif;
	font-size : 1.2rem;
	margin : 0.2rem 0.5rem;
}
.content-item-name{
	font-size : 1.2rem;
	font-family: "Calistoga", serif;
	margin : 0rem 1.5rem 0rem 8rem;
	
}
.stars{
	font-size : 1.5rem;
	color : gold;
	font-weight : bold;
}
.price{
	font-size : 1.2rem;
	font-family : verdana;
	font-weight : bold;
}
.offer{
	border : 1px solid red;
	padding : 0em 1em;
	background-color : red;
	color : white;
}
.category-type{
	font-family : verdana;
	font-size : 1.1rem;
	font-weight : bold;
}
#lottie-animation{
	height : 50px;
	width : 50px;
}
#lottie-animation2{
	height : 50px;
	width : 50px;
}
.category-title-container{
	position : fixed;
	top : calc(100vh - 62vh);
	left : 16vw;
	width: calc(100vw - 16vw);
	display : flex;
	justify-content : space-between; 
}
.popular-title-container{
	position : fixed;
	top : calc(100vh - 28vh);
	left : 16vw;
	width: calc(100vw - 16vw);
	display : flex;
	justify-content : space-between; 
}
.category-img-container{
	width : 15vw;
	height : 20vh;
	text-align : center;
}
.img-name-container{
	width : 15vw;
	height : 6vh;
	display : flex;
	justify-content : center;
	align-items : center;
}
.category-img{
	 width: 10vw;
   	 height:18vh;
   	 border-radius : 100px;
   	 
}
.category-img:hover{
	box-shadow : 0px 0px 5px black;
}
 .night-mode {
            background-color:  #080808;
        }

	.night-mode #welcomemsg,.night-mode #categorytitle, .night-mode .category-type ,
	.night-mode .popular-title , .night-mode .content-item-name ,  .night-mode .price
	 
	{
		 color : white;
	}
	.night-mode .topicon , .night-mode .bottomicon{
		color : rgb(3, 185, 124);
	}
	.night-mode .topicon:hover , .night-mode .bottomicon:hover {
		color : white;
	}
	.night-mode .category-img:hover, .night-mode .category-img2:hover{
		box-shadow : 2px 2px 10px white;
		border : 0;
	}
	.night-mode .logo {
		 border-bottom : 2px solid white;
		 box-shadow : 2px 2px 20px white;
	}
	.night-mode .leftnavbar{
		 border-right : 2px solid white;
	}
	.night-mode #searchinput:focus{
		background-color :  #080808;
		border : 3px solid rgb(1, 181, 252);
		outline-color : rgb(1, 181, 252);
	}
	.night-mode #searchinput{
		background-color :  #080808;
		border : 3px solid white;
		outline-color : rgb(1, 181, 252);
	}
	.night-mode .topnavbar{
		 border-bottom : 2px solid white;
	}
	.night-mode #logoutbtn{
		background-color :  #080808;
	}
	.night-mode #logoutbtn:hover{
		background-color : rgb(245, 132, 47);
	}
	
.popup {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            text-align: center;
            padding-top: 100px;
        }

        .popup-content {
            background-color: #fff;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #888;
            width: 60%;
            border-radius: 8px;
            position: relative;
            display: inline-block;
            font-size : 1.2rem;
            font-family: verdana;
        }

        .popup-close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
            font-size : 2rem;
            color : red;
        }
</style>         
<body id="body">
	<% User user = (User)session.getAttribute("loggedInUser"); %>
	<% ArrayList<Restaurant> restaurantList = (ArrayList<Restaurant>)session.getAttribute("restaurantList"); %>
	
	 <%
        String registeredUser = (String) session.getAttribute("registeredUser");
        if (registeredUser != null) {
    %>
    <script>
        // Call the function to show the inline pop-up
        showSuccessPopup("<%= registeredUser %>");
    </script>
    <%
            // Optionally, clear the session attribute after showing the pop-up
            session.removeAttribute("registeredUser");
        }
    %>
    
	
	<nav id="topNavbar" class="topnavbar" >
		<div class="welcome">
		
		<%if(user == null ) {%>
			<span id="lottie-animation2"></span>
			<span style="font-size:20px" id="welcomemsg" class="welcomemsg2">Welcome To AMS</span>
			
		<%} %>
		
		<% if(user != null) {%>
			<span id="lottie-animation"></span>
			<span id="welcomemsg" class="welcomemsg">
			 Welcome <% out.println(user.getUserName()); %></span>
		<%}%>
		
		</div>
		<div class="searchbar">
			<input id="searchinput" class="searchinput" type="text" placeholder="&#x1F50D;">
			<button class="searchbtn">Search</button>
		</div>
		<div class="tools">
			<span id="notification" class="notification"> &#x1F514;</span>
			<span class="settings">&#9881;</span>
			<a class="profile"><img class="profileimg" width="50px" height="50px" alt="" src="https://th.bing.com/th/id/OIP.tlr4dEXDR9YQ8NruHZEy3gHaHa?w=171&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"></a>
		</div>
	</nav>
	<nav id="leftNavbar" class="leftnavbar">
		
		<div class="topcontainer">
			<p class="logo">AMS FOOD DELIVERY</p>
			<%if(user==null){ %>
			<a href="RestaurantServlet" id="topicon" class="topicon"><span>&#x2668; </span> Restaurants</a>
			<%} %>
			<%if(user != null){ %>
			<a href="RestaurantServlet?email=<%=user.getEmail()%>&&userId=<%=user.getUserId()%>" id="topicon" class="topicon"><span>&#x2668; </span> Restaurants</a>
			<%} %>
			<%if(user==null){ %>
			<a href="CuisineServlet" class="topicon"><span>&#x1F37D;</span> Cuisines</a>
			
			<%} %>
			<%if(user != null){ %>
			<a href="CuisineServlet?userId=<%=user.getUserId() %>" class="topicon"><span>&#x1F37D;</span> Cuisines</a>
			
			<%} %>
			
			<% if(user != null){ %>
			<a href="CartServlet?userId=<%=user.getUserId() %>&&action=cart" class="topicon"><span id="cart-symbol"><i class='fa-solid fa-cart-shopping'></i></span> Cart</a>
			<%} %>
			
			<% if(user != null){ %>
			<a href="updateDetails.jsp?email=<%=user.getEmail() %>&userName=<%=user.getUserName() %>&phoneNumber=<%=user.getPhoneNumber()%>&password=<%=user.getPassword()%>&address=<%=user.getAddress()%>" class="topicon"><span><i class='fas fa-user-edit'></i></span> Update Details</a>
			<%} %>
			
			<% if(user != null){ %>
			<a href="OrderHistoryServlet?userId=<%=user.getUserId() %>" class="topicon"><span id="cart-symbol"><i class="fa fa-history" aria-hidden="true"></i></span> Order History</a>
			<%} %>
		</div>
		<div class="bottomcontainer">
			<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
            </a>
			<a href="help.jsp" class="bottomicon"><span> <i class='fas fa-hands-helping'></i></span> Help</a>
			
			<% if(user == null) {%>
			<a class="bottomicon" href="register.jsp" class="register"><span><i class='fa-solid fa-user-pen'></i></span> Register</a>
			<a class="bottomicon" href="login.jsp" class="login"><span>&nbsp;<i class='fas fa-sign-in-alt'></i></span> Login</a>
			 
            
			<%}%>
			
			<p id="line" class="line"></p>
			
			<% if(user != null  ) {%>
			<form>
			<a href="logout" class="bottomicon" id="logoutbtn" type="submit"><span>
				<i class='fa fa-sign-out'></i></span> Logout</a>
			</form>
			<%}%>
			
		</div>
	</nav>
	
	
	<%if(user!=null) {%>
	<div class="discountcarousel">
	
		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
    
     <a href="RestaurantServlet?email=<%=user.getEmail()%>&&userId=<%=user.getUserId()%>"><img id="carouselimg1" src="https://paradise-own-app.s3.amazonaws.com/1680X280_3.jpg" class="d-block w-100" alt="..."></a> 
    </div>
    <div class="carousel-item">
     <a href="RestaurantServlet?email=<%=user.getEmail()%>&&userId=<%=user.getUserId()%>"> <img id="carouselimg2" src="https://paradise-own-app.s3.amazonaws.com/1680X280_1.jpg" class="d-block w-100" alt="..."></a> 
    </div>
    <div class="carousel-item">
     <a href="RestaurantServlet?email=<%=user.getEmail()%>&&userId=<%=user.getUserId()%>"> <img id="carouselimg3" src="https://paradise-own-app.s3.amazonaws.com/1680X280_2.jpg" class="d-block w-100" alt="..."></a> 
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	</div>
	<%}else{ %>
	<div class="discountcarousel">
	
		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
    
     <a href=""><img id="carouselimg1" src="https://paradise-own-app.s3.amazonaws.com/1680X280_3.jpg" class="d-block w-100" alt="..."></a> 
    </div>
    <div class="carousel-item">
     <a href=""> <img id="carouselimg2" src="https://paradise-own-app.s3.amazonaws.com/1680X280_1.jpg" class="d-block w-100" alt="..."></a> 
    </div>
    <div class="carousel-item">
     <a href=""> <img id="carouselimg3" src="https://paradise-own-app.s3.amazonaws.com/1680X280_2.jpg" class="d-block w-100" alt="..."></a> 
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	</div>
	
	<%} %>
	
	<%if(user!=null) {%>
	<div class="category-title-container">
		<span id="categorytitle" class="category-title">Category</span>
		<a href="CategoryServlet?userId=<%=user.getUserId() %>" class="category-view-all">View All <i class="fas fa-angle-double-right"></i></a>
	</div>
	<div id="scrollcontainer" class="scroll-container">
    	<div class="category-img-container">
    	
        <a href="CategoryServlet?userId=<%=user.getUserId() %>" class="item1"><img class="category-img" src="https://c4.wallpaperflare.com/wallpaper/922/294/329/burger-dinner-food-hamburger-wallpaper-preview.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">Burgers</span>
    	</div>
    	</div>
    	
    	<div class="category-img-container">
    	
        <a href="CategoryServlet?userId=<%=user.getUserId() %>" class="item1"><img class="category-img" src="https://c4.wallpaperflare.com/wallpaper/336/687/706/sandwich-meat-bread-food-wallpaper-preview.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">SandWich</span>
    	</div>
    	</div>
    	
    	<div class="category-img-container">
    	
        <a href="CategoryServlet?userId=<%=user.getUserId() %>" class="item1"><img class="category-img" src="https://c4.wallpaperflare.com/wallpaper/298/315/789/pasta-sauce-greens-wallpaper-preview.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">Noodles</span>
    	</div>
    	</div>
    	
    	<div class="category-img-container">
    	
        <a href="CategoryServlet?userId=<%=user.getUserId() %>" class="item1"><img class="category-img" src="https://img.freepik.com/premium-photo/isolated-chicken-biryani-traditional-indian-food-spicy-fried-rice-ramadan-iftar-meal-eid-dinner_667286-5748.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">Biriyani</span>
    	</div>
    	</div>
    	
    	<div class="category-img-container">
    	
        <a href="CategoryServlet?userId=<%=user.getUserId() %>" class="item1"><img class="category-img" src="https://c4.wallpaperflare.com/wallpaper/150/454/450/fish-dish-herbs-lemon-wallpaper-preview.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">SeaFood</span>
    	</div>
    	</div>
 
	</div>
	<%}else{ %>
		<div class="category-title-container">
		<span id="categorytitle" class="category-title">Category</span>
		<a href="CategoryServlet" class="category-view-all">View All <i class="fas fa-angle-double-right"></i></a>
	</div>
	<div id="scrollcontainer" class="scroll-container">
    	<div class="category-img-container">
    	
        <a href="CategoryServlet" class="item1"><img class="category-img" src="https://c4.wallpaperflare.com/wallpaper/922/294/329/burger-dinner-food-hamburger-wallpaper-preview.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">Burgers</span>
    	</div>
    	</div>
    	
    	<div class="category-img-container">
    	
        <a href="CategoryServlet" class="item1"><img class="category-img" src="https://c4.wallpaperflare.com/wallpaper/336/687/706/sandwich-meat-bread-food-wallpaper-preview.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">SandWich</span>
    	</div>
    	</div>
    	
    	<div class="category-img-container">
    	
        <a href="CategoryServlet" class="item1"><img class="category-img" src="https://c4.wallpaperflare.com/wallpaper/298/315/789/pasta-sauce-greens-wallpaper-preview.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">Noodles</span>
    	</div>
    	</div>
    	
    	<div class="category-img-container">
    	
        <a href="CategoryServlet" class="item1"><img class="category-img" src="https://img.freepik.com/premium-photo/isolated-chicken-biryani-traditional-indian-food-spicy-fried-rice-ramadan-iftar-meal-eid-dinner_667286-5748.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">Biriyani</span>
    	</div>
    	</div>
    	
    	<div class="category-img-container">
    	
        <a href="CategoryServlet" class="item1"><img class="category-img" src="https://c4.wallpaperflare.com/wallpaper/150/454/450/fish-dish-herbs-lemon-wallpaper-preview.jpg"></a>
   		<div class="img-name-container">
  		<span class="category-type">SeaFood</span>
    	</div>
    	</div>
 
	</div>
	<%} %>
	<%if(user!=null){ %>
	<div class="popular-title-container">
		<span id="categorytitle" class="category-title">Popular</span>
		<a href="RestaurantServlet?userId=<%=user.getUserId() %>" class="category-view-all">View All <i class="fas fa-angle-double-right"></i></a>
	</div>
	
	<div class="scroll-container2">
    
    <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet?userId=<%=user.getUserId() %>" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/433/128/985/fish-meat-plate-green-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 69.00</span>
  		
    	</div>
    </div>
    
     <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet?userId=<%=user.getUserId() %>" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/772/819/583/meat-garlic-spices-parsley-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 79.00</span>
  		
    	</div>
    </div>
    
     <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet?userId=<%=user.getUserId() %>" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/194/477/158/dish-chicken-legs-lettuce-onions-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 199.00</span>
  		
    	</div>
    </div>
    
     <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet?userId=<%=user.getUserId() %>" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/371/891/712/juice-three-glasses-kiwi-cherry-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 79.00</span>
  		
    	</div>
    </div>
    
     <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet?userId=<%=user.getUserId() %>" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/734/276/884/jelly-strawberry-blueberry-chocolate-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 99.00</span>
  		
    	</div>
    </div>
   
	</div>
	<%}else{ %>
		
	<div class="popular-title-container">
		<span id="categorytitle" class="category-title">Popular</span>
		<a href="RestaurantServlet" class="category-view-all">View All <i class="fas fa-angle-double-right"></i></a>
	</div>
	
	<div class="scroll-container2">
    
    <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/433/128/985/fish-meat-plate-green-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 69.00</span>
  		
    	</div>
    </div>
    
     <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/772/819/583/meat-garlic-spices-parsley-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 79.00</span>
  		
    	</div>
    </div>
    
     <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/194/477/158/dish-chicken-legs-lettuce-onions-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 199.00</span>
  		
    	</div>
    </div>
    
     <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/371/891/712/juice-three-glasses-kiwi-cherry-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 79.00</span>
  		
    	</div>
    </div>
    
     <div class="content">
    	<div class="content-items">
    	<span class="content-item-name">Explore AMS</span><span class="offer">20% Off </span><br>
    	<a href="RestaurantServlet" class="item2"><img class="category-img2" src="https://c4.wallpaperflare.com/wallpaper/734/276/884/jelly-strawberry-blueberry-chocolate-wallpaper-preview.jpg"></a>
    	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;
  		<span class="price">&#8377; 99.00</span>
  		
    	</div>
    </div>
   
	</div>
	
	<%} %>
<%-- 	<%if(restaurantList != null){ %> --%>
<!-- 	<div class="scroll-container2"> -->
<%--     <%for(Restaurant rest : restaurantList){ %> --%>
<%--     <%if(rest.getRatings() > 4.0f) {%> --%>
<!--     <div class="content"> -->
<!--     	<div class="content-items"> -->
<%--     	<span class="content-item-name"><%=rest.getRestaurantName() %></span><span class="offer">20% Off </span><br> --%>
<!--     	<a href="" class="item2"><img class="category-img2" src="https://img.freepik.com/premium-photo/isolated-chicken-biryani-traditional-indian-food-spicy-fried-rice-ramadan-iftar-meal-eid-dinner_667286-5748.jpg"></a> -->
<!--     	<span class="stars">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp; -->
<%--   		<span class="price">20-<%=rest.getDeliveryTime() %> Min</span> --%>
<!--     	</div> -->
<!--     </div> -->
<%--     <%} %> --%>
<%--    <%} %> --%>
<!-- 	</div> -->
<%-- 	<%} %> --%>
	
	
	<script>
	
        const toggleButton = document.getElementById('nightModeToggle');
        const leftNavbar = document.getElementById('leftNavbar');
		const body = document.getElementById('body');
		const modeIcon = document.getElementById('modeIcon');
		
        toggleButton.addEventListener('click', function() {
            body.classList.toggle('night-mode');
            leftNavbar.classList.toggle('night-mode');
            
            if (leftNavbar.classList.contains('night-mode')) {
                modeIcon.innerHTML = "<i class='fas fa-sun'></i>";
                toggleButton.innerHTML = "<span id='modeIcon'><i class='fas fa-sun'></i></span> Day Mode";
            } else {
                modeIcon.innerHTML = "<i class='fas fa-moon'></i>";
                toggleButton.innerHTML = "<span id='modeIcon'><i class='fas fa-moon'></i></span> Night Mode";
            }
        });
        
        document.addEventListener("DOMContentLoaded", function() {
			lottie.loadAnimation({
				container: document.getElementById('lottie-animation'), 
				renderer: 'svg',
				loop: true,
				autoplay: true,
				path: 'animations/userexist.json'
			});
		});
        
        document.addEventListener("DOMContentLoaded", function() {
			lottie.loadAnimation({
				container: document.getElementById('lottie-animation2'), 
				renderer: 'svg',
				loop: true,
				autoplay: true,
				path: 'animations/usernotexist.json'
			});
		});
        
    </script>
	
</body>
</html>