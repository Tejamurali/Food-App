<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Help Page</title>
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
	font-family : "Calistoga", serif;
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
.leftnav{
	position: fixed;
	top : calc(100vh - 96vh);
    height: 96vh; 
    width: 20vw; 
    box-shadow: 1px 1px 1px;
    display : flex;
    flex-direction : column;
}
.nav-legal,.nav-faq,.nav-instamart{
	margin : 1rem 0rem;
	font-size : 1.3rem;
	padding : 0.5rem 0rem 0.5rem 2rem;
	font-family: "Moderustic", sans-serif;
	font-weight : bold;
}
.nav-partner{
	margin : 2rem 0rem 0rem 0rem;
	font-size : 1.3rem;
	padding : 0.5rem 0rem 0.5rem 2rem;
	font-family: "Moderustic", sans-serif;
	font-weight : bold;
	color : white;
	background-color : rgb(245, 132, 47);
}

.nav-legal:hover,.nav-faq:hover,.nav-partner:hover,.nav-instamart:hover{
	background-color : rgb(245, 132, 47);
	color : white;
	cursor : pointer;
}
.legal-container,.faq-container,.partner-container,.instamart-container{
	position : fixed;
	right : 0;
	top : calc(100vh - 94vh);
	width : 75vw;
	height : 93vh;
	display : flex;
	flex-direction : column;
	overflow-y : auto;
}
.legal-desc,.faq-desc,.partner-desc,.instamart-desc{
	padding : 1rem 0rem;
	border-bottom : 1px solid silver;
}
.terms-of-use,.privacy,.cancellations,.ams-on-time,.customer-care,.explore-career,
.feedback,.order-edit,.order-cancel,.minimum-order,.delivery-charge,.delivery-time,
.delivery-hours,.delivery-location,.single-order,.bulk-order,.advance-order,.change-address,
.otp,.deactive,.invoice,.partner-ams,.documents,.opt-out,.documents-sbmit,.fees,.contact,
.commision,.licence,.partner-instamart,.cities,.time-onboard,.volumes,.sales,.ads,.new-cities
{
	font-size : 1.3rem;
	text-decoration : none;
	color : black;
	cursor : pointer;
	font-family: "Moderustic", sans-serif;
}
.terms-of-use:hover,.privacy:hover,.cancellations:hover,.ams-on-time:hover,
.customer-care:hover,.explore-career:hover,.feedback:hover,.order-edit:hover,
.order-cancel:hover,.minimum-order:hover,.delivery-charge:hover,.delivery-time:hover,
.delivery-hours:hover,.delivery-location:hover,.single-order:hover,.bulk-order:hover,
.advance-order:hover,.change-address:hover,.otp:hover,.deactive:hover,.invoice:hover,
.partner-ams:hover,.documents:hover,.opt-out:hover,.documents-sbmit:hover,.fees:hover,
.contact:hover,.commision:hover,.licence:hover,.partner-instamart:hover,.cities:hover,
.time-onboard:hover,.volumes:hover,.sales:hover,.ads:hover,.new-cities:hover
{
	color : rgb(245, 132, 47);
}
.legal-title,.faq-title,.partner-title,.instamart-title{
	font-size : 1.5rem;
	padding : 1rem 0rem;
	font-family: "Moderustic", sans-serif;
	font-weight : bold;
}


.terms-desc,.privacy-desc,.cancellations-desc,.ams-on-time-desc,
.customer-care-desc,.explore-career-desc,.feedback-desc,.order-edit-desc,
.order-cancel-desc,.minimum-order-desc,.delivery-charge-desc,.delivery-time-desc,
.delivery-hours-desc,.delivery-location-desc,.single-order-desc,.bulk-order-desc,
.advance-order-desc,.change-address-desc,.otp-desc,.deactive-desc,.invoice-desc,
.partner-ams-desc,.documents-desc,.opt-out-desc,.documents-sbmit-desc,.fees-desc,
.contact-desc,.commision-desc,.licence-desc,.partner-instamart-desc,.cities-desc,
.time-onboard-desc,.volumes-desc,.sales-desc,.ads-desc,.new-cities-desc
{
	margin : 1rem 0rem 0rem 0rem;
	font-size : 1rem;
	font-family : verdana;
	line-height: 3ch;
}
.send-email{
	border : 1px solid red;
	padding : 0.5rem 1rem;
	text-decoration : none;
	color :  rgb(245, 132, 47);
	font-family : verdana;
	width : 15%;
	text-align : center;
}
.explore-career-desc-join{
	color : rgb(245, 132, 47);
	text-decoration : none;
	font-size : 1.1rem;
}
.explore-career-desc-join:hover{
	color : rgb(245, 132, 47);
}
.night-mode {
            background-color : #080808;
        }

.night-mode .title,.night-mode .leftnav{
	border : 2px solid white;
	box-shadow : 1px 1px 5px white;
}

.night-mode p,.night-mode a{
	color : white;
}
 .night-mode .your-cart, .night-mode .home, .night-mode .bottomicon
 {
 	color : white;
 }
 .night-mode .bottomicon:hover, .night-mode .home:hover{
 	background-color : rgb(245, 132, 47);
 	color : white;
 }
 
 
</style>

</head>
<body id="body">
   <div id="title" class="title">
		
		<a class="your-cart"><i class='fas fa-hands-helping'></i> Help & Support</a>
		<a href="#" id="nightModeToggle" class="bottomicon">
                <span id="modeIcon"><i class='fas fa-moon'></i></span> Night Mode
         </a>
		<a href="home.jsp"  class="home">Home</a>
	</div>
	<div class="leftnav">
	<a id="navpartner" class="nav-partner">Partner Onboarding</a>
	<a id="navlegal" class="nav-legal">Legal</a>
	<a id="navfaq" class="nav-faq">FAQs</a>
	<a id="instamart" class="nav-instamart">Instamart Onboarding</a>
	</div>
	
	<div id="legalcontainer" class="legal-container" style="display: none;">
		<p class="legal-title">Legal</p>
		<div class="legal-desc" >
		<a class="terms-of-use">Terms of Use</a>
			<div class="terms-desc" style="display: none;">
				<p class="tems-desc-para">These terms of use (the "Terms of Use") govern your use of our website www.AMS food delivery.
					  in (the "Website") and our "AMS" application for mobile and handheld devices (the "App").
					 The Website and the App are jointly referred to as the "Services").
				 	 Please read these Terms of Use carefully before you download, install or use the Services.
					 If you do not agree to these Terms of Use, you may not install, download or use the Services. 
				 	 By installing, downloading or using the Services, you signify your acceptance to the Terms of
				 	 Use and Privacy Policy (being hereby incorporated by reference herein) which takes effect on 
				 	 the date on which you download, install or use the Services, and create a legally binding arrangement to abide by the same.
				 </p>
			</div>
		</div>
		<div class="legal-desc">
		<a class="privacy" >Privacy Policy</a>
			<div class="privacy-desc" style="display: none;">
				<p class="privacy-desc-para">We ( Bundl Technologies Private Limited, alias "AMS" ) are fully committed to respecting your privacy 
					and shall ensure that your personal information is safe with us. This privacy policy sets out the information practices of www.AMS food delivery.com 
					("Website") including the type of information is collected, how the information is collected, how the information is used and with whom it 
					is shared. Reference to "you" in this Privacy Policy refers to the users of this Website whether or not you access the services available on
					 the Website or consummate a transaction on the Website. By using or accessing this Website, you agree to the terms and conditions of this 
					 Privacy Policy. You also expressly consent to our use and disclosure of your Personal Information (as defined below) in any manner as described
					  in this Privacy Policy and further signify your agreement to this Privacy Policy and the Terms of Use (being incorporated by reference herein). 
					  If you do not agree with the terms and conditions of this Privacy Policy, please do not proceed further or use or access this Website.
				 </p>
			</div>
		</div>
		<div class="legal-desc">
		<a class="cancellations" href="" >Cancellations and Refunds</a>
			<div class="cancellations-desc" style="display: none;">
				<p class="cancellations-desc-para">a) As a general rule you shall not be entitled to cancel your order once placed. You may choose to cancel your order
					 only within one-minute of the order being placed by you. However, subject to your previous cancellation history, Swiggy reserves the right to deny any 
					 refund to you pursuant to a cancellation initiated by you even if the same is within one-minute.  b)If you cancel your order after one minute of placing 
					 it, Swiggy shall have a right to charge you 100% of the order amount as the cancellation fee , with a right to either not to refund the order value in case
				 	 your order is prepaid or recover from your subsequent order in case your order is postpaid, to compensate our restaurant/merchants and delivery partners.
				     c)Swiggy reserves the right to charge you cancellation fee for the orders constrained to be cancelled by Swiggy for reasons not attributable to Swiggy, 
				    including but not limited to: i)in the event if the address provided by you is either wrong or falls outside the delivery zone; ii) failure to contact 
				    you by phone or email at the time of delivering the order booking; iii) failure to deliver your order due to lack of information, direction or authorization 
				    from you at the time of delivery; or iv) unavailability of all the items ordered by you at the time of booking the order. 
				  </p>
			</div>
		</div>
		<div class="legal-desc">
		<a class="ams-on-time">Terms of Use for AMS ON-TIME / Assured</a>
			<div class="ams-on-time-desc" style="display: none;">
				<p class="ams-on-time-desc-para">These terms of use (the "Terms of Use") that govern your use of our service AMS ON-TIME / Assured  ("ON-TIME" / "Assured")
				 on our website www.AMS food delivery.in (the "Website") and our AMS application for mobile and handheld devices (the "App"). The services on ON-TIME / Assured  available 
				 on our Website and the App are jointly referred to as the "On-Time Delivery". Please read these Terms of Use carefully before you use the Services. If you do not
				  agree to these Terms of Use, you may not use the Services. By using the Services, you signify your acceptance to the Terms of Use and Privacy Policy 
				  (incorporated by reference herein) and creates a legally binding arrangement to abide by the same. 
				 </p>
			</div>
		</div>
	</div>
	
	
	<div id="faqcontainer" class="faq-container" style="display: none;">
		<p class="faq-title">FAQs</p>
		<div class="faq-desc">
			<a class="customer-care">What is AMS Customer Care Number?</a>
			<div class="customer-care-desc" style="display: none;">
				<p class="customer-care-desc-para">We value our customer's time and hence moved away from a single customer care number to a comprehensive chat-based support system for
				 quick and easy resolution. You no longer have to go through the maze of an IVRS call support. Just search for your issue in the help section on this page and initiate a 
				 chat with us. A customer care executive will be assigned to you shortly. You can also email us your issue on support@ams.in
				<br><br>
				 Note: We value your privacy and your information is safe with us. Please do not reveal any personal information, bank account number, OTP etc. to another person.
				  A AMS representative will never ask you for these details. Please do not reveal these details to fraudsters and imposters claiming to be calling on our behalf.
				   Be vigilant and do not entertain phishing calls or emails. 
				 </p><br>
				 <a href="" class="send-email">SEND AN EMAIL</a><br>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="explore-career">I want to explore career opportunities with AMS</a>
			<div class="explore-career-desc" style="display: none;">
				<a class="explore-career-desc-join" href="">Join our team</a>
				<br>
				 <a href="" class="send-email">SEND AN EMAIL</a>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="feedback">I want to provide feedback</a>
			<div class="feedback-desc" style="display: none;">
				 <a href="" class="send-email">SEND AN EMAIL</a>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="order-edit">Can I edit my order?</a>
			<div class="order-edit-desc" style="display: none;">
				 <p>Your order can be edited before it reaches the restaurant. You could contact customer support team via chat or call to do so.
				 	 Once order is placed and restaurant starts preparing your food, you may not edit its contents
				  </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="order-cancel">I want to cancel my order</a>
			<div class="order-cancel-desc" style="display: none;">
				 <p>We will do our best to accommodate your request if the order is not placed to the restaurant (Customer service number:  080-67466729).
				   Please note that we will have a right to charge a cancellation fee up to full order value to compensate our restaurant and delivery partners
				   if your order has been confirmed.
				  </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="minimum-order">Is there a minimum order value?</a>
			<div class="minimum-order-desc" style="display: none;">
				 <p>We have no minimum order value and you can order for any amount.</p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="delivery-charge">Do you charge for delivery?</a>
			<div class="delivery-charge-desc" style="display: none;">
				 <p>Delivery fee varies from city to city and is applicable if order value is below a certain amount. Additionally, certain restaurants might
				  have fixed delivery fees. Delivery fee (if any) is specified on the 'Review Order' page. 
				  </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="delivery-time">How long do you take to deliver?</a>
			<div class="delivery-time-desc" style="display: none;">
				 <p>Standard delivery times vary by the location selected and prevailing conditions. Once you select your location, an estimated delivery time 
				 	is mentioned for each restaurant.
				 </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="delivery-hours">What are your delivery hours?</a>
			<div class="delivery-hours-desc" style="display: none;">
				 <p>Our delivery hours vary for different locations and depends on availability of supply from restaurant partners.</p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="delivery-location">Can I order from any location?</a>
			<div class="delivery-location-desc" style="display: none;">
				 <p>We will deliver from any restaurant listed on the search results for your location. We recommend enabling your GPS location
				  finder and letting the app auto-detect your location.
				  </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="single-order">Is single order from many restaurants possible?</a>
			<div class="single-order-desc" style="display: none;">
				 <p>We currently do not support this functionality. However, you can place orders for individual items from different restaurants.
				 </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="bulk-order">Do you support bulk orders?</a>
			<div class="bulk-order-desc" style="display: none;">
				 <p>In order to provide all customers with a great selection and to ensure on time delivery of your meal, we reserve the right to
				  limit the quantities depending on supply.
				  </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="advance-order">Can I order in advance?</a>
			<div class="advance-order-desc" style="display: none;">
				 <p>We currently do not support this functionality. All our orders are placed and executed on-demand. </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="change-address">Can I change the address / number?</a>
			<div class="change-address-desc" style="display: none;">
				 <p>Any major change in delivery address is not possible after you have placed an order with us. However, slight modifications like changing
				  the flat number, street name, landmark etc. are allowed. If you have received delivery executive details, you can directly call him, else you
				   could contact our customer service team.
				   </p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="otp">Did not receive OTP?</a>
			<div class="otp-desc" style="display: none;">
				 <p>Please check if your app is due for an update. If not, please share the details via support@ams.in</p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="deactive">Deactivate my account</a>
			<div class="deactive-desc" style="display: none;">
				 <p>Please write to us at support@ams.in in the event that you want to deactivate your account.</p>
			</div>
		</div>
		
		<div class="faq-desc">
			<a class="invoice">I want an invoice for my order</a>
			<div class="invoice-desc" style="display: none;">
				 <a href="" class="send-email">SEND AN EMAIL</a>
			</div>
		</div>
		
	</div>
	
	<div id="navpartner" class="partner-container" >
		<p class="partner-title">Partner Onboarding</p>
		
		<div class="partner-desc">
			<a class="partner-ams">I want to partner my restaurant with AMS</a>
			<div class="partner-ams-desc" style="display: none;">
				 <a class="explore-career-desc-join" href="">Partner with us</a>
				<br>
				 <a href="" class="send-email">SEND AN EMAIL</a>
			</div>
		</div>
		
		<div class="partner-desc">
			<a class="documents">What are the mandatory documents needed to list my restaurant on AMS?</a>
			<div class="documents-desc" style="display: none;">
				 <p>
				 	-  Copies of the below documents are mandatory<br>
					-  FSSAI Licence OR FSSAI Acknowledgement<br>
					-  Pan Card<br>
					-  GSTIN Certificate<br>
					-  Cancelled Cheque OR bank Passbook<br>
					-  Menu
				 </p>
			</div>
		</div>
		
		<div class="partner-desc">
			<a class="opt-out">I want to opt-out from Google reserve</a>
			<div class="opt-out-desc" style="display: none;">
				 <a href="" class="send-email">SEND AN EMAIL</a>
			</div>
		</div>
		
		<div class="partner-desc">
			<a class="documents-sbmit">After I submit all documents, how long will it take for my restaurant to go live on AMS?</a>
			<div class="documents-sbmit-desc" style="display: none;">
				 <p>
				 	After all mandatory documents have been received and verified it takes upto 7-10 working days for the onboarding 
				 	to be completed and make your restaurant live on the platform.
				 </p>
			</div>
		</div>
		
		<div class="partner-desc">
			<a class="fees">What is this one time Onboarding fees? Do I have to pay for it while registering?</a>
			<div class="fees-desc" style="display: none;">
				 <p>
				 	This is a one-time fee charged towards the system & admin costs incurred during the onboarding process. 
				 	It is deducted from the weekly payouts after you start receiving orders from AMS.
				 </p>
			</div>
		</div>
		
		<div class="partner-desc">
			<a class="contact">Who should I contact if I need help & support in getting onboarded?</a>
			<div class="contact-desc" style="display: none;">
				<p>You can connect with Partner Support on 080-67466777/68179777 or write to partnersuport@ams.in</p>
				<br>
				 <a href="" class="send-email">SEND AN EMAIL</a>
			</div>
		</div>
		
		<div class="partner-desc">
			<a class="commision">How much commission will I be charged by AMS?</a>
			<div class="commision-desc" style="display: none;">
				 <p>
				 	The commission charges vary for different cities. You will be able to see the commission 
				 	applicable for you once the preliminary onboarding details have been filled.
				 </p>
			</div>
		</div>
		
		<div class="partner-desc">
			<a class="licence">I don't have an FSSAI licence for my restaurant. Can it still be onboarded?</a>
			<div class="licence-desc" style="display: none;">
				 <p>
				 	FSSAI licence is a mandatory requirement according to the government's policies. However,
				 	 if you are yet to receive the licence at the time of onboarding, you can proceed with the 
				 	 acknowledgement number which you will have received from FSSAI for your registration.
				 </p>
			</div>
		</div>
		</div>
		
		<div  class="instamart-container"  style="display: none;">
			<p class="instamart-title">Instamart Onboarding</p>
		
		<div class="instamart-desc">
			<a class="partner-instamart">I want to partner with Instamart</a>
			<div class="partner-instamart-desc" style="display: none;">
				<p>Partner with Instamart (Link: https://www.ams.com/instamart-partner)</p>
				 <a class="explore-career-desc-join" href="">Partner with Instamart</a>
				
			</div>
		</div>
		
		<div class="instamart-desc">
			<a class="cities">How many cities does Instamart operate in?</a>
			<div class="cities-desc" style="display: none;">
				<p>Instamart proudly serves customers in 30 vibrant cities and is consistently expanding its reach 
				to bring convenience and quality to even more locations. We are dedicated to continuous growth, ensuring 
				that more communities can benefit from our top-notch services.
				</p>
				
			</div>
		</div>
		
		<div class="instamart-desc">
			<a class="time-onboard">What is the time to onboard?</a>
			<div class="time-onboard-desc" style="display: none;">
				<p>The onboarding duration is tailored to each product and brand, contingent upon their adherence to our
				 comprehensive onboarding guidelines. We meticulously assess each application to ensure a smooth and efficient
				  integration into the Instamart platform, promising only the finest selections for our esteemed customers.
				</p>
				
			</div>
		</div>
		
		<div class="instamart-desc">
			<a class="volumes">What are the expected volumes in the first 30 days?</a>
			<div class="volumes-desc" style="display: none;">
				<p>The projected sales volumes in the initial 30 days are highly dependent on the brand's reputation and market 
				strategy. We provide personalized support to help each brand maximize its potential, ensuring a successful launch 
				and sustained growth on our platform.
				</p>
				
			</div>
		</div>
		
		<div class="instamart-desc">
			<a class="sales">Do I get sales data?</a>
			<div class="sales-desc" style="display: none;">
				<p>Yes, we furnish detailed day-level sales data, empowering brands with the insights needed to make informed,
				 strategic decisions. This data-driven approach enables our partners to optimize their offerings and enhance their performance continuously.
				</p>
				
			</div>
		</div>
		
		<div class="instamart-desc">
			<a class="ads">How do ads work?</a>
			<div class="ads-desc" style="display: none;">
				<p>Our dedicated advertising portal offers a robust platform for running targeted search ads. Brands can leverage
				 this tool to increase visibility, drive traffic, and boost sales, all while benefiting from our comprehensive support
				  and expertise in digital marketing.
				 </p>
				
			</div>
		</div>
		
		<div class="instamart-desc">
			<a class="new-cities">What are the opportunities for expansion into new cities/SKUs?</a>
			<div class="new-cities-desc" style="display: none;">
				<p>Expansion into new cities or the introduction of additional SKUs is evaluated based on the performance of existing products.
				 Our team conducts thorough assessments to determine the viability and potential success of such expansions, ensuring that each 
				 decision aligns with our strategic growth objectives and market demand.
				 </p>
				
			</div>
		</div>
		
		</div>
		
	
	
	<script>
	
	
	
	var termsofUse = document.getElementsByClassName("terms-of-use")[0];
	var privacy = document.getElementsByClassName("privacy")[0];
	var cancellations = document.getElementsByClassName("cancellations")[0];
	var amsOnTime = document.getElementsByClassName("ams-on-time")[0];
	var customerCare = document.getElementsByClassName("customer-care")[0];
	var exploreCareer = document.getElementsByClassName("explore-career")[0];
	var feedback = document.getElementsByClassName("feedback")[0];
	var orderEdit = document.getElementsByClassName("order-edit")[0];
	var orderCancel = document.getElementsByClassName("order-cancel")[0];
	var minimumOrder = document.getElementsByClassName("minimum-order")[0];
	var deliveryCharge = document.getElementsByClassName("delivery-charge")[0];
	var deliveryTime = document.getElementsByClassName("delivery-time")[0];
	var deliveryHours = document.getElementsByClassName("delivery-hours")[0];
	var deliveryLocation = document.getElementsByClassName("delivery-location")[0];
	var singleOrder = document.getElementsByClassName("single-order")[0];
	var bulkOrder = document.getElementsByClassName("bulk-order")[0];
	var advanceOrder = document.getElementsByClassName("advance-order")[0];
	var changeAddress = document.getElementsByClassName("change-address")[0];
	var otp = document.getElementsByClassName("otp")[0];
	var deactive = document.getElementsByClassName("deactive")[0];
	var invoice = document.getElementsByClassName("invoice")[0];
	var partnerAms = document.getElementsByClassName("partner-ams")[0];
	var documents = document.getElementsByClassName("documents")[0];
	var optOut = document.getElementsByClassName("opt-out")[0];
	var documentSubmit = document.getElementsByClassName("documents-sbmit")[0];
	var fees = document.getElementsByClassName("fees")[0];
	var contact = document.getElementsByClassName("contact")[0];
	var commision = document.getElementsByClassName("commision")[0];
	var licence = document.getElementsByClassName("licence")[0];
	var partnerInstamart = document.getElementsByClassName("partner-instamart")[0];
	var cities = document.getElementsByClassName("cities")[0];
	var timeOnboard = document.getElementsByClassName("time-onboard")[0];
	var volumes = document.getElementsByClassName("volumes")[0];
	var sales = document.getElementsByClassName("sales")[0];
	var ads = document.getElementsByClassName("ads")[0];
	var newCities = document.getElementsByClassName("new-cities")[0];
	
	termsofUse.addEventListener("click", function(event) {
	    event.preventDefault();

	    var termsDesc = document.getElementsByClassName("terms-desc")[0];
	    
	    if (termsDesc.style.display === "none") {
	        termsDesc.style.display = "flex";
	        termsofUse.style.color = "rgb(245, 132, 47)"; 
	    } else {
	        termsDesc.style.display = "none";
	        termsofUse.style.color = "black"; 
	    }
	});
	
	privacy.addEventListener("click", function(event) {
	    event.preventDefault();

	    var privacyDesc = document.getElementsByClassName("privacy-desc")[0];
	    
	    if (privacyDesc.style.display === "none") {
	    	privacyDesc.style.display = "flex";
	    	privacy.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	privacyDesc.style.display = "none";
	    	privacy.style.color = "black"; 
	    }
	});
	
	cancellations.addEventListener("click", function(event) {
	    event.preventDefault();

	    var cancellationsDesc = document.getElementsByClassName("cancellations-desc")[0];
	    
	    if (cancellationsDesc.style.display === "none") {
	    	cancellationsDesc.style.display = "flex";
	    	cancellations.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	cancellationsDesc.style.display = "none";
	    	cancellations.style.color = "black"; 
	    }
	});
	
	amsOnTime.addEventListener("click", function(event) {
	    event.preventDefault();

	    var amsOnTimeDesc = document.getElementsByClassName("ams-on-time-desc")[0];
	    
	    if (amsOnTimeDesc.style.display === "none") {
	    	amsOnTimeDesc.style.display = "flex";
	    	amsOnTime.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	amsOnTimeDesc.style.display = "none";
	    	amsOnTime.style.color = "black"; 
	    }
	});
	
	customerCare.addEventListener("click", function(event) {
	    event.preventDefault();

	    var customerCareDesc = document.getElementsByClassName("customer-care-desc")[0];
	    
	    if (customerCareDesc.style.display === "none") {
	    	customerCareDesc.style.display = "grid";
	    	customerCare.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	customerCareDesc.style.display = "none";
	    	customerCare.style.color = "black"; 
	    }
	});
	
	exploreCareer.addEventListener("click", function(event) {
	    event.preventDefault();

	    var exploreCareerDesc = document.getElementsByClassName("explore-career-desc")[0];
	    
	    if (exploreCareerDesc.style.display === "none") {
	    	exploreCareerDesc.style.display = "grid";
	    	exploreCareer.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	exploreCareerDesc.style.display = "none"; 
	    	exploreCareer.style.color = "black"; 
	    }
	});
	
	feedback.addEventListener("click", function(event) {
	    event.preventDefault();

	    var feedbackDesc = document.getElementsByClassName("feedback-desc")[0];
	    
	    if (feedbackDesc.style.display === "none") {
	    	feedbackDesc.style.display = "grid";
	    	feedback.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	feedbackDesc.style.display = "none";
	    	feedback.style.color = "black"; 
	    }
	});
	
	orderEdit.addEventListener("click", function(event) {
	    event.preventDefault();

	    var orderEditDesc = document.getElementsByClassName("order-edit-desc")[0];
	    
	    if (orderEditDesc.style.display === "none") {
	    	orderEditDesc.style.display = "grid";
	    	orderEdit.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	orderEditDesc.style.display = "none";
	    	orderEdit.style.color = "black"; 
	    }
	});
	
	orderCancel.addEventListener("click", function(event) {
	    event.preventDefault();

	    var orderCancelDesc = document.getElementsByClassName("order-cancel-desc")[0];
	    
	    if (orderCancelDesc.style.display === "none") {
	    	orderCancelDesc.style.display = "grid";
	    	orderCancel.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	orderCancelDesc.style.display = "none"; 
	    	orderCancel.style.color = "black"; 
	    }
	});
	
	minimumOrder.addEventListener("click", function(event) {
	    event.preventDefault();

	    var minimumOrderDesc = document.getElementsByClassName("minimum-order-desc")[0];
	    
	    if (minimumOrderDesc.style.display === "none") {
	    	minimumOrderDesc.style.display = "grid";
	    	minimumOrder.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	minimumOrderDesc.style.display = "none"; 
	    	minimumOrder.style.color = "black"; 
	    }
	});
	
	deliveryCharge.addEventListener("click", function(event) {
	    event.preventDefault();

	    var deliveryChargeDesc = document.getElementsByClassName("delivery-charge-desc")[0];
	    
	    if (deliveryChargeDesc.style.display === "none") {
	    	deliveryChargeDesc.style.display = "grid";
	    	deliveryCharge.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	deliveryChargeDesc.style.display = "none"; 
	    	deliveryCharge.style.color = "black"; 
	    }
	});
	
	deliveryTime.addEventListener("click", function(event) {
	    event.preventDefault();

	    var deliveryHoursDesc = document.getElementsByClassName("delivery-time-desc")[0];
	    
	    if (deliveryHoursDesc.style.display === "none") {
	    	deliveryHoursDesc.style.display = "grid";
	    	deliveryTime.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	deliveryHoursDesc.style.display = "none"; 
	    	deliveryTime.style.color = "black"; 
	    }
	});
	
	deliveryHours.addEventListener("click", function(event) {
	    event.preventDefault();

	    var deliveryTimeDesc = document.getElementsByClassName("delivery-hours-desc")[0];
	    
	    if (deliveryTimeDesc.style.display === "none") {
	    	deliveryTimeDesc.style.display = "grid";
	    	deliveryHours.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	deliveryTimeDesc.style.display = "none"; 
	    	deliveryHours.style.color = "black"; 
	    }
	});
	
	deliveryLocation.addEventListener("click", function(event) {
	    event.preventDefault();

	    var deliveryLocationDesc = document.getElementsByClassName("delivery-location-desc")[0];
	    
	    if (deliveryLocationDesc.style.display === "none") {
	    	deliveryLocationDesc.style.display = "grid";
	    	deliveryLocation.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	deliveryLocationDesc.style.display = "none"; 
	    	deliveryLocation.style.color = "black"; 
	    }
	});
	
	singleOrder.addEventListener("click", function(event) {
	    event.preventDefault();

	    var singleOrderDesc = document.getElementsByClassName("single-order-desc")[0];
	    
	    if (singleOrderDesc.style.display === "none") {
	    	singleOrderDesc.style.display = "grid";
	    	singleOrder.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	singleOrderDesc.style.display = "none"; 
	    	singleOrder.style.color = "black"; 
	    }
	});
	
	bulkOrder.addEventListener("click", function(event) {
	    event.preventDefault();

	    var bulkOrderDesc = document.getElementsByClassName("bulk-order-desc")[0];
	    
	    if (bulkOrderDesc.style.display === "none") {
	    	bulkOrderDesc.style.display = "grid";
	    	bulkOrder.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	bulkOrderDesc.style.display = "none"; 
	    	bulkOrder.style.color = "black"; 
	    }
	});
	
	advanceOrder.addEventListener("click", function(event) {
	    event.preventDefault();

	    var advanceOrderDesc = document.getElementsByClassName("advance-order-desc")[0];
	    
	    if (advanceOrderDesc.style.display === "none") {
	    	advanceOrderDesc.style.display = "grid";
	    	advanceOrder.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	advanceOrderDesc.style.display = "none"; 
	    	advanceOrder.style.color = "black"; 
	    }
	});
	
	changeAddress.addEventListener("click", function(event) {
	    event.preventDefault();

	    var changeAddressDesc = document.getElementsByClassName("change-address-desc")[0];
	    
	    if (changeAddressDesc.style.display === "none") {
	    	changeAddressDesc.style.display = "grid";
	    	changeAddress.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	changeAddressDesc.style.display = "none"; 
	    	changeAddress.style.color = "black"; 
	    }
	});
	
	otp.addEventListener("click", function(event) {
	    event.preventDefault();

	    var otpDesc = document.getElementsByClassName("otp-desc")[0];
	    
	    if (otpDesc.style.display === "none") {
	    	otpDesc.style.display = "grid";
	    	otp.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	otpDesc.style.display = "none"; 
	    	otp.style.color = "black"; 
	    }
	});
	
	deactive.addEventListener("click", function(event) {
	    event.preventDefault();

	    var deactiveDesc = document.getElementsByClassName("deactive-desc")[0];
	    
	    if (deactiveDesc.style.display === "none") {
	    	deactiveDesc.style.display = "grid";
	    	deactive.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	deactiveDesc.style.display = "none"; 
	    	deactive.style.color = "black"; 
	    }
	});
	
	invoice.addEventListener("click", function(event) {
	    event.preventDefault();

	    var invoiceDesc = document.getElementsByClassName("invoice-desc")[0];
	    
	    if (invoiceDesc.style.display === "none") {
	    	invoiceDesc.style.display = "grid";
	    	invoice.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	invoiceDesc.style.display = "none"; 
	    	invoice.style.color = "black"; 
	    }
	});
	
	partnerAms.addEventListener("click", function(event) {
	    event.preventDefault();

	    var partnerAmsDesc = document.getElementsByClassName("partner-ams-desc")[0];
	    
	    if (partnerAmsDesc.style.display === "none") {
	    	partnerAmsDesc.style.display = "grid";
	    	partnerAms.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	partnerAmsDesc.style.display = "none"; 
	    	partnerAms.style.color = "black"; 
	    }
	});
	
	documents.addEventListener("click", function(event) {
	    event.preventDefault();

	    var documentsDesc = document.getElementsByClassName("documents-desc")[0];
	    
	    if (documentsDesc.style.display === "none") {
	    	documentsDesc.style.display = "grid";
	    	documents.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	documentsDesc.style.display = "none"; 
	    	documents.style.color = "black"; 
	    }
	});
	
	optOut.addEventListener("click", function(event) {
	    event.preventDefault();

	    var optOutDesc = document.getElementsByClassName("opt-out-desc")[0];
	    
	    if (optOutDesc.style.display === "none") {
	    	optOutDesc.style.display = "grid";
	    	optOut.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	optOutDesc.style.display = "none"; 
	    	optOut.style.color = "black"; 
	    }
	});
	
	documentSubmit.addEventListener("click", function(event) {
	    event.preventDefault();

	    var documentSubmitDesc = document.getElementsByClassName("documents-sbmit-desc")[0];
	    
	    if (documentSubmitDesc.style.display === "none") {
	    	documentSubmitDesc.style.display = "grid";
	    	documentSubmit.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	documentSubmitDesc.style.display = "none"; 
	    	documentSubmit.style.color = "black"; 
	    }
	});
	
	fees.addEventListener("click", function(event) {
	    event.preventDefault();

	    var feesDesc = document.getElementsByClassName("fees-desc")[0];
	    
	    if (feesDesc.style.display === "none") {
	    	feesDesc.style.display = "grid";
	    	fees.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	feesDesc.style.display = "none"; 
	    	fees.style.color = "black"; 
	    }
	});
	
	contact.addEventListener("click", function(event) {
	    event.preventDefault();

	    var contactDesc = document.getElementsByClassName("contact-desc")[0];
	    
	    if (contactDesc.style.display === "none") {
	    	contactDesc.style.display = "grid";
	    	contact.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	contactDesc.style.display = "none"; 
	    	contact.style.color = "black"; 
	    }
	});
	
	commision.addEventListener("click", function(event) {
	    event.preventDefault();

	    var commisionDesc = document.getElementsByClassName("commision-desc")[0];
	    
	    if (commisionDesc.style.display === "none") {
	    	commisionDesc.style.display = "grid";
	    	commision.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	commisionDesc.style.display = "none"; 
	    	commision.style.color = "black"; 
	    }
	});
	
	licence.addEventListener("click", function(event) {
	    event.preventDefault();

	    var licenceDesc = document.getElementsByClassName("licence-desc")[0];
	    
	    if (licenceDesc.style.display === "none") {
	    	licenceDesc.style.display = "grid";
	    	licence.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	licenceDesc.style.display = "none"; 
	    	licence.style.color = "black"; 
	    }
	});
	
	partnerInstamart.addEventListener("click", function(event) {
	    event.preventDefault();

	    var partnerInstamartDesc = document.getElementsByClassName("partner-instamart-desc")[0];
	    
	    if (partnerInstamartDesc.style.display === "none") {
	    	partnerInstamartDesc.style.display = "grid";
	    	partnerInstamart.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	partnerInstamartDesc.style.display = "none"; 
	    	partnerInstamart.style.color = "black"; 
	    }
	});
	
	cities.addEventListener("click", function(event) {
	    event.preventDefault();

	    var citiesDesc = document.getElementsByClassName("cities-desc")[0];
	    
	    if (citiesDesc.style.display === "none") {
	    	citiesDesc.style.display = "grid";
	    	cities.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	citiesDesc.style.display = "none"; 
	    	cities.style.color = "black"; 
	    }
	});
	
	timeOnboard.addEventListener("click", function(event) {
	    event.preventDefault();

	    var timeOnboardDesc = document.getElementsByClassName("time-onboard-desc")[0];
	    
	    if (timeOnboardDesc.style.display === "none") {
	    	timeOnboardDesc.style.display = "grid";
	    	timeOnboard.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	timeOnboardDesc.style.display = "none"; 
	    	timeOnboard.style.color = "black"; 
	    }
	});
	
	volumes.addEventListener("click", function(event) {
	    event.preventDefault();

	    var volumesDesc = document.getElementsByClassName("volumes-desc")[0];
	    
	    if (volumesDesc.style.display === "none") {
	    	volumesDesc.style.display = "grid";
	    	volumes.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	volumesDesc.style.display = "none"; 
	    	volumes.style.color = "black"; 
	    }
	});
	
	sales.addEventListener("click", function(event) {
	    event.preventDefault();

	    var salesDesc = document.getElementsByClassName("sales-desc")[0];
	    
	    if (salesDesc.style.display === "none") {
	    	salesDesc.style.display = "grid";
	    	sales.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	salesDesc.style.display = "none"; 
	    	sales.style.color = "black"; 
	    }
	});
	
	ads.addEventListener("click", function(event) {
	    event.preventDefault();

	    var adsDesc = document.getElementsByClassName("ads-desc")[0];
	    
	    if (adsDesc.style.display === "none") {
	    	adsDesc.style.display = "grid";
	    	ads.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	adsDesc.style.display = "none"; 
	    	ads.style.color = "black"; 
	    }
	});
	
	newCities.addEventListener("click", function(event) {
	    event.preventDefault();

	    var newCitiesDesc = document.getElementsByClassName("new-cities-desc")[0];
	    
	    if (newCitiesDesc.style.display === "none") {
	    	newCitiesDesc.style.display = "grid";
	    	newCities.style.color = "rgb(245, 132, 47)"; 
	    } else {
	    	newCitiesDesc.style.display = "none"; 
	    	newCities.style.color = "black"; 
	    }
	});


	
	
	//nav-container
	
	var moreInfoLinks = document.getElementById("navlegal");
	var moreInfoLinks2 = document.getElementById("navfaq");
	var moreInfoLinks3 = document.getElementById("navpartner");
	var moreInfoLinks4 = document.getElementById("instamart");
	
	moreInfoLinks.addEventListener("click", function(event) {
	    event.preventDefault();

	    var legalContainer = document.getElementsByClassName("legal-container")[0];
	    var faqContainer = document.getElementsByClassName("faq-container")[0];
	    var partnerContainer = document.getElementsByClassName("partner-container")[0];
	    var instamartContainer = document.getElementsByClassName("instamart-container")[0];
	    
	    if (legalContainer.style.display === "none") {
	    	legalContainer.style.display = "flex";
	    	faqContainer.style.display = "none";
	    	partnerContainer.style.display = "none";
	    	instamartContainer.style.display = "none";
	    	
	    	moreInfoLinks.style.color = "white";
	    	moreInfoLinks.style.backgroundColor = "rgb(245, 132, 47)";
	    	moreInfoLinks2.style.color = "black";
	    	moreInfoLinks2.style.backgroundColor = "white";
	    	moreInfoLinks3.style.color = "black";
	    	moreInfoLinks3.style.backgroundColor = "white";
	    	moreInfoLinks4.style.color = "black";
	    	moreInfoLinks4.style.backgroundColor = "white";
	    } 
	});
	
	moreInfoLinks2.addEventListener("click", function(event) {
	    event.preventDefault();

	    var faqContainer = document.getElementsByClassName("faq-container")[0];
	    var legalContainer = document.getElementsByClassName("legal-container")[0];
	    var partnerContainer = document.getElementsByClassName("partner-container")[0];
	    var instamartContainer = document.getElementsByClassName("instamart-container")[0];
	    
	    if (faqContainer.style.display === "none") {
	    	faqContainer.style.display = "flex";
	    	legalContainer.style.display = "none";
	    	partnerContainer.style.display = "none";
	    	instamartContainer.style.display = "none";
	    	
	    	moreInfoLinks2.style.color = "white";
	    	moreInfoLinks2.style.backgroundColor = "rgb(245, 132, 47)";
	    	moreInfoLinks.style.color = "black";
	    	moreInfoLinks.style.backgroundColor = "white";
	    	moreInfoLinks3.style.color = "black";
	    	moreInfoLinks3.style.backgroundColor = "white";
	    	moreInfoLinks4.style.color = "black";
	    	moreInfoLinks4.style.backgroundColor = "white";
	    } 
	});
	
	moreInfoLinks3.addEventListener("click", function(event) {
	    event.preventDefault();

	    var faqContainer = document.getElementsByClassName("faq-container")[0];
	    var legalContainer = document.getElementsByClassName("legal-container")[0];
	    var partnerContainer = document.getElementsByClassName("partner-container")[0];
	    var instamartContainer = document.getElementsByClassName("instamart-container")[0];
	    
	    if (partnerContainer.style.display === "none") {
	    	partnerContainer.style.display = "flex";
	    	legalContainer.style.display = "none";
	    	faqContainer.style.display = "none";
	    	instamartContainer.style.display = "none";
	    	
	    	moreInfoLinks3.style.color = "white";
	    	moreInfoLinks3.style.backgroundColor = "rgb(245, 132, 47)";
	    	
	    	moreInfoLinks.style.color = "black";
	    	moreInfoLinks.style.backgroundColor = "white";
	    	moreInfoLinks2.style.color = "black";
	    	moreInfoLinks2.style.backgroundColor = "white";
	    	moreInfoLinks4.style.color = "black";
	    	moreInfoLinks4.style.backgroundColor = "white";
	    } 
	});
	
	moreInfoLinks4.addEventListener("click", function(event) {
	    event.preventDefault();

	    var faqContainer = document.getElementsByClassName("faq-container")[0];
	    var legalContainer = document.getElementsByClassName("legal-container")[0];
	    var partnerContainer = document.getElementsByClassName("partner-container")[0];
	    var instamartContainer = document.getElementsByClassName("instamart-container")[0];
	    
	    if (instamartContainer.style.display === "none") {
	    	instamartContainer.style.display = "flex";
	    	legalContainer.style.display = "none";
	    	faqContainer.style.display = "none";
	    	partnerContainer.style.display = "none";
	    	
	    	moreInfoLinks4.style.color = "white";
	    	moreInfoLinks4.style.backgroundColor = "rgb(245, 132, 47)";
	    	
	    	moreInfoLinks.style.color = "black";
	    	moreInfoLinks.style.backgroundColor = "white";
	    	moreInfoLinks2.style.color = "black";
	    	moreInfoLinks2.style.backgroundColor = "white";
	    	moreInfoLinks3.style.color = "black";
	    	moreInfoLinks3.style.backgroundColor = "white";
	    } 
	});
	
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
