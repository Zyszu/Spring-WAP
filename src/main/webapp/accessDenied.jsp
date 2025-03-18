<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Access Denied</title>
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

    h1 {
      color: #bb86fc; /* Light purple for headings */
      font-weight: bold;
      margin-bottom: 20px;
    }

    .meme-container {
      margin-top: 20px;
      max-width: 100%;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); /* Darker shadow */
    }

    .meme-container img {
      max-width: 100%;
      height: auto;
      border-radius: 10px;
    }

    .btn-primary {
      margin-top: 20px;
      padding: 10px 20px;
      font-size: 1.1rem;
      background-color: #bb86fc; /* Light purple for buttons */
      border: none;
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
<body>
<h1>
  <spring:message code="label.accesdenied1" />
</h1>
<p>
  <spring:message code="label.accesdenied2" />
</p>
<p>
  <spring:message code="label.accesdenied3" />
</p>

<!-- Funny Meme -->
<div class="meme-container">
  <img src="https://media.makeameme.org/created/im-sorry-e69e9acd6f.jpg" alt="Funny Meme">
</div>

<!-- Button to Redirect to / Page -->
<a href="/" class="btn btn-primary">
  <spring:message code="label.accesdenied_home_btn" />
</a>

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