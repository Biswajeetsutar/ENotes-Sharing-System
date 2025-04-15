<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup Page</title>
    <%@include file="component/allCss.jsp"%>
    <style>
        .error-message {
            color: red;
            font-size: 0.9em;
            display: none;
        }
    </style>
    <script>
        // Function to display error message
        function showError(elementId, message) {
            let errorElement = document.getElementById(elementId);
            errorElement.innerText = message;
            errorElement.style.display = "block";
        }

        // Function to hide error message
        function hideError(elementId) {
            document.getElementById(elementId).style.display = "none";
        }

        // Validation functions for each field
        function validateFirstName() {
            let fname = document.getElementById("fname").value;
            let namePattern = /^[A-Za-z]+$/;
            if (!namePattern.test(fname)) {
                showError("fnameError", "First Name should contain only letters.");
                return false;
            }
            hideError("fnameError");
            return true;
        }

        function validateLastName() {
            let lname = document.getElementById("lname").value;
            let namePattern = /^[A-Za-z]+$/;
            if (!namePattern.test(lname)) {
                showError("lnameError", "Last Name should contain only letters.");
                return false;
            }
            hideError("lnameError");
            return true;
        }

        function validateContact() {
            let contact = document.getElementById("contact").value;
            if (contact.length !== 10 || !/^\d{10}$/.test(contact)) {
                showError("contactError", "Contact Number should be exactly 10 digits.");
                return false;
            }
            hideError("contactError");
            return true;
        }

        function validateEmail() {
            let email = document.getElementById("email").value;
            let emailPattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
            if (!emailPattern.test(email)) {
                showError("emailError", "Please enter a valid email address.");
                return false;
            }
            hideError("emailError");
            return true;
        }

        function validatePassword() {
            let password = document.getElementById("password").value;
            let passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
            if (!passwordPattern.test(password)) {
                showError("passwordError", "Password must be at least 6 characters and contain both letters and numbers.");
                return false;
            }
            hideError("passwordError");
            return true;
        }

        // Function to validate the entire form on submit
        function validateForm() {
            return validateFirstName() && validateLastName() && validateContact() && validateEmail() && validatePassword();
        }
    </script>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <div class="container register mt-5" style="font-family: 'IBM Plex Sans', sans-serif;">
        <div class="row">
            <div class="col-sm-6">
                <h2 class="text-center">Existing User</h2>
                <hr>
                <p>By Creating an account with our Website, You will be able to
                    move through the notes uploading and downloading process and more..</p>
                <a href="login.jsp" class="btn btn-danger text-white mt-5">ALREADY
                    HAVE AN ACCOUNT</a>
            </div>

            <div class="col-md-6 register-right" style="margin-top: 40px; left: 80px;">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <h3 class="register-heading">REGISTER WITH US</h3>
                        <p>If you have not created an account with us, please Signup..</p>
                        <hr>

                        <!-- Form submission is controlled by the validateForm function -->
                        <form action="signup" method="post" onsubmit="return validateForm()">
                            <div class="row register-form">
                                <div class="col-md-6">
                                    <!-- First Name -->
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input type="text" class="form-control" placeholder="First Name *" 
                                               name="fname" id="fname" onkeyup="validateFirstName()" required>
                                        <div id="fnameError" class="error-message">First Name should contain only letters.</div>
                                    </div>

                                    <!-- Contact Number -->
                                    <div class="form-group">
                                        <label>Contact</label>
                                        <input type="text" class="form-control" placeholder="Enter Contact Number"
                                               name="contact" id="contact" onkeyup="validateContact()" style="width: 540px;" required>
                                        <div id="contactError" class="error-message">Contact Number should be exactly 10 digits.</div>
                                    </div>

                                    <!-- Email Address -->
                                    <div class="form-group">
                                        <label>Email Address</label>
                                        <input type="email" class="form-control" placeholder="Enter Email Address"
                                               id="email" name="email" onkeyup="validateEmail()" style="width: 540px;" required>
                                        <div id="emailError" class="error-message">Please enter a valid email address.</div>
                                    </div>

                                    <!-- Password -->
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" class="form-control" placeholder="Password" id="password"
                                               name="password" onkeyup="validatePassword()" style="width: 540px;" required>
                                        <div id="passwordError" class="error-message">Password must be at least 6 characters long and contain both letters and numbers.</div>
                                    </div>

                                    <!-- Branch Selection -->
                                    <label>Branch</label> 
                                    <select class="form-control" name="branch" style="width: 540px;">
                                        <option value="Computer Science">Computer Science</option>
                                        <option value="Mechanical">Mechanical</option>
                                        <option value="Civil">Civil</option>
                                        <option value="Electronics">Electronics</option>
                                        <option value="Electric">Electric</option>
                                        <option value="IT">IT</option>
                                    </select>

                                    <!-- Role Selection -->
                                    <label>Are You?</label>
                                    <select class="form-control" name="role" style="width: 540px;">
                                        <option value="Student">Student</option>
                                        <option value="Teacher">Teacher</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <!-- Last Name -->
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input type="text" class="form-control" placeholder="Last Name *" 
                                               name="lname" id="lname" onkeyup="validateLastName()" required>
                                        <div id="lnameError" class="error-message">Last Name should contain only letters.</div>
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary ml-3 mt-2">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
