<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/signup.css">
</head>
<body>
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
				<a href="/jsp/product.jsp"
					style="text-decoration: none; color: white;">Products</a>
			</div>
			<div>
				<a href="/jsp/login.jsp"
					style="text-decoration: none; color: white;">Login</a>
			</div>
			<div>
				<a href="/jsp/signup.jsp"
					style="text-decoration: none; color: white;">SignUp</a>
			</div>
			<div>
				<a href="/jsp/aboutus.jsp"
					style="text-decoration: none; color: white;">About us</a>
			</div>

		</div>
	</section>
${fail}
     <div class="bodycentre">
    <form action="/customer/signup" method="post">
        <h1 class="header" style="color: white;">SignUp</h1>
        <table cellspacing="20em">
            <tr>
                <td class="td1"><label for="name"><strong>First Name :</strong></label></td>
                <td><input type="text" name="fname" id="name"></td>
            </tr>
            <tr>
                <td class="td1"><label for="lname"><strong>Last Name :</strong></label></td>
                <td><input type="text" name="lname" id="lname"></td>
            </tr>
            <tr>
                <td class="td1"><label for="mno"><strong>Mobile No :</strong></label></td>
                <td><input type="text" name="mno" id="mno"></td>
            </tr>
            <tr>
                <td class="td1"><label for="email"><strong> Email-Id :</strong></label></td>
                <td><input type="email" name="email" id="email"></td>
            </tr>
            <tr>
                <td class="td1"><label for="pwd"><strong>Password :</strong></label></td>
                <td><input type="password" name="pwd" id="pwd"></td>
            </tr>
            <tr>
                <td class="td1"><label for="cpwd"><strong> Confirm <br>
                    Password </strong>:</label></td>
                <td><input type="password" name="" id="cpwd"></td>
            </tr>
            
            <tr>
                <td><button class="reg" ><strong><a href="./home.jsp" style="text-decoration: none; color: white;">Home</strong></a></button>
                </td>
                <td><button class="reg"><style="text-decoration: none;color: white;"><strong>Register</strong></button>
                </td>
                <!-- <a href="" >Forgot pasword?</a> -->
                <td><button class="cancel"><strong><a href="" style="text-decoration: none;color: white;">Cancel</a></strong></button>
                 <a href="" style="position: relative; top: 3em; left: -1em; text-decoration: none;font-size: 15px;color: black;">help?</a></td>
            
        </table>
    </form>
</div>
</body>
</html>