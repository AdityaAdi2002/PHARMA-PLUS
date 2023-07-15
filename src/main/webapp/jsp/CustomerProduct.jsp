<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="com.protech.pharmaplus.dto.Product"%>
<%@page import="com.protech.pharmaplus.dto.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
* {
	padding: 0;
	margin: 0;
}

body {
	overflow-x: hidden;
}

#parent {
	display: flex;
	justify-content: end;
	background-color: rgba(27, 27, 27, 2);
	height: 50px;
	width: 100%;
	position: sticky;
	top: 0px;
	z-index: 2;
	align-items: center;
}

.admin {
	color: beige;
	position: relative;
	left: -20px;
}

.admin:hover {
	color: red;
}

.parent1 {
	display: flex;
	justify-content: center;
	background-color: black;
	height: 100px;
	align-items: center;
	position: sticky;
	top: 50px;
	z-index: 10
}

.child1 {
	color: white;
	position: relative;
	left: -15rem;
}

#child2 {
	width: 50%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 20px;
	font-family: 'Times New Roman', Times, serif;
}

#main_body {
	width: 100vw;
	height: 50vw;
	background-color: aqua;
}

.product_container {
	width: 100%;
	
}

.child_product_container {
	width: 90%;
	margin: auto;
	display: flex;
	flex-wrap:wrap;
	justify-content: space-between;
}

.child_product_container1 {
	width: 30%;
	border: 1px solid black;
	border-style: none;
	text-align: center;
	padding-top: 60px;
}

.img1 {
	width: 220px;
	height: 280px;
}

.container {
	display: flex;
	flex-wrap:wrap;
	justify-content: space-around;
	position: relative;
	top: 20em;
}

.footer_image {
	display: inline-grid;
	grid-template-columns: auto auto auto auto;
	column-gap: 0.5em;
}

.head {
	font-size: 1.8em;
	position: relative;
}

</style>
</head>
<body>
	<!-- navbar -->
	<div id="parent">
		<div class="admin">
			<a href="adminlogin.jsp" class="admin" style="text-decoration: none;"><img
				height="60px" width="60px" alt="unknown"
				src="../images/adminlogo.png"></a>
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
				<a href="/aboutus" style="text-decoration: none; color: white;">About
					us</a>
			</div>
			<%
			Customer customer = (Customer) session.getAttribute("customer");
			if (customer == null) {
			%>
			<div>
				<a href="/customer/login"
					style="text-decoration: none; color: white;">Login</a>
			</div>
			<div>
				<a href="/customer/signup"
					style="text-decoration: none; color: white;">SignUp</a>
			</div>
			<%
			} else {
			%>
			<div class="cart">
				<a href="/customer/cart" class="cart"><img
					src="data:image/jpeg;base64,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"
					alt="Cart" width="39em" height="39em" style="border-radius: 10em;">Cart</a>
			</div>
			<div>
				<a href="/logout" style="text-decoration: none; color: white;">Logout</a>
			</div>
			<%
			}
			%>


		</div>
	</section>
	
	 <h1 id="successMessage" style="color:green">${pass}</h1>
<h1 id="failMessage" style="color:red">${fail}</h1>

<script>
    // Get the success and fail message elements
    var successMessage = document.getElementById("successMessage");
    var failMessage = document.getElementById("failMessage");

    // Check if the success message exists and display it as a pop-up alert
    if (successMessage.innerText !== "") {
        window.alert(successMessage.innerText);
        successMessage.style.display = "none"; // Hide the success message element
    }

    // Check if the fail message exists and display it as a pop-up alert
    if (failMessage.innerText !== "") {
        window.alert(failMessage.innerText);
        failMessage.style.display = "none"; // Hide the fail message element
    }
</script>
	
	<!-- carousel -->
	<div id="carouselExampleSlidesOnly" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../image/lapslide.jpg" class="d-block w-100" alt="..."
					height="500em">
			</div>
			<div class="carousel-item">
				<img src="../image/fashslide.jpg" class="d-block w-100" alt="..."
					height="500em">
			</div>
			<div class="carousel-item">
				<img src="../image/gslide.jpg" class="d-block w-100" alt="..."
					height="500em">
			</div>
		</div>
	</div>
	<!-- products -->
	<!-- <div><marquee behavior="alternate" direction="right" style="font-size: 50px;font-style: italic;">Collection</marquee></div> -->
	<div
		style="font-size: 50px; font-style: italic; position: relative; left: 50px;">MEDICINES</div>

	<div class="product_container">

		<div class="child_product_container">

			<%
			List<Product> list = (List<Product>) request.getAttribute("list");
			for (Product prod : list) {
			%>

			<div class="child_product_container1" >
				<%
				String base64 = Base64.encodeBase64String(prod.getImage());
				%>
				<img height="300" width="300" alt="unknown"
					src="data:image/jpeg;base64,<%=base64%>">
				<h5 style="position: relative; top: 5px;">
					<%=prod.getName()%>-<%=prod.getBrand()%>
				</h5>
				<h5 style="position: relative; top: 5px;">
					(<%=prod.getSubcategory()%>)
				</h5>
				<h3 style="color: coral; position: relative; top: 5px;">
					<%=prod.getPrice()%>
					&#8377
				</h3>
				<a href="/customer/addtocart?id=<%=prod.getId()%>"><button
						style="background-color: goldenrod; font-size: 15px; padding: 10px; border-style: none; position: relative; top: 5px;">Add
						to cart</button></a>
			</div>

			<%
			}
			%>

		</div>

	</div>

	<!-- footer -->
	<footer>
		<div class="container">
			<div class="item1">
				<div style="font-size: 1.8em;">MR Collection</div>
				<p style="line-height: 2em;">
					We would love to serve you and let enjoy <br> your culinary
					expirience. Excepteure sint <br> occaecat cupidatat non
					proident.
				</p>
				<p style="line-height: 2em;">
					Copyright @2023 All rights reserved | This <br> template is
					made with &#128151 by Colorbil
				</p>
			</div>
			<div class="item2">
				<div class="head">Opening Times</div>
				<p>Monday-Friday:10.00-23.00</p>
				<p>Saturday:10.00-19.00</p>

				<div class="footer_image">
					<img src="../image/facebook.png" alt="" height="30px" width="30px"
						class="footer_image1"> <img src="../image/instagram.jpg"
						alt="" height="30px" width="30px" class="footer_image2"> <img
						src="../image/twitter.jpg" alt="" height="30px" width="30px"
						class="footer_image3"> <img src="../image/g+.png" alt=""
						height="30px" width="30px" class="footer_image4">
				</div>

			</div>
			<div class="item3">
				<div class="head">Contact Us</div>
				<p>tel:************</p>
				<P>Email:Hello.colorbil@gmail.com</P>
				<p>Adress:Iris Waston, P.O.Box 283 8562 Fusce Rd,Ny</p>
			</div>
		</div>
	</footer>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>