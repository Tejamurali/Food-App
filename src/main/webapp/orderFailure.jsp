<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Failure Page</title>
<link rel="stylesheet" href="orderSuccess">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.4/lottie.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap');

* {
    box-sizing: border-box;
    margin: 0;
}
#lottie-animation{
	height : 400px;
	width : 450px;
	margin : 0rem auto;
}
#lottie-animation2{
	height : 350px;
	width : 550px;
	margin : 0rem auto;
}

.scrolling-text {
    display: inline-block;
    position: absolute;
    white-space: nowrap;
    font-size: 3rem;
    text-align : center;
	color : red;
	font-family : verdana;
    animation: scroll-right 10s linear infinite;
}

@keyframes scroll-right {
0% {
    transform: translateX(-100%);
   }
   100% {
     transform: translateX(100%);
	}
}

</style>
</head>
<body>
	<div class="scrolling-text-container">
    <div class="scrolling-text">Something Went Wrong!! Pls Try Again!!</div>
	</div>
		<div class="image-container">
			<div id="lottie-animation"></div>
		</div>
		<div class="message-container">
			<div id="lottie-animation2"></div>
		</div>
		

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			lottie.loadAnimation({
				container: document.getElementById('lottie-animation'), 
				renderer: 'svg',
				loop: true,
				autoplay: true,
				path: 'animations/pageerror.json'
			});
		});
		
		document.addEventListener("DOMContentLoaded", function() {
			lottie.loadAnimation({
				container: document.getElementById('lottie-animation2'), 
				renderer: 'svg',
				loop: true,
				autoplay: true,
				path: 'animations/somethingwrong.json'
			});
		});
	</script>

</body>
</html>
