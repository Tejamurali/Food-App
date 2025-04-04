<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.foodapp.model.Cart,com.foodapp.model.CartItem,java.util.Map,java.util.Map.Entry" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<link rel="stylesheet" href="cart">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  crossorigin="anonymous" referrerpolicy="no-referrer" />            

<style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Pacifico&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Merienda:wght@300..900&family=Pacifico&family=Timmana&display=swap');

@charset "ISO-8859-1";

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
}
.your-cart{
	font-family : "Calistoga", serif;
	color : rgb(245, 132, 47);
	padding : 0.5em 5em;
	font-size : 1.1rem;
}
.side-dishes{
	font-family : "Calistoga", serif;
	color : rgb(245, 132, 47);
	padding : 0.5em 5em;
}
.restaurant-msg{
	font-size : 1.5rem;
	font-family : impact;
}
.restaurant-msg:hover{
	font-size : 1.4rem;
	transition : ease-in-out 1s;
	background-color :  rgb(245, 132, 47);
}
.restaurant{
	text-decoration : none;
	color : rgb(61, 158, 254);
}
.restaurant:hover{
	color : white;
}
.add-moreitems{
	font-family : impact;
	font-size : 1.5rem;
}
.add-moreitems:hover {
	font-size : 1.4rem;
	transition: ease-in-out 1s;
	color : white;
	background-color : #18bcf2;
}

.add-more{
	color : rgb(2, 163, 109);
	text-decoration : none;

}
.add-more:hover{
	color : white;
}

.cart-container{
	position : fixed;
	top : calc(100vh - 92vh);
	left : 0vw;
	width : calc(100vw - 20vw);
	padding : 1rem 0rem 0rem 1rem;
	height: calc(100vh - 8vh);
    overflow-y: auto;
}
.item-container{
	display: inline-block;
}
.item-container{
	display : flex;
	flex-direction : row;
	justify-content : space-between;
	margin : 0rem 0rem 1rem 0rem;
	border-bottom : 2px solid silver;
	width : 100%;
	text-align : center;
	align-items : center;
}

.item-img{
	height : auto;
	width : 10vw;
	border-radius : 5px;
}
.item-name{
	font-family: "Calistoga", serif;
	background : linear-gradient(to right,rgb(2, 192, 244),rgb(2, 192, 244),rgb(3, 173, 116),rgb(244, 2, 228),red);
	-webkit-background-clip : text;
	background-clip : text;
	color : transparent;
	width : 18%;
	font-size : 1.3rem;
	text-align : left;
}
.item-price{
	font-family: "Calistoga", serif;
	color : rgb(0, 171, 0) ;
	font-weight : bold;
}
.item-quantity{
	font-family: "Calistoga", serif;
	color : tomato;
	font-weight : bold;
}
.item-subtotal{
	border : 0;
	border-radius : 3px;
	padding : 0.3em 0.6em;
	background-color : #eaedf0be;
	box-shadow : 0px 0px 20px #EAEDF0;
	font-family: "Calistoga", serif;
	color : rgb(6, 78, 245);
}
#subtotal{
	font-family : verdana;
	color : grey;
}
.item-update{
	border : 0;
	border-radius : 3px;
	padding : 0.1em 0.5em;
	font-family : "Calistoga", serif;
	cursor : pointer;
	background-color : white;
	font-size : 1rem;
	color : rgb(4, 176, 119);
}
.item-update:hover{
	background-color : #18bcf2;
	box-shadow : 1px 1px 10px #18bcf2;
	color : white;
}
.update{
	text-decoration : none;
	
}
.update:hover{
	color : white;
}
.item-delete{
	border : 0;
	border-radius : 3px;
	padding : 0.1em 0.5em;
}
.item-delete:hover{
	background-color : red;
	box-shadow : 1px 1px 10px red;
}
.delete{
	text-decoration : none;
	color : rgb(4, 176, 119);
	font-family : "Calistoga", serif;
}
.delete:hover{
	color : white;
}
.empty-cart{
	display : flex;
	flex-direction : row;
	justify-content:center;
	align-items : center;
	height : 85vh;
}
.empty-cart-msg{
	font-family : "Calistoga", serif;
	font-size : 2.5rem;
	color : skyblue;
}
.update-input{
	font-family : "Calistoga", serif;
	color : tomato;
	border : 0;
	font-weight : bold;
	width : 40%;
	font-size : 1rem;
	text-align : center;
	border-radius : 10px;
	
}
.item-form{
	width : 15%;
}
.update-input:focus{
	border-color: #4A90E2; 
	outline : 2px solid #18bcf2;
}
.total-amount{
	position : fixed;
	top :  calc(100vh - 95vh);
	right : 0vw;
	height : calc(100vh - 6vh);
	width : calc(100vw - 82vw);
	display : flex;
	flex-direction : column;
	justify-content : space-around;
	text-align : center;
	box-shadow : 1px 1px 3px black;
}
.total-amountmsg{
	font-size : 1.4rem;
	color : grey;
	font-family : impact;
}
.total-rupees{
	color : rgb(6, 78, 245);
}
.proceed-btn{
	font-family : impact;
	font-size : 1.5rem;
}
.proceed-msg{
	color : green;
	text-decoration : none;
}
.proceed-msg:hover{
	color : white;
}
.proceed-btn:hover{
	font-size : 1.4rem;
	transition : ease-in-out 1s;
	background-color : green;
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
 .night-mode .item-subtotal{
	background-color :  #080808;
	box-shadow : 0px 0px 5px white;
}
.night-mode .update-input {
	background-color :  #080808;
}

.night-mode .item-update{
	background-color :  #080808;
}
 .night-mode .item-update:hover{
 	background-color : #18bcf2;
	box-shadow : 1px 1px 10px #18bcf2;
	color : white;
}
.night-mode .delete{
	color : red;
}
.night-mode .delete:hover{
	color : white;
}
.night-mode .total-amount{
	box-shadow : 1px 1px 5px white;
	border : 2px solid white;
}


</style>
</head>
<body id="body">
	<% Cart cart = (Cart) session.getAttribute("cart");%>
	<%String email = (String) session.getAttribute("email"); %>
	<% 
    int userId = 0;
	 if (session.getAttribute("userId") != null) {
		 userId = (Integer) session.getAttribute("userId");
	    }
	%>
	<% 
    int restaurantId = 0;

    if (session.getAttribute("restaurantId") != null) {
    	try{
    		
    	restaurantId = (Integer) session.getAttribute("restaurantId");
    	}
    	catch(ClassCastException e){%>
    		
    	<% }
    }
	%>
	<% 
    int menuId = 0;
	 if (session.getAttribute("menuId") != null) {
		 menuId = (Integer) session.getAttribute("menuId");
	    }
	%>
	
	<%! float totalAmount; %>
	<% Map<Integer,CartItem> itemsMap=null; ; %>
	<div id="title" class="title">
		
		<a class="your-cart">&#x1F6D2; Your Cart</a>
		<a href="home.jsp"  class="home">Home</a>
		<a href="RestaurantServlet?userId=<%=userId%>"  class="home">Restaurants</a>
		<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
         </a>
	</div>
	<div class="cart-container">
	 <% if (cart != null) {
		 itemsMap = cart.fetchAllItems();
        if(!itemsMap.isEmpty()){
        for (Map.Entry<Integer,CartItem> entry : itemsMap.entrySet()) {
        	totalAmount = totalAmount + entry.getValue().getQuantity()*entry.getValue().getPrice();
       %>
		<div class="item-container">
		
			<div class="item-img-span"><img class="item-img" alt="<%=entry.getValue().getMenuName() %>" src="<%=entry.getValue().getImgPath()%>"></div>
			<div class="item-name"><%out.println(entry.getValue().getMenuName());%></div>
			<div class="item-price">&#8377; <%out.println(entry.getValue().getPrice());%></div>
			<div id="item-quantity" class="item-quantity"><%out.println(entry.getValue().getQuantity());%></div>		
			
			<div class="item-subtotal"><span id="subtotal" class="sub-total">Sub Total&nbsp;</span> &#8377; <%out.println(entry.getValue().getPrice()*entry.getValue().getQuantity());%></div>
			<div class="item-form">
			<form action="CartServlet">
			<input class="update-input" type="number" name="quantity" value="<%= entry.getValue().getQuantity()%>"  min="1" >
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="email" value="<%=email%>">
			<input type="hidden" name="userId" value="<%=userId%>">
			<input type="hidden" name="itemId" value="<%= entry.getValue().getItemId()%>">
			<button type="submit" class="item-update">Update &#x1F5D8;</button>
			</form>
			</div>
			<div class="item-delete"><a class="delete" href="CartServlet?action=remove&&itemId=<%out.println(entry.getValue().getItemId());%>&&email=<%=email%>&&userId=<%=userId%>">Delete &#x24E7;</a></div>
		</div>
		
		<%  } }%>
    </div>
    <div class="total-amount">
    <p class="restaurant-msg"><a class="restaurant" href="RestaurantServlet?userId=<%=userId%>">Go Restaurants</a></p>
    <p class="add-moreitems"><a class="add-more" href="menu.jsp">Add More Items</a></p>
    <p></p>
    <%if(!itemsMap.isEmpty()){ %>
    <p class="total-amountmsg">Total Amount &nbsp;<span class="total-rupees"> &#8377; <%out.println(totalAmount);%></span></p>
    <%} else {%>
    <p class="total-amountmsg">Total Amount &nbsp;<span class="total-rupees"> &#8377; <%=totalAmount=0%></span></p>
    <%} %>
    <% if(!itemsMap.isEmpty()){ %>
    <p class="proceed-btn"><a href="CartServlet?action=bill&&email=<%=email%>&&userId=<%=userId %>&&restaurantId=<%=restaurantId %>&&menuId=<%=menuId %>" class="proceed-msg">Proceed To Pay</a></p>
    <%} %>
    </div>
    
    <% }%>
	
	<%if(itemsMap==null ||itemsMap.isEmpty()||cart==null) {%>
	<div class="empty-cart">
        	<p class="empty-cart-msg">Your Cart Is Empty! Add Items Into Cart...</p>
        </div>
    <%} %>   
  <%totalAmount = 0; %>
  
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