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
    <h1 style="margin:20px 50px; font-size:35px; color:maroon;">About Us</h2>
    <section>
        <h3>Our Mission</h3>
        <p>Our mission is to connect renters with their ideal living spaces while providing property owners and managers
            with a platform to showcase their listings. We strive to make the rental process seamless, transparent, and
            enjoyable for everyone involved.</p>
    </section>

    <section>
        <h3>What Sets Us Apart</h3>
        <ul>
            <li><strong>Comprehensive Listings:</strong> Discover a diverse range of rental options tailored to your
                preferences.</li>
            <li><strong>User-Friendly Interface:</strong> Our platform features an easy-to-use interface for a seamless
                search experience.</li>
            <li><strong>Trusted Community:</strong> Build trust within our community through reviews and connections with
                fellow renters.</li>
            <li><strong>Innovative Technology:</strong> Utilize advanced algorithms to match renters with properties that
                align with their preferences.</li>
        </ul>
    </section>

    <section>
        <h3>How It Works</h3>
        <ol>
            <li><strong>Search:</strong> Begin your journey by searching for rental listings based on location, price
                range, and other criteria.</li>
            <li><strong>Explore:</strong> Dive into detailed property descriptions, high-quality images, and virtual
                tours to get a feel for each listing.</li>
            <li><strong>Connect:</strong> Reach out to property owners or managers directly through our platform to
                schedule viewings or ask questions.</li>
            <li><strong>Move In:</strong> Once you've found the perfect rental, start the process of securing your new
                home with confidence.</li>
        </ol>
    </section>

    <section>
        <h3>Get Started Today!</h3>
        <p>Join RentEasy today and embark on a stress-free rental experience. Whether you're a property owner
            looking to list your space or a renter in search of the perfect home, we're here to make the process
            simple, efficient, and enjoyable.</p>
    </section>
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
</body>
</html>