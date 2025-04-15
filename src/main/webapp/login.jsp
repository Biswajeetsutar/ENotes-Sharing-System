<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@include file="component/allCss.jsp"%>
    <style>
        .error-message {
            color: red;
            font-size: 0.9em;
            display: none;
        }
    </style>
    <script>
        // Function to show error messages
        function showError(elementId, message) {
            let errorElement = document.getElementById(elementId);
            errorElement.innerText = message;
            errorElement.style.display = "block";
        }

        // Function to hide error messages
        function hideError(elementId) {
            document.getElementById(elementId).style.display = "none";
        }

        // Validation for email field
        function validateEmail() {
            let email = document.getElementById("email").value;
            let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                showError("emailError", "Please enter a valid email address.");
                return false;
            }
            hideError("emailError");
            return true;
        }

        // Validation for password field
        function validatePassword() {
            let password = document.getElementById("password").value;
            if (password.length < 6) {
                showError("passwordError", "Password must be at least 6 characters.");
                return false;
            }
            hideError("passwordError");
            return true;
        }

        // Validate the form before submission
        function validateForm() {
            return validateEmail() && validatePassword();
        }
    </script>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <%
        String validMsg = (String) session.getAttribute("validMsg");
        String invalidMsg = (String) session.getAttribute("invalidMsg");

        if (validMsg != null) {
    %>
        <script>
            window.location.assign("profile.jsp");
        </script>
    <%
        session.removeAttribute("validMsg");
        }
    %>
    <%
        if (invalidMsg != null) {
    %>
        <script>
            window.location.assign("login.jsp");
        </script>
    <%
        session.removeAttribute("invalidMsg");
        }
    %>

    <div class="container mt-5">
        <div class="row">
            <div class="col-sm-6">
                <h2 class="text-center">New User</h2>
                <hr>
                <p>By creating an account with our website, you will be able to move through the notes uploading and downloading process and more..</p>
                <a href="signup.jsp" class="btn btn-danger text-white mt-5">CREATE AN ACCOUNT</a>
            </div>

            <div class="col-sm-6">
                <h2 class="text-center">USER LOGIN</h2>
                <hr>
                <!-- Login Form with validation -->
                <form action="login" method="post" onsubmit="return validateForm()">
                    <label>Email Address</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter Email Address" onkeyup="validateEmail()" required>
                    <div id="emailError" class="error-message">Please enter a valid email address.</div>

                    <label>Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password" onkeyup="validatePassword()" required>
                    <div id="passwordError" class="error-message">Password must be at least 6 characters long.</div>

                    <hr>
                    <div class="text-center">
                        <button type="submit" class="btn btn-danger">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
