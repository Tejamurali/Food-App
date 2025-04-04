<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Details Page</title>
<link rel="stylesheet" href="updateDetails">
 <style>
        @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
@charset "ISO-8859-1";

* {
    box-sizing: border-box;
    margin: 0;
}
.background-img{
	position : absolute;
	height : 600px;
	width : 800px;
	left : 800px;
	top : 100px;
}

.updatecontainer{
	text-align : center;
    position: absolute;
    left:10rem;
    top:calc(100vh - 90vh);
    height:70vh;
    width: 35vw;
    
}
.updatecontainer:hover{
	transition : 0.5s;
	border : 1px solid white;
	box-shadow: 2px 2px 10px white;
}
.input{
    border-radius: 20px;
    width: 20vw;
    height : 2em;
  	font-size : 1.2rem;
    background-color:aliceblue;
    border: 0;
    box-shadow: 1px 1px 1px grey ;
    font-family: sans-serif;
    text-align: center;
}
.formcontainer{
    text-align: center;
}
.updatetitle{
	color : white;
	text-decoration:underline;
    font-family: impact;
    margin: 0.5em 0em 2em 0em;
    font-size: 2.5em;
    display:flex;
    justify-content: center;
}
.label{
	color : white;
}

#updatebtn{
    color:white;
    margin: 1em 0em;
    background-color:rgb(254, 57, 22);
    font-weight: bold;
}
#updatebtn:hover{
    box-shadow: 1px 1px 20px rgb(254, 40, 2);
    color: white;
    cursor: pointer;
    transition: 0.5s;
}
.updatemesg{
	font-family : verdana;
	color :white;
	font-weight : bold;
	margin : 2rem 0rem;
	font-size : 1.1rem;
}
.home{
	
    text-decoration:none;
    border-radius : 5px;
    padding : 2px 5px;
    color: black;
    font-weight : bold;
    color : white;
    
}
.home:hover{
	color : black;
	background-color : white;
	box-shadow : 1px 1px 10px white;
    font-weight: bold;
    transition:0.3s;
}	
	
body{
	background-color: black;
}
.input + span {
    display: none;
}

.input:hover + span,
.input:focus + span {
    display: inline;
    color : rgb(2, 195, 195);
    font-family : verdana;
}

</style>
</head>
<body>
	<img class="background-img"  src="https://c4.wallpaperflare.com/wallpaper/501/768/988/fire-food-chilli-peppers-wallpaper-preview.jpg" alt="">
	 <div class="updatecontainer">
        <div class="formcontainer">
            <p class="updatetitle">Update Your Details</p>
           
            <form action="UpdateUserServlet">
    <input class="input" type="text" name="userName" id="" value="<%=request.getParameter("userName")%>" required>
    <span>User Name</span><br><br>

    <input type="hidden" name="email" id="" value="<%=request.getParameter("email") %>">
    <input class="input" type="tel" name="phoneNumber" id="" value="<%=request.getParameter("phoneNumber")%>">
    <span>Phone Number</span><br><br>

    <input class="input" type="password" name="password" id="" value="<%=request.getParameter("password") %>">
    <span>Password</span><br><br>

    <input class="input" type="text" name="address" id="" value="<%=request.getParameter("address")%>">
    <span>Address</span><br><br>

    <input class="input" type="submit" value="Update" id="updatebtn">
</form>
        </div>
         <p class="updatemesg">You don't want upate? <a class="home" href="home.jsp">Go Home</a></p>
       </div>
</body>
</html>