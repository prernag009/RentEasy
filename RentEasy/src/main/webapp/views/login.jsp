<%@ page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
    <link rel="stylesheet" href="/CSS/signup.css"/>
</head>
<body>
    <form action="/login" method="post">
    <h1>Login Form</h1>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" title="Please enter a valid email address eg:abc@gmail.com" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Please enter a valid password (at least 8 characters, one uppercase letter, one lowercase letter, one number, and one special character)" required><br><br>
        
        <label for="userType">UserType: </label>
        <select id="userType" name="userType">
        <option value="ownobj">Owner</option>
        <option value="tenobj">Tenant</option></select><br><br>
        
        <button type="submit" id="btn">Login</button>
        <div id="signbtn">
        <p>Don't have an account?<button id="signup">Sign up</button>
        <div id="myModal" class="modal">
						<div class="modal-content">
							<p>Choose who you are:</p>
							<div id="twobtn">
								<button class="modal-btn" id="ownerBtn">Owner</button>
								<button class="modal-btn" id="tenantBtn">Tenant</button>
							</div>
						</div>
					</div>
					<%
        String loginError = (String) request.getAttribute("loginError");
        if (loginError != null && !loginError.isEmpty()) {
        %>
           <script>
            alert("<%= loginError %>"); // Show the login error message in an alert
        </script>
        <%
        }
        %>
					</div>
<script src="/Script/homepage.js"></script>
</body>
</html>