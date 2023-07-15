<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.protech.pharmaplus.dto.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/signup.css">
    <style>
    * {
	padding: 0;
	margin: 0;
}
.cart{
    color: beige;
    text-decoration: none;
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
    form{
        border: 2px solid;
        /* position: relative;
        left: 27em;
        top: 5em; */
        width: 25em;
        height: 33em;
        /* display: flex;
        justify-content: center;
        align-items: center; */
        border-radius: 1em;
        background-color: #ffffff;

    }
    .header{
        height: 2em;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
        top: -10px;
        border-radius: 10px;
    
        
        /* text-align: center;
        border-top-right-radius: 0.5em;
        border-top-left-radius: 0.5em; */
        
    }

    .td1{
        text-align: right;
        position: relative;
        /* left: -1em; */
    }

    .cancel{
        background-color: red;
         position: relative; 
         left: -4em; top: 1.5em;
          border: white; height: 2em;
          width: 7em; border-radius: 1em;
          
    }

    .reg{
        position: relative;
         left: 2em;
          background-color:cornflowerblue;
           border: white;
            height: 2em; width: 7em; 
            top: 1em;
             border-radius: 1em;
    }
    .bodycentre{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 600px;
        
    }
    body{
	background-image: url("https://images.pexels.com/photos/3850681/pexels-photo-3850681.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    background-repeat: no-repeat;
	background-size: 100% 100vh;
}
::placeholder{
	position: relative;
	left: 10px;
	color: black;
	font-weight: 400;
}
input{
background-color:#F8FDCF;
}
    </style>
</head>
<body>
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
      

     <div class="bodycentre">
    <form action="/customer/signup" method="post" style="background-image: linear-gradient(to bottom right,white,rgb(60, 59, 59))";>
        <h1 class="header" style="color: black;position:relative;top:10px;">SignUp</h1>
        <table cellspacing="20em">
            <tr>
                <td class="td1"><label for="name"><strong>First Name :</strong></label></td>
                <td><input type="text" name="fname" id="name" placeholder="Enter email/mobile"></td>
            </tr>
            <tr>
                <td class="td1"><label for="lname"><strong>Last Name :</strong></label></td>
                <td><input type="text" name="lname" id="lname" placeholder="Enter firstname"></td>
            </tr>
            <tr>
                <td class="td1"><label for="mno"><strong>Mobile No :</strong></label></td>
                <td><input type="text" name="mno" id="mno" placeholder="Enter lastname"></td>
            </tr>
            <tr>
                <td class="td1"><label for="email"><strong> Email-Id :</strong></label></td>
                <td><input type="email" name="email" id="email" placeholder="Enter email/mobile"></td>
            </tr>
            <tr>
                <td class="td1"><label for="pwd"><strong>Password :</strong></label></td>
                <td><input type="password" name="pwd" id="pwd" placeholder="Enter password"></td>
            </tr>
            <tr>
                <td class="td1"><label for="cpwd"><strong> Confirm <br>
                    Password </strong>:</label></td>
                <td><input type="password" name="" id="cpwd" placeholder="Enter confirm password"></td>
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