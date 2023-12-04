<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springboot.web.model.Owner"%>
<%@ page import="com.springboot.web.model.Tenant"%>
<%@ page import="com.springboot.web.model.Property"%>
<%@ page import="com.springboot.web.model.ImageItem"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RentEasy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/homepage.css"/>
    <link rel="stylesheet" href="CSS/addproperty.css"/>
</head>
<body>
    <header>
        <div id="container">
            <div id="logo">RentEasy</div>
            <div id="info">
                <a href="/homepage">Home</a>
                <a href="/about">About</a>
            </div>
            <div id="btn">
                <%
					// Check if the user is not logged in
					if (session.getAttribute("name") == null) {
						// Display the list button for users who are not logged in
					%>
                <button id="listproperty"><a href="/addproperty">List Property</a></button>
                <button id="signup">Signup</button>
                <button id="login">Login</button>
                <div id="myModal" class="modal">
						<div class="modal-content">
							<p>Choose who you are:</p>
							<div id="twobtn">
								<button class="modal-btn" id="ownerBtn">Owner</button>
								<button class="modal-btn" id="tenantBtn">Tenant</button>
							</div>
						</div>
					</div>
				</div>
                <%
					 } else{
					 Object roleAttribute = session.getAttribute("role");
					if (roleAttribute != null) {
						String role = roleAttribute.toString();

						// Check if the user is an owner
						if ("owner".equals(role)) {
						%>
						<div id="btn">
						<a href="/profile" class="fa fa-user-circle-o" id="profile"></a>
						<a href="/addproperty" id="listproperty">List Property</a>
						<h4>${name}</h4>
					<button id="logout"><a href="/logout">Logout</a></button>
					</div>
						<%
						} else if("tenant".equals(role)){
						%>
						<div id="btn">
						<a href="/profile" class="fa fa-user-circle-o" id="profile"></a>
						<h4>${name}</h4>
					    <button id="logout"><a href="/logout">Logout</a></button>
					    </div>
					    <%
					    }
						}
					}
					%>
                </div>
                </div>
    </header>
    <main>
    <div id="form">
                <form action="/edit"  method="post">
                    <div id="addtitle">Edit Property</div>
                    <input type="hidden" name="property_id" value="${property.property_id}">
                    <input type="text" name="status" value="${property.status}" placeholder="status">
                    <input type="text" name="property_title" value="${property.property_title}">
                    <input type="text" name="property_type" value="${property.property_type}">
                    <input  name="property_description" value="${property.property_description}">
                    <input name="property_address" value="${property.property_address}">
                    <input id="loc" type="text" name="property_location" value="${property.property_location}" />
                    <input type="number" name="property_price" value="${property.property_price}"  pattern=[0-9]/>
                    <input type="number" name="property_area" value="${property.property_area}" pattern=[0-9] maxlength="4" minlength="3" />
                    <button id="addbtn" type="submit">Save Changes</button>
                </form>
            </div>      
    </main>
    <footer>
        <div id="footer_section">
            <div id="foot_main">
                <h1>RentEasy</h1>
                <a href="#" class="fa fa-facebook"></a>
                <a href="#" class="fa fa-instagram"></a>
                <a href="#" class="fa fa-linkedin"></a>
            </div>
            <div id="navigation">
                <h2>Navigation</h2>
                <center><a href="/homepage">Home</a><br></center>
                <center><a href="/about">About</a></center>
            </div>
            <div id="support">
                <h2>Contact Us</h2>
                <p>Email Id : prernag567@gmail.com<br>
                Phone Number: 8652045241</p>
            </div>
        </div>
        <div id="footer_section2">
            <p>Copyright &copy; All Rights Reserved | RentEasy</p>
        </div>
    </footer>
    <script src="/Script/homepage.js">
       </script>