<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/singlepropertyview.css"/>
    <title>Signup Form</title>
    <link rel="stylesheet" href="CSS/signup.css"/>
</head>
<body>
    <form action="/Registration" method="post">
     <h1>Signup Form</h1>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" pattern="[A-Za-z ]+" title="Please enter a name using letters and spaces only" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" title="Please enter a valid email address" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
        title="Please enter a valid password (at least 8 characters, one uppercase letter, one lowercase letter, one number, and one special character)" required><br><br>

        <label for="contactno">Contact No.:</label>
        <input type="text" id="contactno" name="contactno" maxlength=10 pattern="\d{10}" title="Please enter a valid 10-digit contact number" required><br><br>

        <input type="submit" value="Signup" id="btn">
        <div id="sec">
        <p>Already have an account? <a href="/login"><span style="color:blue;">Login here</span></a>

        </div>
    </form>
</body>
</html>