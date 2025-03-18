<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello World</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS for Dark Theme -->
    <style>
        body {
            background-color: #121212; /* Dark background */
            color: #e0e0e0; /* Light text color */
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
            text-align: center;
        }
        h3 {
            color: #bb86fc; /* Light purple for headings */
            font-weight: bold;
            margin-bottom: 20px;
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
        .message-box {
            background-color: #1e1e1e; /* Dark gray for message box */
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); /* Darker shadow */
        }
        .server-time {
            font-size: 1.2rem;
            color: #bb86fc; /* Light purple for server time */
            margin-top: 10px;
        }
        a {
            color: #bb86fc; /* Light purple for links */
            text-decoration: none;
        }
        a:hover {
            color: #9a67ea; /* Darker purple on hover */
        }
    </style>
</head>
<body>
<div class="container">
    <h3>Hello World to Me!</h3>

    <!-- Link to App Users Page -->
    <a href="/appUsers" class="btn btn-primary">App Users Page</a>

    <a href="/exampleOne" class="btn btn-primary">
        <spring:message code="label.example" /> 1
    </a>

    <a href="/exampleTwo" class="btn btn-primary">
        <spring:message code="label.example" /> 2
    </a>

    <a href="/exampleThree" class="btn btn-primary">
        <spring:message code="label.example" /> 3
    </a>


    <!-- Server Time and Message -->
    <div class="message-box">
        <p class="server-time">Server Time: ${serverTime}</p>
        <p>${message}</p>
    </div>

    <form action="/logout" method="post" id="logoutForm">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <div class="message-box" id="logoutbtn">
            <spring:message code="label.welcome" /> :
            ${pageContext.request.userPrincipal.name}

            <a href="javascript:formSubmit">
                <spring:message code="label.logout" />
            </a>
        </div>
    </c:if>

</div>

<!-- Bootstrap JS (Optional, if you need Bootstrap's JS features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.getElementById("logoutbtn").addEventListener("click", function () {
        document.getElementById("logoutForm").submit();
    });
</script>
</body>
</html>