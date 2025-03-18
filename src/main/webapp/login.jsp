<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom Dark Theme CSS -->
  <style>
    body {
      background-color: #121212; /* Dark background */
      color: #e0e0e0; /* Light text color */
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }

    h3 {
      color: #bb86fc; /* Light purple for headings */
      font-weight: bold;
      margin-bottom: 20px;
    }

    #login-box {
      background-color: #1e1e1e; /* Dark gray for login box */
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5); /* Darker shadow */
      width: 350px;
      margin: 20px auto;
      animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .error {
      padding: 15px;
      margin-bottom: 20px;
      border: 1px solid #dc3545; /* Red for error */
      border-radius: 8px;
      color: #dc3545; /* Red text */
      background-color: #2d2d2d; /* Dark gray background */
      animation: shake 0.5s ease-in-out;
      display: none; /* Hidden by default */
    }

    @keyframes shake {
      0%, 100% { transform: translateX(0); }
      25% { transform: translateX(-10px); }
      50% { transform: translateX(10px); }
      75% { transform: translateX(-10px); }
    }

    .msg {
      padding: 15px;
      margin-bottom: 20px;
      border: 1px solid #0d6efd; /* Blue for message */
      border-radius: 8px;
      color: #0d6efd; /* Blue text */
      background-color: #2d2d2d; /* Dark gray background */
      display: none; /* Hidden by default */
    }

    .input-field {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #444; /* Darker border */
      border-radius: 8px;
      background-color: #2d2d2d; /* Dark gray for input fields */
      color: #e0e0e0; /* Light text color */
      transition: border-color 0.3s ease;
    }

    .input-field:focus {
      border-color: #bb86fc; /* Light purple on focus */
      outline: none;
    }

    .btn-primary {
      width: 100%;
      padding: 10px;
      background-color: #bb86fc; /* Light purple for buttons */
      border: none;
      border-radius: 8px;
      color: #ffffff; /* White text */
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
      background-color: #9a67ea; /* Darker purple on hover */
    }

    .footer {
      margin-top: 30px;
      font-size: 0.9rem;
      color: #6c757d; /* Gray for footer text */
    }
  </style>
</head>
<body onload='document.loginForm.username.focus();'>

<h3>Welcome Back! Please Login</h3>

<div id="login-box">
  <!-- Error Message (Conditional Rendering) -->
  <c:if test="${not empty error}">
    <div class="error" style="display: block;">${error}</div>
  </c:if>

  <!-- Success Message (Conditional Rendering) -->
  <c:if test="${not empty msg}">
    <div class="msg" style="display: block;">${msg}</div>
  </c:if>

  <!-- Login Form -->
  <form name='loginForm' action="<c:url value='/login' />" method='POST'>
    <input type="text" name="login" class="input-field" placeholder="Username" required />
    <input type="password" name="password" class="input-field" placeholder="Password" required />
    <button type="submit" class="btn-primary">Login</button>

    <!-- CSRF Token -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </form>
</div>

<!-- Footer -->
<div class="footer">
  <p>
    <spring:message code="label.footer" />
  </p>
</div>

<!-- Bootstrap JS (Optional, if you need Bootstrap's JS features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>