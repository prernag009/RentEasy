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
    <link rel="stylesheet" href="CSS/profile.css"/>
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
<%
	Object roleAttribute = session.getAttribute("role");

	if (roleAttribute != null) {
		String role = roleAttribute.toString();

		if ("owner".equals(role)) {
			 Owner owner = (Owner) request.getAttribute("owner");
	%>
	<div id="detail_container">
	<h1>Profile</h1>
        <h3>Welcome, <%=owner.getName()%></h3>
		<p>Email ID: <%=owner.getEmail()%></p>
		</div>
		<h1 id="listprop">Your Listed Properties</h1>
       <div id="list_container">
                                <% List <Property> properties = (List<Property>) request.getAttribute("ownerProperties");
                                if (properties != null && !properties.isEmpty()) {
                                        for (Property prop : properties) {
                                        %>
                                        <div id="prop1">
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
                                                <h3 id="pp">Price</h3>
                                                <p>₹<%=prop.getProperty_price()%> /per month</p>
                                                <button id="editbtn"><a href="edit?property_id=<%=prop.getProperty_id()%>">Edit Property</a></button><br>
                                               </div>
                                                
                                               <div id="right">
                                               <h3>Location</h3>
                                                <p>
                                                    <%=prop.getProperty_location()%>
                                                </p>
                                        
                                                <button id="ownbtn"><a href="singlepropertyview?property_id=<%= prop.getProperty_id() %>">View full details</a></button><br>
                                               
                                               <form action="/deleteProperty" method="post">
						<input type="hidden" name="property_id" value="<%=prop.getProperty_id()%>">
						<button type="submit" id="delbtn">Delete Property</button>
					     </form>
					    
                            </div>
                                                </div>
                                                </div>
                                            </div>
                                             <% }
                                             } else {  
                                              %>
                                         <div id="noprop"><p>Not any property you are listed right now </p></div>
                                         <%}%>
                                        </div>
	<%
	} else if ("tenant".equals(role)) {
	// Display tenant's profile
	Tenant tenant = (Tenant) request.getAttribute("tenant");
	%>
	<div id="detail_container">
		<h1>Profile</h1>
		<h3>
			Welcome, <%=tenant.getName()%></h3>
		<p>
			Email:
			<%=tenant.getEmail()%></p>

	</div>
	<%
	}
	} 
	%>
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
       <script src="/Script/propertyview.js"></script>
       </script>