<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Success Page</title>
<link rel="stylesheet" href="orderSuccess">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.4/lottie.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');

* {
    box-sizing: border-box;
    margin: 0;
}

/* rgb(66, 221, 66) */
.order-container{
	margin : 5% auto;
	height : 65vh;
	width : 55vw;
	box-shadow : 0px 0px 3px black;
	border-radius : 0px 100px 0px 100px;
	background : linear-gradient(150deg ,rgb(66, 221, 66),white,rgb(66, 221, 66));
}
.image-container{
	height : 60%;
	text-align: center;
}
.message-container{
	height : 20%;
	text-align : center;
}
.buttons-container{
	height : 25%;
	display : flex;
	width : 70%;
	margin : 0rem auto;
	justify-content : space-around;
	align-items : center;
}
.order-confirmmsg{
	font-family: "Archivo Black", sans-serif;
	font-size : 2.3rem;
	margin : 0.3rem 0rem;
	color :  rgb(0, 171, 0);
}
.thankyou-msg{
	font-size : 1.5rem;
	color : rgb(6, 78, 245);
	font-weight : bold;
}
.order-received-msg{
	font-size : 1rem;
	font-family : verdana;
	font-weight : bold;
}
.return-menu-btn{
	padding : 0.5rem 5rem;
	font-size : 1.3rem;
	font-family : impact;
	color : orangered;
	text-decoration : none;
}
.return-menu-btn:hover{
	font-size : 1.2rem;
	background-color : #18bcf2;
	color : white;
	cursor : pointer;
	border : 0;
	transition : ease-in-out 1s;
}
.return-home-btn{
	font-size : 1.3rem;
	padding : 0.5rem 5rem;
	font-family : impact;
	color : orangered;
	text-decoration : none;
}
.return-home-btn:hover{
	font-size : 1.2rem;
	background-color : rgb(254, 2, 128);
	color : white;
	cursor : pointer;
	border : 0;
	transition : ease-in-out 1s;
}
#lottie-animation{
	height : 45vh;
	width : 50vw;
	margin : 0rem auto;
}
.confirm-order{
	display : flex;
	justify-content : center;
	align-items : center;
	height : 100vh;
}
#playButton{
	box-shadow : 0px 0px 3px black;
	font-size : 2rem;
	font-family : impact;
	cursor : pointer;
	padding : 1rem 5rem;
	border-radius : 50px;
	color : orangered;
}
#playButton:hover{
	font-size : 1.7rem;
	background : linear-gradient(150deg ,rgb(66, 221, 66),white,rgb(66, 221, 66));
	transition : ease-in-out 1s;
	color : black;
}

</style>
</head>
<body>
	
	<% 
    int userId = 0;

    if (session.getAttribute("userId") != null) {
    	try{
    		
    		userId = (Integer) session.getAttribute("userId");
    	}
    	catch(ClassCastException e){%>
    	
    	<% }
    }
	%>
	
	<div class="order-container" style="display: none;">
		<div class="image-container">
			<div id="lottie-animation"></div>
		</div>
		<div class="message-container">
			<p class="thankyou-msg">Thank You</p>
			<p class="order-confirmmsg">Your Order Is Confirmed</p>
			<p class="order-received-msg">We Have Received Your Order And It Is Being Processed</p>
		</div>
		<div class="buttons-container">
			<a href="CartServlet?userId=<%=userId%>&&action=returnToCart" class="return-menu-btn">Return To Cart</a>
			<a href="ReturnToHome?userId=<%=userId%>" class="return-home-btn">Return To Home</a>
		</div>
	</div>
	
	<div class="confirm-order">
	
	<a id="playButton">Confirm Order</a>
	
	</div>

	<audio id="audioPlayer">
		<source src="audio/amsOrderSms.mp3" type="audio/mpeg">
	</audio>

	<script>
	var playButton = document.getElementById("playButton");

	playButton.addEventListener("click", function(event) {
	    event.preventDefault();

	    var orderContainer = document.getElementsByClassName("order-container")[0];
	    var delay = 1500; 

	    setTimeout(function() {
	        if (orderContainer.style.display === "none") {
	            orderContainer.style.display = "";
	            playButton.style.display = "none";
	        }
	    }, delay);
	});

	
	
		document.addEventListener("DOMContentLoaded", function() {
			lottie.loadAnimation({
				container: document.getElementById('lottie-animation'), 
				renderer: 'svg',
				loop: true,
				autoplay: true,
				path: 'animations/animation.json'
			});
		});
		
		document.getElementById('playButton').addEventListener('click', function() {
	        var audio = document.getElementById('audioPlayer');
	        audio.play().catch(function(error) {
	            console.log('Error playing audio:', error);
	        });
	    });
	
	</script>

</body>
</html>
