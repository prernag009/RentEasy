<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RentEasy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/homepage.css" />
    <link rel="stylesheet" href="CSS/addproperty.css" />
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
                <form action="/addproperty"  method="post" enctype="multipart/form-data">
                    <div id="addtitle">Add Property</div>
             
                    <div id="outer">
                        <div id="inner"><input type="file" name="imageData" accept="image/jpeg, image/png, image/jpg" multiple>
    <script>
        const input = document.querySelector("input")
        const output = document.querySelector("output")
        let imagesArray = [];
        input.addEventListener("change", () => {
            const file = input.files
            imagesArray.push(file[0])
            displayImages()
        })
        function displayImages() {
            let images = ""
            imagesArray.forEach((image, index) => {
                images += `<div class="image">
                <img src="${URL.createObjectURL(image)}" alt="image">
                <span onclick="deleteImage(${index})">&times;</span>
              </div>`
            })
            output.innerHTML = images
        }
        function deleteImage(index) {
            imagesArray.splice(index, 1)
            displayImages()
        }

    </script></div>
                    </div>
                    <input type="text" name="property_title" placeholder="Property Title" required/><br>
                    <textarea name="property_description" placeholder="Property Description" required></textarea><br>
                    <textarea name="property_address" placeholder="Address" required></textarea><br>
                    <input id="loc" type="text" name="property_location" placeholder="Location" required />
                    <label for="type">Property Type</label>
                    <select name="property_type" id="type" required>
                        <option value="1RK">1 RK</option>
                        <option value="1BHK">1 BHK</option>
                        <option value="2BHK">2 BHK</option>
                        <option value="3BHK">3 BHK</option>
                    </select><br>
                    <input type="text" name="property_area" placeholder="Area /Sq.ft." pattern="\d+" minlength="3" maxlength="4" required /><br>
                    <input type="text" name="property_price" placeholder="Price" pattern="\d+" required/><br>
							<label for="status">Status</label>
							<select name="status" id="status" required>
								<option value=""></option>
								<option value="Available">Available</option>
								<option value="Not available">Not available</option>
							</select>
                    <button id="addbtn">Add Property</button>
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
</body>

</html>