<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AppUserRole</title>
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
            min-height: 100vh;
            text-align: center;
        }

        h1 {
            color: #bb86fc; /* Light purple for headings */
            font-weight: bold;
            margin-bottom: 20px;
        }

        #form-container {
            background-color: #1e1e1e; /* Dark gray for form container */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5); /* Darker shadow */
            width: 400px;
            margin: 20px auto;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
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

        .error {
            color: #dc3545; /* Red for error messages */
            font-size: 0.9rem;
            margin-top: 5px;
        }

        .footer {
            margin-top: 30px;
            font-size: 0.9rem;
            color: #6c757d; /* Gray for footer text */
        }

        /* NAVIGATION */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #1e1e1e; /* Dark gray for navbar */
            padding: 15px 20px;
        }

        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
            color: #bb86fc; /* Light purple for logo */
        }

        .navbar .language a {
            color: #bb86fc; /* Light purple for language links */
            text-decoration: none;
            margin: 0 5px;
            font-weight: bold;
        }

        .navbar .language a:hover {
            color: #9a67ea; /* Darker purple on hover */
        }


    </style>
</head>
<body>

<header class="navbar">
    <div>
        <a href="/" class="btn btn-primary">
            <spring:message code="label.homepage_btn" />
        </a>
    </div>
</header>

<h1>Add App User Role</h1>

<div id="form-container">
    <form:form method="post" action="addAppUserRole" modelAttribute="appUserRole">
        <form:hidden path="id" />

        <div class="form-group">
            <label for="role"><spring:message code="label.role" /></label>
            <form:input path="role" class="input-field" placeholder="Enter role" />
            <form:errors path="role" class="error" />
        </div>

        <button type="submit" class="btn-primary">
            <spring:message code="label.addAppUserRole" />
        </button>
    </form:form>
</div>

<!-- Footer -->
<div class="footer">
    <p>Made with ❤️ by AI</p>
</div>

<!-- Bootstrap JS (Optional, if you need Bootstrap's JS features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>