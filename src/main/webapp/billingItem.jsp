<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.foodapp.model.Cart,com.foodapp.model.CartItem,java.util.Map,java.util.Map.Entry" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill Page</title>
<link rel="stylesheet" href="billingItem">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  crossorigin="anonymous" referrerpolicy="no-referrer" />            

<style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Pacifico&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Merienda:wght@300..900&family=Pacifico&family=Timmana&display=swap');


* {
    box-sizing: border-box;
    margin: 0;
}

.title-container{
	display : flex;
	justify-content : space-between;
	text-align : center;
	margin : 0rem 0rem 3rem 0rem;
}
.title{
	 font-family: "Calistoga", serif;
	 font-size : 1.8rem;
	 color : rgb(245, 132, 47);
}
.bill-title-container{
	margin : 1rem;
	text-align : center;
	
}
.bill-title{
	font-family : georgia;
	font-size : 1.3rem;
}
.bill-container{
	width : 60%;
	height : auto;
	margin : 1rem auto;
	box-shadow : 1px 1px 10px black;
}
.payment-container{
	width : 60%;
	margin : 2rem auto;
	text-align : center;
}
.option-container{
	display : flex;
	justify-content : space-between;
	width : 60%;
	margin : 3rem auto;
    transition: ease-in-out 1s;
}
.bill-heading{
	display : flex;
	justify-content : space-between;
	padding : 0.5rem 1rem;
	background-color : black;
	color : white;
	font-family : verdana;
	
}
.bill{
	padding : 1rem;
}
.bill-card{
	display : flex;
	justify-content : space-between;
	margin : 1rem 0rem;
	font-family: "Calistoga", serif;
	border-bottom : 1px solid grey;
}
.bill-row:nth-child(1){
	width : 12%;
	padding : 0.5rem 1rem;
	text-align : left;
}
.bill-row:nth-child(2){
	width : 20%;
	padding : 0.5rem 1rem;
	text-align : left;
}
.bill-row:nth-child(3)
{
	width : 15%;
	padding : 0.5rem 1rem;
	text-align : left;
}
.bill-row:nth-child(4){
	width : 8%;
	padding : 0.5rem 1rem;
	text-align : right;
}

.bill-row:nth-child(5){
	width : 15%;
	padding : 0.5rem 1rem;
	text-align : right;
}

.subtotal{
	display : flex;
	justify-content : end;
	gap : 10%;
	padding : 1rem;
	font-family: "Calistoga", serif;
}
.tax{
	display : flex;
	justify-content : end;
	gap : 10%;
	padding : 1rem 0.5rem;
	font-family: "Calistoga", serif;
}
.grand-total{
	display : flex;
	justify-content : end;
}
.grand-total-title{
	font-size : 1.3rem;
	font-family: impact;
	padding : 0.5rem 2rem;
	background-color : black;
	color : white;
}
.totalbill-container{
	padding : 1rem ;
	
}
.design{
	padding : 0.5rem;
	background-color : rgb(255, 221, 0);
}
.payment{
	text-decoration : none;
	border : 0;
	color : rgb(0, 171, 0);
	font-family : impact;
	font-size : 1.2rem;
	cursor : pointer;
}
.payment:hover{
	padding : 0.5rem 3rem;
	color : white;
	background-color : green;
	transition : ease-in-out 1s;
}
.cash-on{
	text-decoration : none;
	border : 0;
	color : orangered;
	font-family : impact;
	font-size : 1.2rem;
}
.cash-on:hover{
	padding : 0.5rem 3rem;
	color : white;
	background-color : orangered;
	transition : ease-in-out 1s;
}
.upi{
	text-decoration : none;
	border : 0;
	color : rgb(4, 176, 119);
	font-family : impact;
	font-size : 1.2rem;
}
.upi:hover{
	padding : 0.5rem 3rem;
	color : white;
	background-color : rgb(4, 176, 119);
	transition : ease-in-out 1s;
}
.debit{
	text-decoration : none;
	border : 0;
	color : rgb(5, 92, 253);
	font-family : impact;
	font-size : 1.2rem;
}
.debit:hover{
	padding : 0.5rem 3rem;
	color : white;
	background-color : rgb(5, 92, 253);
	transition : ease-in-out 1s;
}
.cash-on-container{
	width : 60%;
	margin : 2rem auto;
	text-align : center;
	padding : 3rem 0rem;
	box-shadow : 0px 0px 5px black;
}
.cash-on-container-card{
	width : 60%;
	margin : 2rem auto;
	text-align : center;
	padding : 1rem 0rem;
	border : 1px solid black;
}
.cash-on-container-card table{
	margin : 1rem auto;
}

.enter-address{
	font-size : 1.3rem;
	font-family : verdana;
	color : rgb(4, 176, 119);
	font-weight : bold;
}
.address-input{
	width : 30%;
	font-size : 1.2rem;
	border : 2px solid skyblue;
	font-family : georgia;
}
.address-input2{
	width : 100%;
	font-size : 1.1rem;
	padding : 0.2rem;
	border : 2px solid skyblue;
	font-family: "Calistoga", serif;
}
.place-order{
	border : 0;
	background-color : white;
	font-family : impact;
	font-size : 1.3rem;
	cursor : pointer;
	margin : 0.5rem 0rem;
}
.place-order:hover{
	padding : 0.5rem 5rem;
	background-color : rgb(254, 2, 128);
	color : white;
	transition : ease-in-out 1s;
	
}
.address-input:focus{
	border-color: #4A90E2; 
	outline : 2px solid #18bcf2;
}
.address-input2:focus{
	border-color: #4A90E2; 
	outline : 2px solid #18bcf2;
}
.address-input2::placeholder{
	font-size : 0.9rem;
	color : red;
}
.upi-select{
	display : flex;
	justify-content : space-around;
	margin : 0rem 1rem 2rem 1rem;
	font-size : 1.1rem;
	font-family: "Calistoga", serif;
}
.select-options{
	margin : auto 0rem;
	color : rgb(6, 78, 245);
}
.phonepe-img:hover,.paytm-img:hover,.amazon-img:hover{
	border-bottom : 5px solid rgb(6, 78, 245);
	transition : ease-in-out 0.2s;
}
.bottomicon{
	font-family: "Calistoga", serif;
	padding : 0.5em 5em;
	color : rgb(245, 132, 47);
	text-decoration : none;
	text-align : left;
}
.bottomicon:hover{
	color : white;
	background-color : rgba(0, 0, 0, 0.902);
}
.home{
	font-family: "Calistoga", serif;
	padding : 0.5em 8em;
	color : rgb(245, 132, 47);
	text-decoration : none;
	text-align : left;
}
.home:hover{
	color : white;
	background-color : rgba(0, 0, 0, 0.902);
}
.night-mode {
            background-color:  #080808;
        }
.night-mode .home, .night-mode .bottomicon, .night-mode .bill-container{
	color : white;
}
 .night-mode .title {
	color :  rgb(245, 132, 47);
 	
 }

.night-mode .bill-container{
	box-shadow : 1px 1px 10px white;
}

.night-mode .title-container{
	border : 2px solid white;
	box-shadow : 1px 1px 5px white;
}
.night-mode .bottomicon:hover, .night-mode .home:hover{
 	background-color : rgb(245, 132, 47);
 	color : white;
 }
.night-mode .bill-heading,.night-mode .grand-total-title{
	background-color : white;
	color :  #080808;
}
.night-mode .cash-on-container,.night-mode  .cash-on-container-card{
	box-shadow : 1px 1px 10px white;
}
.night-mode .address-input{
	background-color :  #080808;
	color : white;
}
.night-mode .place-order{
	background-color :  #080808;
	color : white;
}
.night-mode .place-order:hover{
	background-color : rgb(254, 2, 128);
}
.night-mode .address-input2{
	background-color :  #080808;
	color : white;
}

</style>
</head>
<body id="body">
	<% Cart cart = (Cart) session.getAttribute("cart");%>
	<% 
    int userId = 0;
	 if (session.getAttribute("userId") != null) {
		 userId = (Integer) session.getAttribute("userId");
	    }
	%>
	<% 
    int menuId = 0;
	 if (session.getAttribute("menuId") != null) {
		 menuId = (Integer) session.getAttribute("menuId");
	    }
	%>
	<% String restaurantId = (String)session.getAttribute("restaurantId"); %>
	
	
	<%! int siNo = 1; float subTotal = 0; float tax = 0.00f; float grandTotal = 0.0f; %>
	<div id="titlecontainer" class="title-container">
	<a href="home.jsp"  class="home">Home</a>
	<p class="title">AMS FOOD DELIVERY</p>

	<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
         </a>

	</div>
	
	<div class="bill-container">
	<div class="design"></div>
		<div class="bill-title-container">
			<p class="bill-title">BILLING ITEM</p>
		</div>
		<div class="bill">
			<div class="bill-heading">
			<span>SINO</span>
			<span>Item Name</span>
			<span>Item Price</span>
			<span>Quantity</span>
			<span>Total</span>
			</div>
			<%if(cart != null) {
			  Map<Integer,CartItem> itemsMap = cart.fetchAllItems();
			  if(!itemsMap.isEmpty()){
      		  for (Map.Entry<Integer,CartItem> entry : itemsMap.entrySet()) {
      		  subTotal+=entry.getValue().getQuantity()*entry.getValue().getPrice();
      		  grandTotal = tax + subTotal;%>
      		  
			<div class="bill-card">
			<span class="bill-row"><%=siNo++ %></span>
			<span class="bill-row"><%=entry.getValue().getMenuName() %></span>
			<span class="bill-row">&#8377; <%=entry.getValue().getPrice() %></span>
			<span class="bill-row"><%=entry.getValue().getQuantity() %></span>
			<span class="bill-row">&#8377; <%=entry.getValue().getQuantity()*entry.getValue().getPrice() %></span>
			</div>
			<% } }
			} %>
			
		</div>
		<div class="totalbill-container">
			<div class="subtotal">
			<p >Sub Total</p>
			<p>&#8377; <%=subTotal %></p>
			</div>
			<div class="tax">
			<p>Tax</p>
			<p>&#8377; <%=tax %> %</p>
			</div>
			<div class="grand-total">
			<p class="grand-total-title">Grand Total</p>
			<p class="grand-total-title">&#8377; <%=grandTotal %></p>
			</div>
		</div>
		<div class="design"></div>
	</div>
	<div class="payment-container">
	<a id="container1" class="payment">Payment Options</a>
	</div>
	<div id="container2" style="display: none;" class="option-container">
	<a href="#container4" id="container3" class="cash-on">Cash On Delivery</a>
	<a href="#container6" id="container5" class="upi">Upi Transaction</a>
	<a href="#container8" id="container7" class="debit">Debit / Credit Card</a>
	</div>
	
	<div id="container4" class="cash-on-container" style="display: none;">
	<form action="CartServlet">
		<label class="enter-address">Enter Delivery Address</label>&nbsp;&nbsp;&nbsp;
		<input class="address-input" type="text" name="deliveryAddress" required><br><br>
		<input type="hidden" name="restaurantId" value="<%=restaurantId%>">
		<input type="hidden" name="userId" value="<%=userId%>">
		<input type="hidden" name="totalAmount" value="<%=grandTotal%>">
		<input type="hidden" name="paymentMode" value="cash on delivery">
		<input type="hidden" name="action" value="order">
		<button class="place-order" type="submit">Place Order</button>
	</form>
	</div>
	
	<div id="container6" class="cash-on-container" style="display: none;">
	<form action="CartServlet">
		<div class="upi-select">
		<a class="select-options">Click To Pay</a>
		<a class="phonepe-img" href=""><img height="80px" width="85px" alt="" src="https://th.bing.com/th?id=OIP._A51wsUMnjvpSI3Rn6N5bgHaHC&w=256&h=243&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"></a>
		<a class="paytm-img" href=""><img height="80px" width="85px" alt="" src="https://th.bing.com/th?q=Paytm+Dark+Theme+Logo&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.5&pid=InlineBlock&mkt=en-IN&cc=IN&setlang=en&adlt=moderate&t=1&mw=247"></a>
		<a class="amazon-img" href=""><img height="80px" width="85px" alt="" src="https://th.bing.com/th/id/OIP.f3ozXkic__flOF348L03lQHaEy?w=236&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"></a>
		</div>
		<label class="enter-address">Enter Delivery Address</label>&nbsp;&nbsp;&nbsp;
		<input class="address-input" type="text" name="deliveryAddress" required><br><br>
		<input type="hidden" name="restaurantId" value="<%=restaurantId%>">
		<input type="hidden" name="userId" value="<%=userId%>">
		<input type="hidden" name="totalAmount" value="<%=grandTotal%>">
		<input type="hidden" name="paymentMode" value="Upi Transaction">
		<input type="hidden" name="action" value="order">
		<button class="place-order" type="submit">Place Order</button>
	</form>
	</div>
	
	<div id="container8" class="cash-on-container-card" style="display: none;">
	<form action="CartServlet">
	<table>
		<tr>
			<td><label class="enter-address">Card Number</label><br><br></td>
			<td><input class="address-input2" type="text" name="cardNumber" placeholder="0095  2586  6541  3256"><br><br></td>
		</tr>
		<tr>
			<td><label class="enter-address">Holder Name</label><br><br></td>
			<td><input class="address-input2" type="text" name="holderNumber"><br><br></td>
		</tr>
		<tr>
			<td><label class="enter-address">Expiry Date</label><br><br></td>
			<td><input class="address-input2" type="text" name="expiryDate" placeholder="11/2025"><br><br></td>
		</tr>
		<tr>
			<td><label class="enter-address">Cvv Number</label><br><br></td>
			<td><input class="address-input2" type="password" name="cvvNumber"  maxlength="3" min="3"><br><br></td>
		</tr>
		<tr>
			<td><label class="enter-address">Delivery Address</label>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><input class="address-input2" type="text" name="deliveryAddress" required></td>
		</tr>
		
	</table>
		<input type="hidden" name="restaurantId" value="<%=restaurantId%>">
		<input type="hidden" name="userId" value="<%=userId%>">
		<input type="hidden" name="totalAmount" value="<%=grandTotal%>">
		<input type="hidden" name="paymentMode" value="Debit/Credit Card">
		<input type="hidden" name="action" value="order">
		<button class="place-order" type="submit">Place Order</button>
	</form>
	</div>
	
	<% subTotal=0; grandTotal=0; siNo=1; %>
	
	
	<div class="audio" >

		<audio id="audioPlayer">
			<source src="audio/amsOrderSms.mp3" type="audio/mpeg">
		</audio>
	</div>
	
	<script>
	
	document.getElementById("container1").addEventListener("click", function(event) {
	    event.preventDefault();
	    var container2 = document.getElementById("container2");
	    if (container2.style.display === "none") {
	        container2.style.display = "flex"; 
	    } 
	});
	
	document.getElementById("container3").addEventListener("click", function(event) {
	    event.preventDefault();
	    var container2 = document.getElementById("container4");
	    var container3 = document.getElementById("container6");
	    var container4 = document.getElementById("container8");
	    if (container2.style.display === "none") {
	        container2.style.display = "grid"; 
	        container3.style.display = "none";
	        container4.style.display = "none"; 
	    } 
	});
	
	document.getElementById("container5").addEventListener("click", function(event) {
	    event.preventDefault();
	    var container2 = document.getElementById("container6");
	    var container3 = document.getElementById("container4");
	    var container4 = document.getElementById("container8");
	    if (container2.style.display === "none") {
	        container2.style.display = "grid"; 
	        container3.style.display = "none";
	        container4.style.display = "none"; 
	    } 
	});
	
	document.getElementById("container7").addEventListener("click", function(event) {
	    event.preventDefault();
	    var container2 = document.getElementById("container8");
	    var container3 = document.getElementById("container4");
	    var container4 = document.getElementById("container6");
	    if (container2.style.display === "none") {
	        container2.style.display = "grid"; 
	        container3.style.display = "none"; 
	        container4.style.display = "none"; 
	    } 
	});

	 const toggleButton = document.getElementById('nightModeToggle');
		const body = document.getElementById('body');
		const modeIcon = document.getElementById('modeIcon');
		const titlecontainer = document.getElementById('titlecontainer');
		
     toggleButton.addEventListener('click', function() {
         body.classList.toggle('night-mode');
         titlecontainer.classList.toggle('night-mode');
         
         if (titlecontainer.classList.contains('night-mode')) {
             modeIcon.innerHTML = "<i class='fas fa-sun'></i>"; 
             toggleButton.innerHTML = "<span id='modeIcon'><i class='fas fa-sun'></i></span> Day Mode";
         } else {
             modeIcon.innerHTML = "<i class='fas fa-moon'></i>";
             toggleButton.innerHTML = "<span id='modeIcon'><i class='fas fa-moon'></i></span> Night Mode";
         }
     });
     
//      document.querySelectorAll('.place-order').forEach(function(button) {
//     	    button.addEventListener('click', function() {
//     	        var audio = document.getElementById('audioPlayer');
//     	        var audioFile = this.getAttribute('data-audio');
//     	        var audioSrc = 'audio/' + audioFile;
    	        
//     	        console.log('Attempting to play:', audioSrc);
    	        
//     	        audio.src = audioSrc;
//     	        audio.load();
    	        
//     	        var delay = 5000; 
    	        
//     	        setTimeout(function() {
//     	            audio.play().catch(function(error) {
//     	                console.log('Error playing audio:', error);
//     	            });
//     	        }, delay);
//     	    });
//     	});

	</script>
	
</body>
</html>