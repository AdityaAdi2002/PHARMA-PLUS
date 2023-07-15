<%@page import="com.protech.pharmaplus.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
     <link rel="icon" href="../images/favicon.ico">
    <link rel="stylesheet" href="../css/about.css">
   
   </head>
<body>
<div id="parent">
    <div class="admin">
        <a href="adminlogin.jsp" class="admin" style="text-decoration:none;"><img height="60px" width="60px" alt="unknown" src="../images/adminlogo.png"></a>
    </div>
</div>
<section class="parent1">
		<div class="child1">
			<a href="/" style="text-decoration: none; color: white;"><h1>PHARMA+</h1></a>
		</div>
		<div id="child2">
			<div id="child">
				<a href="/" style="text-decoration: none; color: white;">Home</a>
			</div>
			
			<div>
				<a href="/customer/products"
					style="text-decoration: none; color: white;">Products</a>
			</div>
			<div>
				<a href="/aboutus"
					style="text-decoration: none; color: white;">About us</a>
			</div>
			<%Customer customer=(Customer)session.getAttribute("customer") ;
			if(customer==null){
				
			%>
			<div>
				<a href="/customer/login"
					style="text-decoration: none; color: white;">Login</a>
			</div>
			<div>
				<a href="/customer/signup"
					style="text-decoration: none; color: white;">SignUp</a>
			</div>
			<%} else{%>
			<div class="cart">
        <a href="/customer/cart" class="cart"><img src="data:image/jpeg;base64,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" alt="Cart" width="39em" height="39em" style="border-radius: 10em;">Cart</a>   
    </div>
			<div>
				<a href="/logout"
					style="text-decoration: none; color: white;">Logout</a>
			</div>
			<%}%>
			

		</div>
	</section>
   <div class="about">
    <div class="about-parent" style="position: relative; bottom: 30px; font-size: 25px;">  
<div class="ac"><h1>ABOUT US</h1></div>
<div class="para"></div>
</div></div>
<div class="ip">
    <div class="chil">
        <img src="https://cdn.pixabay.com/photo/2014/02/03/11/31/medications-257336_960_720.jpg" alt="" width="550px" height="350px">
    </div>
   <div class="par">
    <div class="ic">
        <h1>How we started?</h1>
        <p>Our website was started due to people who are facing <br>problems related to medicine which is out of stock <br>and to the people who are unable to expalin  <br>about their disease.We decided to start our 
        <br> company called PHARMA+ in 2022 and now we <br> are providing medicines and utilities at the <br>
         given time and there is no word for out of stock </p>
     </div> 
    </div>
</div>
<div class="chil2">
    <div class="chil4">
        <h1>CONVINIENCE</h1>
        <p>Heavy traffic, lack of parking, monsoons, shop closed, forgetfulness… these are some of the reasons that could lead to skipping of vital medications.  Since taking medicines regularly is a critical component of managing chronic medical conditions, it’s best not to run out of essential medicines. Just log on to netmeds.com, place your order online and have your medicines delivered to you – without leaving the comfort of your home.</p>
</div>
    <div class="chil3"><img src="https://media.istockphoto.com/id/1220577245/photo/hand-to-hand-of-delivery-food-service-sending-delicious-from-restaurant-to-customer-without.jpg?b=1&s=170667a&w=0&k=20&c=5GdOziZwOvG3bf-_d20XCkuoEmRzh9geqQgVFObKLMo=" alt="" width="550px" height="350px"> 
    </div>
</div>
<div class="chil5">
<div class="trust">
    <img src="https://cdn.pixabay.com/photo/2018/04/07/13/11/medicine-3298451_1280.jpg" alt="" width="550px" height="350px">
</div>
<div class="trust1">
    <h1>TRUST</h1>
    <p>With the highest standards of ethical pharmacy practice, Netmeds is committed to providing authentic cum affordable medicines as well as a customer service philosophy that is worthy of our valued customers’ loyalty. We offer a superior online shopping experience, which includes ease of navigation and absolute transactional security.</p>
</div>
</div>

<footer>
    <div class="ship">
        <div class="ship1">
            <img src="https://cdn.pixabay.com/photo/2022/01/31/22/46/icon-6985161__340.png" alt="" width="100px" height="100px">
        </div>
        <div class="foot">
        <h1 style= "font-size: 40px; color: rgb(11, 185, 185);">Free Shiping</h1>
        <p style="font-size: 18px;"> We provide free delivery to the <br> customers that allows  customers to <br> have their orders shipped <br> to them at no cost</p>
        </div>
        <div class="foot1"><img src="https://media.istockphoto.com/id/954508832/vector/icon-swap-resumes-spinning-arrows-in-circle-vector-symbol-sync-renewable-product-exchange.jpg?s=612x612&w=0&k=20&c=oQmeijMO5jB85aVh2Vg4VNW1WfgXOotFGkCED1BMP9c=" alt="" width="80px" height="80px">
        </div>
        <div class="foot2"><h1 style="color: rgb(11, 185, 185); font-size: 40px;">return</h1>
        <p style="font-size: 18px;">free return if the customer placed <br> the wrong product or if the <br> customer has any issue with <br> our product.</p>
    </div>
    <div class="cust">
        <img src="https://cdn.pixabay.com/photo/2022/01/11/21/17/icon-6931512__340.png" alt="" width="70px" height="70px">
    </div>
    <div class="cust1"><h1 style="color: rgb(11, 185, 185); font-size: 40px;">Customer Support</h1>
        <p style="font-size: 18px;">Customer support is an essential part <br> of any business that provides <br> products or services to customers. <br> It involves helping customers with <br> their questions, issues, feedback, <br> and complaints in a timely and <br> professional manner.</p>
    </div>
    </div>
</footer>
</body>
</html>