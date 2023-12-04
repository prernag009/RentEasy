<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.springboot.web.model.Property" %>
            <%@ page import="com.springboot.web.model.ImageItem" %>
            <%@ page import="com.springboot.web.model.Review" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>RentEasy</title>
                    <link rel="stylesheet" href="CSS/homepage.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                    <link rel="stylesheet" href="CSS/singlepropertyview.css" />
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
                        <div id="single_container">
                            <% Property property=(Property) request.getAttribute("property"); if (property !=null) { %>
                                <div id="left" class="slider-container">
                                    <div class="slider">
                                        <% List<ImageItem> imageItem = property.getImageItems();
                                            if (imageItem != null && !imageItem.isEmpty()) {
                                            for (ImageItem imgl : imageItem){
                                            %>
                                            <img id="listimage" class="slider-image"
                                                src="data:image/*;base64,<%= imgl.getBase64ImageData() %>" />
                                            <%}} %>
                                    </div>
                                    <button class="prevBtn">&lt;</button>
                                    <button class="nextBtn">&gt;</button>
                                    <h1>
                                        <%= property.getProperty_title() %>
                                    </h1>
                                </div>
                                <div id="right">
                                    <div id="upper-right">
                                        <h5>Type</h5>
                                        <p>
                                            <%= property.getProperty_type() %>
                                                <p>
                                                <h5>Description</h5>
                                                <p>
                                                    <%= property.getProperty_description() %>
                                                </p>
                                                <h5>Price</h5>
                                                <p>₹<%= property.getProperty_price() %> / per month</p>
                                                <h5>Status</h5>
                                                <p>
                                                    <%= property.getStatus() %>
                                                </p>
                                                
                                    </div>
                                    <div id="lower-right">
                                        <h5>Area / Sq.ft.</h5>
                                        <p>
                                            <%= property.getProperty_area() %>
                                        </p>
                                        <h5>Location</h5>
                                        <p>
                                            <%= property.getProperty_location() %>
                                        </p>
                                        <h5>Owner Name</h5>
                                        <p><%=property.getOwner().getName()%></p>
                                        <h5>Contact Number</h5>
                                        <p><%=property.getOwner().getContactno()%></p>
                                        <h6 id="date">Date of Posted : <span><%= property.getDate_of_list() %></span></h6>
                                    </div>
                                </div>
                        </div>
                        </div>


                        <div id="review_section">
                            <h1>Reviews</h1>
                            
                        <%
			Object roleAttribute = session.getAttribute("role");
			if (roleAttribute != null) {
				String role = roleAttribute.toString();
				if ("owner".equals(role)) {
			%>
			<div id="view_section">
                        <%
			List<Review> reviews = (List<Review>) request.getAttribute("reviews");
			if (reviews != null && !reviews.isEmpty()) {
	            for (Review review : reviews) {
			%>
			<h3><%=review.getTenant().getName() %> &emsp;&emsp;Rated <%=review.getRating()%>&emsp;&emsp;<span id="rev"><%=review.getTimestamp()%><span></h3>
			<h3><%=review.getMessage() %></h3><br>
			<%
			}
			} else {
			%>
			<p>No reviews available.</p>
			<%
			}
			%>
			</div>
			<%
			} else {
			%>
           <form action="#" method="post">
                                <input type="number" id="rate" name="rating" max="5" min="1" placeholder="Rating" /><br>
                                <textarea name="message" rows="8" cols="80"
                                    placeholder="Write the review for this property"></textarea><br>
                                <button id="reviewbtn" type="submit">Submit</button>
                            </form>
                            <div id="view_section">
                             <%
			List<Review> reviews = (List<Review>) request.getAttribute("reviews");
			if (reviews != null && !reviews.isEmpty()) {
	            for (Review review : reviews) {
			%>
			<h3><%=review.getTenant().getName() %> &emsp;&emsp;Rated <%=review.getRating()%>&emsp;&emsp;<span id="rev"><%=review.getTimestamp()%><span></h3>
			<h3><%=review.getMessage() %></h3><br><br>
			<%
			}
			} else {
			%>
			<p>No reviews available.</p>
			<%
			}}}}
			%>
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
                    <script src="/Script/homepage.js">
       </script>
                </body>

                </html>