<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <div id="container_main">
        <div id="images">
            <img src="images/bg3.jpg"/>
        </div>
        <div id="searchbar">
        <form  action="/multiplepageview" method="get" >
            <select name="property_type" id="type">
                <option>Property Type</option>
                <option value="1RK">1 RK</option>
                <option value="1BHK">1 BHK</option>
                <option value="2BHK">2 BHK</option>
                <option value="3BHK">3 BHK</option>
            </select>
            <input type="text" name="property_location" id="location" placeholder="Search for location"/>
            <button id="searchbtn" type="search">Search Property</button>
            </form>
        </div>
    </div>
    <div id="title">
        <h1>Property Listing</h1>
        <a href="/multiplepageview">View All Listing</a>
    </div>
    <a href="/multiplepageview" id="newlink">
    <div id="property_listing">
        <div id="card1">
            <img src="property_images/p5.jpg"/>
            <p><b>2 BHK Flat in Chembur</b><br>Ajmera Society, Gandhi Nagar, Near Chembur Monorail Station,Mumbai<br>Price<br> ₹45000 per month</p>
        </div>
        <div id="card2">
            <img src="property_images/1b(1).jpg"/>
            <p><b>1 BHK Flat in Sion</b><br>Ajmera Bhakti Park, Bhakti Park, Sion East, Mumbai<br>Price<br> ₹35000 per month</p>
        </div>
        <div id="card3">
            <img src="property_images/2b.jpg"/>
            <p><b>2 BHK Flat in Wadala</b><br>Ajmera Girnar, Bhakti Park, Wadala East, Mumbai<br>Price<br> ₹42000 per month</p>
        </div>
        <div id="card4">
            <img src="property_images/3b(1).jpg"/>
            <p><b>3 BHK Flat in Chembur</b><br>Union Park, Chembur,<br> Mumbai<br>Price<br> ₹50000 per month</p>
        </div>
    </div>
    </div>
</div>
<div id="section_head">
    <h1>Find Your Home Very Easily</h1>
</div>
<div id="section">
    <div id="section_card1">
        <img src="images/userfriendly_1.jpg"/>
        <h3>User Friendly</h3>
    </div>
    <div id="section_card2">
        <img src="images/easytosearch.jpg"/>
        <h3>Easy To Search Property</h3>
    </div>
    <div id="section_card3">
        <img src="images/easytolist.jpg"/>
        <h3>Easy To List Property</h3>
    </div>
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
                <center><a href="">About</a></center>
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
</body>
</html>