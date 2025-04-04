<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <link rel="stylesheet" href="register">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.4/lottie.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');

*{
    box-sizing: border-box;
    margin : 0;
}
body{
	background-color : aquamarine;
}
.registercontainer{
    position: fixed;
    left : 0;
	margin : 0rem 0rem 0rem 2.5rem;
    top : calc(100vh - 85vh);
	height : 70vh;
    width: 35%;
    box-shadow: 1px 1px 7px black;
    background-color : aquamarine;
}
.input{
    border-radius: 20px;
    width: 60%;
    height: 4vh;
    background-color:aliceblue;
    border: 0;
    box-shadow: 1px 1px 1px black;
    font-family: verdana;
    text-align: center;
    font-size : 1.2rem;
}
.input:focus{
	outline-color : black;
}
.input::placeholder{
	font-size : 1rem;
	font-family : verdana;
	color : grey;
}
.formcontainer{
    text-align: center;
}
.register-img{
	 position : fixed;
	
}
.signuptitle{
    font-family: "Calistoga", serif;
    margin: 0.1em 0em 1em 0em;
    font-size: 3em;
    display:flex;
    justify-content: center;
}
#registerbtn{
    color:white;
    margin: 1em 0em;
    background-color: rgba(0, 0, 0, 0.87);
}
#registerbtn:hover{
    box-shadow: 1px 1px 10px black;
    cursor: pointer;
    transition: 0.5s;
}
.loginmesg{
	font-family :verdana;
	color :black;
	font-weight : bold;
    width : 100%;
    margin : 2rem 20%;
}
.login{
	
    text-decoration:none;
    border-radius : 5px;
    padding : 2px 5px;
    color: black;
    font-weight : bold;
    
}
.login:hover{
	color : white;
	background-color : black;
	box-shadow : 1px 1px 5px black;
    font-weight: bold;
    transition:0.3s;
}
.animation-container{
	position : fixed;
	right : 0;
	margin : 0rem 2.5rem 0rem 0rem;
	top : calc(100vh - 85vh);
	height : 70vh;
	width : 60%;
	z-index : -1;
	box-shadow: 1px 1px 5px black;
}
     </style>
</head>
<body>

    <div class="registercontainer">
        <div class="formcontainer">
            <p class="signuptitle">Sign Up</p>
            <form action="RegisterServlet">
                <input class="input" type="text" name="userName" id="" placeholder="User Name" required><br><br>
                <input class="input" type="email" name="email" id="" placeholder="Email Id" required><br><br>
                <input class="input" type="tel" name="phoneNumber" id="" placeholder="Phone Number"><br><br>
                <input class="input" type="password" name="password" id="" placeholder="password"><br><br>
                <input class="input" type="text" name="address" id="" placeholder="Address"><br><br>
                <input class="input" type="submit" value="Register" id="registerbtn">
            </form>
        </div>
        <p class="loginmesg">If allready have an account?&nbsp;<a class="login" href="login.jsp">Go Login</a></p>
        </div>
        <div class="animation-container">
        	<div id="lottie-animation"></div>
        </div>
       <script>
		document.addEventListener("DOMContentLoaded", function() {
			lottie.loadAnimation({
				container: document.getElementById('lottie-animation'), 
				renderer: 'svg',
				loop: true,
				autoplay: true,
				path: 'animations/delivery.json'
			});
		});
	</script> 
</body>
</html>