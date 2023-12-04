<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springboot.web.model.Property" %>
<%@ page import="com.springboot.web.model.Owner" %>
<%@ page import="com.springboot.web.model.ImageItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>RentEasy</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="CSS/homepage.css" />
   <link rel="stylesheet" href="CSS/multiplepageview.css" />
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
                            <div id="list_container">
                                <h1 id="prop_heading">Properties</h1>
                                <% List <Property> properties = (List<Property>) request.getAttribute("property");
                                        if (properties != null && !properties.isEmpty()) {
                                        for (Property prop : properties) {
                                        %>
                                        <div id="prop1" class="property <% if (!"available".equalsIgnoreCase(prop.getStatus())) { %>blur<% } %>" data-type="<%= prop.getProperty_type().toUpperCase() %>"
                                            data-location="<%= prop.getProperty_location().toUpperCase() %>">
                                            <div id="prop_images" class="slider-container">
                                                <div class="slider">
                                                    <% List<ImageItem> imageItem = prop.getImageItems();
                                                        if (imageItem != null && !imageItem.isEmpty()) {
                                                        for (ImageItem imgl : imageItem){

                                                        %>
                                                        <img id="listimage" class="slider-image"
                                                            src="data:image/*;base64,<%= imgl.getBase64ImageData() %>" />
                                                        <%}} %>

                                                </div>
                                                <button class="prevBtn">&lt;</button>
                                                <button class="nextBtn">&gt;</button>
                                            </div>
                                            <div id="prop_desc">
                                                <h1>
                                                    <%= prop.getProperty_title()%>
                                                </h1>
                                                <div id="prop_details">
                                              <div id="left">
                                                <h3>Type</h3>
                                                <p>
                                                    <%=prop.getProperty_type()%>
                                                </p>
                                                <h3>Price</h3>
                                                <p>₹<%=prop.getProperty_price()%> /per month</p>
                                                <h3>Status</h3>
                                                <p>Status: <%= prop.getStatus() %></p> 
                                                 </div>
                                               <div id="right">
                                                <h3>Location</h3>
                                                <p>
                                                    <%=prop.getProperty_location()%>
                                                </p>
                                                <%
                                                if(prop.getOwner() !=null){
                                                %>
                                                <h3>Owner Name</h3>
                                                <p><%=prop.getOwner().getName()%></p>
                                                <% } %>
                                                 <%
        if ("available".equalsIgnoreCase(prop.getStatus())) {
        %>
                                                <button id="conbtn"><a href="singlepropertyview?property_id=<%= prop.getProperty_id() %>">View full details</a></button><br>
                                                <%
        } else {}
        %>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% 
                                        }
                                        } else {
                                         %>
                                         <div id="noprop"><p>No property found</p></div>
                                         <%}%>
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
                        <script src="/Script/propertyview.js"></script>
                    </body>

                    </html>