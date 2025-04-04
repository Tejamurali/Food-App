<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList,com.foodapp.model.User" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="login">
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
   @charset "ISO-8859-1";

* {
	box-sizing: border-box;
	margin: 0;
}

.fooditem1 {
	height: 20rem;
	width: 30rem
}

.fooditem2 {
	height: 25rem;
	width: 25rem;
}
.fooditem3 {
	height: 30rem;
	width: 40rem;
}

.foodcontainer1 {
	position: fixed;
	top: 18rem;
	left: -1rem;
}

.foodcontainer2 {
	position: fixed;
	right: -7rem;
	top: -7rem;
}
.foodcontainer3 {
	position: fixed;
	right: -9rem;
	bottom : 0rem;
}
.formcontainer2 {
	display: flex;
	justify-content: center;
	height : 30vh;
}

.formcontainer {
	position: fixed;
	margin: 8.5rem 35%;
	height : 70vh;
	width: 35vw;
	box-shadow: 2px 2px 4px black;
	text-align : center;
}

.logintitle {
	font-family: "Calistoga", serif;
	margin: 0.1em 0em 0em 0em;
	font-size: 3em;
	display: flex;
	justify-content: center;
}

.titledesc {
	font-weight : 100;
	color: grey;
	
}

.desc {
	color: tomato;
	font-weight: 550;
}

.formcontainer:hover {
	transition: 0.2s;
	box-shadow: 1px 1px 5px green;
}
.loginwithcontainer{
	display : flex;
	flex-direction : column;
	align-items : center;
	justify-content : space-around;
	height : 20vh;
	margin : 2rem 0rem;
}

.form {
	margin : 3rem 0rem 0rem 0rem;
}

.input {
	border-radius: 20px;
	width: 22vw;
	height: 18%;
	background-color: aliceblue;
	border: 0;
	box-shadow: 1px 1px 1px grey;
	font-family: sans-serif;
	text-align: center;
	font-size : 1.1rem;
}
.input::placeholder{
	font-size : 1rem;
}

#loginbtn {
	margin: 2em 0em;
	background-color: tomato;
	border: 0;
	color: white;
}

#loginbtn:hover {
	box-shadow: 1px 1px 10px tomato;
	color: white;
	cursor: pointer;
	transition: 0.5s;
}

.forgettag {
	text-decoration: none;
	color: tomato;
	margin: 0em 0em 0em 2em;
	font-family: verdana;
}

.forgettag:hover {
	transition: 0.3s;
	color : rgb(244, 38, 1);
}

.formline {
	color: silver;
	font-family : verdana;
}
.loginwithbtn-container{
	display : flex;
	flex-direction : row;
	jusify-content : center;
	width : 70%;
}
.loginwithbtn {
	margin : 0rem auto;
	height: 2.5em;
	width: 2.5em;
	border-radius: 20px;
}

.loginwithbtn:hover {
	box-shadow: 1px 1px 10px black;
	transition: 0.3s;
}

#btn1 {
	background-image:
		url("https://th.bing.com/th/id/OIP.cOz92GK9w_2_VxUIWBL0ngHaHa?w=176&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7");
	background-size: cover;
	background-repeat: no-repeat;
	border: 0;
	cursor: pointer;
}

#btn2 {
	background-image:
		url("https://th.bing.com/th/id/OIP.aPyHWMu3KHjwJUWdGrEkZQHaHa?w=160&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7");
	background-size: cover;
	background-repeat: no-repeat;
	border: 0;
	cursor: pointer;
}

#btn3 {
	background-image:
		url("https://th.bing.com/th/id/OIP.Sbs-M2-y31gNoj9n-IIeowHaHa?w=189&h=190&c=7&r=0&o=5&dpr=1.5&pid=1.7");
	background-size: cover;
	background-repeat: no-repeat;
	border: 0;
	cursor: pointer;
}

.registermesg {
	font-family : verdana;
}

.register {
	text-decoration: none;
	font-weight: bold;
	color : black;
	padding : 0.1rem 0.5rem;
}

.register:hover {
	background-color : tomato;
	color: white;
	transition: ease-in-out 0.3s;
	border-radius : 10px;
	
}

.input::placeholder {
	font-weight: 300;
}

.input:focus {
	text-align: center;
}

.input:active {
	text-align: center;
}

.input::after {
	text-align: center;
}

.input::target-text {
	font-family: sans-serif;
	font-size: large;
}

.input::backdrop {
	visibility: hidden;
}

#wronginput {
	border : 3px solid red;
	color : red;
	margin : 1rem 0rem 0rem 0rem;
}
#wronginput:focus{
	outline-color : red; 
}
.wrongmessage {
	color: red;
	margin: 0em 0em 0em 3em;
	font-family : verdana;
}

.wrongmessage2 {
	color: red;
	margin: 0em 0em 0em 3em;
	font-family : verdana;
}

#correctemail {
	border : 3px solid rgb(5, 198, 5);
	color : green;
	background-color : white;
}
#correctpassword {
	width : 70%;
	border: 2px solid rgb(5, 198, 5);
}
#correctemail:focus,#correctpassword:focus{
	outline-color : rgb(5, 198, 5); 
}

.loginmsg-container{
	position : fixed;
	top : 2rem;
	width : 100%;
	left : 3%;
	text-align : center;
	font-family: verdana;
	color :  rgb(6, 78, 245) ;
	font-size : 1.2rem;
}
.titlecontainer{
	display: flex;
	justify-content: center;
	font-family: verdana;
	position : fixed;
	left : 40%;
	top : 10%;
}
    </style>
</head>
<body>
	<% String loginmsg = (String)session.getAttribute("loginmsg"); %>
	<%if(loginmsg!=null){ %>
	<div class="loginmsg-container">
		<p class="loginmsg"><%=loginmsg %></p>
	</div>
		<%} %>
    <div class="titlecontainer">
        <p class="titledesc">More than&nbsp;<span class="desc">10,000 recipes </span>&nbsp;from around the world!</p>
    </div>

    <div class="foodcontainer1">
        <img class="fooditem1" src="https://c4.wallpaperflare.com/wallpaper/640/60/1008/pizza-tomatoes-vegetables-meat-wallpaper-preview.jpg" alt="">
    </div>
    <div class="foodcontainer2">
        <img class="fooditem2" src="https://img.freepik.com/premium-photo/isolated-chicken-biryani-traditional-indian-food-spicy-fried-rice-ramadan-iftar-meal-eid-dinner_667286-5748.jpg" alt="">
    </div>
     <div class="foodcontainer3">
        <img class="fooditem3" src="https://media.istockphoto.com/id/1175432945/photo/cooking-concept-vegetables-are-flying-out-of-the-pan-isolated-on-white-background-healthy-food.jpg?s=612x612&w=0&k=20&c=KwNHg7rmDIyvBfthK3SbvAORqn6mW-Unhu_eFM0vPdU=" alt="">
    </div>
    
    <div class="formcontainer">

        <p class="logintitle">Login</p>

        <div class="formcontainer2">
            
        <form class="form" action="LoginServlet">
        	<% String email = (String) request.getAttribute("emailWrong");%>
        		<% String password =(String) request.getAttribute("passwordWrong");%>
        	
        	
        	<% if(email==null && password==null){ %>
            <input  class="input" type="email" name="email" placeholder="      &#128231; Enter Email Address" required>
             <br><br>
            <%} %>
            <%if(email!=null && password==null){ %>
            <span class="wrongmessage">${emailWrong}</span>
            <input id="wronginput" class="input" type="email" name="email" value="${email}" required>
            <br><br>
            <%} %>
            
            <%if(email != null && password != null){ %>
             <input class="input" type="email" name="email" value="${email}">
           	 <br><br>
           	 <input id="correctpassword" class="input" type="password" name="password" value="${email}" required>
             <br><br>
            <%} %>
                       
            <% if(password==null){ %>
            
            <input class="input" type="password" name="password" placeholder="&#128272; Enter Password " required>
            <%} %>
            <%if(password!=null){ %>
            <input id="correctemail" class="input" type="email" name="email" value="${email}">
            <br><br>
             <span class="wrongmessage2">${passwordWrong}</span>
            <input id="wronginput" class="input" type="password" name="password" value="${password}" required>
          	<%} %>
          	<br><br>
               
            <input class="inputcheckbox" type="checkbox">&nbsp;<label style="font-family : verdana" for="">Remember me</label><a class="forgettag" href="">Forget Password?</a>
            <input id="loginbtn" class="input" type="submit" value="Login">
        </form>
    </div>
    <div class="loginwithcontainer">
    <div class="formline">--------------------- Login With -------------------</div>
     <div class="loginwithbtn-container">
        <button id="btn1" class="loginwithbtn"></button>
        <button id="btn2" class="loginwithbtn"></button>
        <button id="btn3" class="loginwithbtn"></button>
    </div>
    <p class="registermesg">If don't have an account?&nbsp;<a class="register" href="register.jsp">Go Register</a></p>
    </div>
   </div>
    
</body>
</html>