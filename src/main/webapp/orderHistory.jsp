<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,com.foodapp.model.OrderItem,com.foodapp.model.Menu,com.foodapp.model.OrderHistory,com.foodapp.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order History Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  crossorigin="anonymous" referrerpolicy="no-referrer" />            
<style>
	@import url('https://fonts.googleapis.com/css2?family=Calistoga&family=Playwrite+AR:wght@100..400&family=Playwrite+BE+VLG:wght@100..400&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Pacifico&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Libre+Franklin:ital,wght@0,100..900;1,100..900&family=Merienda:wght@300..900&family=Pacifico&family=Timmana&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Moderustic:wght@700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Bungee+Tint&display=swap');
	

* {
    box-sizing: border-box;
    margin: 0;
}
.title{
	width : 100%;
	position : fixed;
	display : flex;
	justify-content : space-around;
	box-shadow : 1px 1px 2px black;
}
.your-cart{
	font-family : "Calistoga", serif;
	color : rgb(245, 132, 47);
	padding : 0.5em 5em;
	font-size : 1.3rem;
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
.bottomicon{
	font-family: "Calistoga", serif;
	padding : 0.5em 5em;
	color : rgb(245, 132, 47);
	text-decoration : none;
	font-size : 1.1rem;
}
.bottomicon:hover{
	color : white;
	background-color : #080808;
}
.history-container{
	position : fixed;
	top : 3rem;
	width : 100%;
	margin : 2rem 0rem 0rem 0rem;
	display : flex;
	flex-direction : column;
	justify-content : flex-start;
	max-height: 89vh;
    overflow-y: auto;
}
.history-card{
	width : 90%;
	margin : 1rem auto;
	display: flex;
    flex-direction: column;
    gap: 20px;
    box-shadow : 1px 1px 5px black;
}
.item-card{
	width : 100%;
    display : flex;
    flex-direction : column;
    justify-content : space-between;
}

.history-card-total{
	display: flex;
	flex-direction : row;
	justify-content : space-between;
	background-color : rgb(40, 200, 200);
	padding : 0.5rem 0rem;
}
.card{
	display: flex;
	flex-direction : row;
	width : 100%;
	justify-content : space-between;
	height : 100px;
	margin : 1rem auto;
	align-items : center;
	font-size : 1.5rem;
	border-bottom : 2px solid silver;
}
.menu-img{
	height : 98px;
	width : 150px;
	text-align : left;
}
.img-container{
	width : 15%;
	text-align : left;
}
.menu-name{
	width : 25%;
	text-align : left;
	font-family : "Calistoga", serif;
	background : linear-gradient(to right,rgb(2, 192, 244),rgb(2, 192, 244),rgb(3, 173, 116),rgb(244, 2, 228),red);
	-webkit-background-clip : text;
	background-clip : text;
	color : transparent;
}
.menu-price{
	width : 20%;
	text-align : center;
	font-family : "Calistoga", serif;
	color : rgb(0, 171, 0);
	font-size : 1.3rem;
}
.menu-quantity{
	width : 15%;
	text-align : center;
	font-family : "Calistoga", serif;
	font-size : 1.3rem;
	color : tomato;
}
.subtotal{
	width : 20%;
	text-align : center;
	text-align : center;
	font-family : "Calistoga", serif;
	font-size : 1.3rem;
	color : rgb(6, 78, 245);
	
}
.status{
	padding : 0.5em 1em;
	font-size : 1.2rem;
	font-family : impact;
	color : red;
}
.order-status-msg{
	font-size : 1.2rem;
	margin : 0rem 0.5rem 0rem 0rem;
	color :rgba(0, 0, 0, 0.683);
}
.order-date{
	padding : 0.5em 1em;
	font-size : 1.2rem;
	font-family : impact;
	color : white;
}
.order-date-msg{
	font-size : 1.2rem;
	margin : 0rem 0.5rem 0rem 0rem;
	color : rgba(0, 0, 0, 0.683);
}
.total-amount{
	padding : 0.5em 1em;
	font-size : 1.2rem;
	width : 22%;
	font-family : impact;
	color : white;
}
.total-amount-msg{
	font-size : 1.2rem;
	margin : 0rem 0.5rem 0rem 0rem;
	color : rgba(0, 0, 0, 0.683);
	
}
.Restaurant-name-msg{
	font-family : "Calistoga", serif;
	font-size : 0.9rem;
	margin : 0rem 0rem 0rem 0.5rem;
	color : silver;
}
.restaurant-name{
	font-family : verdana;
	font-size : 1.5rem;
	margin : 0rem 0rem 0rem 0.5rem;
	color : skyblue;
	font-weight : bold;
}

.sino{
	border : 0;
	padding : 0.5em 1em;
	font-size : 1.2rem;
	text-align : left;
	font-family : "Calistoga", serif;
	background-color : white;
	font-weight : bold;
	box-shadow : 1px 1px 5px black;
	border-radius : 30px;
	margin : 0.1rem 0rem 0.3rem 0.3rem;
	
}
.more-info-container{
	display : flex;
	justify-content:space-between;
}

.more-info{
	width : 10%;
	text-align : center;
	font-family : impact;
	cursor : pointer;
	color : black;
}
.more-info:hover{
	color : rgb(248, 91, 0);
	text-decoration : underline;
}
.night-mode {
            background-color : #080808;
        }
.night-mode .title{
	border : 2px solid white;
	box-shadow : 1px 1px 5px white;
}
.night-mode .bottomicon:hover, .night-mode .home:hover{
 	background-color : rgb(245, 132, 47);
 	color : white;
 }
.night-mode .history-card{
	box-shadow : 3px 3px 5px white;
	border : 1px solid white;
}
.night-mode .more-info{
	color : white;
}
.night-mode .subtotal {
	color : skyblue;
}
.night-mode .more-info:hover{
	color : rgb(245, 132, 47);
}
.empty-history{
	display : flex;
	flex-direction : row;
	justify-content:center;
	align-items : center;
	height : 80vh;
}
.empty-history-msg{
	font-family : "Calistoga", serif;
	font-size : 2rem;
	color : skyblue;
}

 
</style>
</head>
<body id="body">
	<%ArrayList<OrderItem> allOrderItemList = (ArrayList) session.getAttribute("allOrderItemList"); %>
	<%ArrayList<Menu> menuList = (ArrayList) session.getAttribute("menuList"); %>
	<%ArrayList<OrderHistory> orderHistoryList = (ArrayList) session.getAttribute("orderHistoryList"); %>
	<%ArrayList<Restaurant> restaurantList = (ArrayList) session.getAttribute("restaurantList"); %>
	
	<%int siNo = 1; %>
	
	
	<div id="title" class="title">
		
		<a class="your-cart"><i class="fa fa-history" aria-hidden="true"></i>&nbsp; Your History</a>
		<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
         </a>
		<a href="home.jsp" class="home">Home</a>
	</div>
	<% if(orderHistoryList != null || menuList != null || allOrderItemList != null || restaurantList != null){ %>
	<div class="history-container">
	
	<%for(int i=0;i<orderHistoryList.size();i++){ %>
	<div  class="history-card" >
	
	<div class="item-card">
		<% for(OrderItem oi : allOrderItemList){ %>
			<%if(orderHistoryList.get(i).getOrderId()==oi.getOrderId()){ %>
			<% for(Menu menu : menuList){ %>
			<%if(oi.getMenuId()==menu.getMenuId()){ %>
			<div id="card" class="card" style="display: none;">
				<span class="img-container"><img class="menu-img" alt="<%=menu.getMenuName()%>" src="<%=menu.getImgPath()%>"></span>
				<span class="menu-name"><%=menu.getMenuName() %></span>
				<span class="menu-price">&#8377; <%=menu.getPrice() %></span>
				<span class="menu-quantity"><%=oi.getQuantity() %></span>
				<span class="subtotal">&#8377; <%=oi.getSubTotal() %></span>
			</div>
			<%} %>
			<%} %>
			<%} %>
		<%} %>
	</div>
		<div class="more-info-container">
			<% for(int j=0;j<restaurantList.size();j++){ %>
			<%if(i==j){ %>
			<span class="Restaurant-name-msg"><span class="restaurant-name"><%=restaurantList.get(j).getRestaurantName() %>  - </span><%=restaurantList.get(j).getAddress() %></span>
			
			<%} %>
			<%} %>
			<a id="moreinfo" class="more-info">More Info <i class="fas fa-angle-double-right"></i></a>
		</div>
		<div class="history-card-total">
			<p class="sino"><%=siNo++ %></p>
			<p class="status"><span class="order-status-msg">Order Status &nbsp;-</span><%=orderHistoryList.get(i).getStatus() %></p>
			<p class="order-date"><span class="order-date-msg">Ordered Date&nbsp; - </span><%
			
			String orderDate = orderHistoryList.get(i).getOrderDate();
			String[] datePart = orderDate.split(" ");
			String totalDate = datePart[0];
			String time = datePart[1];
			
			String[] dateSplit = totalDate.split("-");
			String year = dateSplit[0];
			String month = dateSplit[1];
			String date = dateSplit[2];
			
			String[] timeSplit = time.split(":");
			String hour = timeSplit[0];
			String minute = timeSplit[1];
			String second = timeSplit[2];
			
			int monthnumber = Integer.parseInt(month.trim());
			String monthName = null;
			
			switch (monthnumber) {
            case 1:
                monthName = "January";
                break;
            case 2:
                monthName = "February";
                break;
            case 3:
                monthName = "March";
                break;
            case 4:
                monthName = "April";
                break;
            case 5:
                monthName = "May";
                break;
            case 6:
                monthName = "June";
                break;
            case 7:
                monthName = "July";
                break;
            case 8:
                monthName = "August";
                break;
            case 9:
                monthName = "September";
                break;
            case 10:
                monthName = "October";
                break;
            case 11:
                monthName = "November";
                break;
            case 12:
                monthName = "December";
                break;
            default:
                monthName = "Invalid month number";
                break;
        }
			
			%><%=" "+year+" "+monthName+" "+date +"    |     Time  :   "+hour+"  -  "+minute +"  -  "+second %></p>
			<p class="total-amount"><span class="total-amount-msg">Total Amount&nbsp; -</span>&#8377; <%=orderHistoryList.get(i).getTotalAmount() %></p>
		</div>
	</div>
	<%} %>
	</div>
	<% } else{ %>
		<div class="empty-history">
        	<p class="empty-history-msg">Your History Is Empty!! Order Items.. Your Wish...</p>
        </div>
	<% }%>
	
	<script type="text/javascript">
		
		var moreInfoLinks = document.getElementsByClassName("more-info");

		for (var i = 0; i < moreInfoLinks.length; i++) {
			moreInfoLinks[i].addEventListener("click",
					function(event) {
						event.preventDefault();
						
						 var cards = document.getElementsByClassName("card");
						    
					 	    for (var j = 0; j < cards.length; j++) {
					 	        if (cards[j].style.display === "none" || cards[j].style.display === "") {
					 	            cards[j].style.display = "flex"; 
					 	        }
								else {
									card[j].style.display = "none";
									}
					 	        
					 	    }
					});
		}
		
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
	<%siNo=0; %>
</body>
</html>