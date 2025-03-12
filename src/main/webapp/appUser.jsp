<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="label.addAppUser" /></title>
    <link rel="stylesheet" type="text/css" href="resources/styles.css">
</head>
<body>

<header class="navbar">
    <div class="logo">App User Management</div>
    <div class="language">
        <a href="?lang=en">EN</a> | <a href="?lang=es">ES</a> | <a href="?lang=pl">PL</a>
    </div>
</header>

<main class="container">
    <h1>App User Info</h1>

    <form:form method="post" action="addAppUser" modelAttribute="appUser" class="user-form">
        <form:hidden path="id" />

        <label for="firstName"><spring:message code="label.firstName" /></label>
        <form:input path="firstName" class="input-field" />
        <form:errors path="firstName"/>

        <label for="lastName"><spring:message code="label.lastName" /></label>
        <form:input path="lastName" class="input-field" />
        <form:errors path="lastName"/>


        <label for="email"><spring:message code="label.email" /></label>
        <form:input path="email" class="input-field" />
        <form:errors path="email"/>


        <label for="telephone"><spring:message code="label.telephone" /></label>
        <form:input path="telephone" class="input-field" />
        <form:errors path="telephone"/>


        <c:if test="${appUser.id == 0}">
            <button type="submit" class="btn primary"><spring:message code="label.addAppUser" /></button>
        </c:if>
        <c:if test="${appUser.id != 0}">
            <button type="submit" class="btn edit"><spring:message code="label.editAppUser" /></button>
        </c:if>
    </form:form>

    <c:if test="${!empty appUseList}">
        <h2>Registered Users</h2>
        <table class="data-table">
            <thead>
            <tr>
                <th><spring:message code="label.firstName"/></th>
                <th><spring:message code="label.lastName"/></th>
                <th><spring:message code="label.email"/></th>
                <th><spring:message code="label.telephone"/></th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${appUseList}" var="appUser">
                <tr>
                    <td>${appUser.firstName}</td>
                    <td>${appUser.lastName}</td>
                    <td>${appUser.email}</td>
                    <td>${appUser.telephone}</td>
                    <td>
                        <a href="delete/${appUser.id}" class="btn delete">Delete</a>
                        <a href="appUsers?appUserId=${appUser.id}" class="btn edit">Edit</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</main>

<style>
    /* GENERAL STYLING */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        color: #333;
    }

    /* NAVIGATION */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #333;
        padding: 15px 20px;
        color: white;
    }

    .navbar .logo {
        font-size: 1.5em;
        font-weight: bold;
    }

    .navbar .language a {
        color: white;
        text-decoration: none;
        margin: 0 5px;
        font-weight: bold;
    }

    .navbar .language a:hover {
        color: #ffcc00;
    }

    /* CONTAINER */
    .container {
        width: 80%;
        margin: 30px auto;
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    /* FORM */
    .user-form {
        display: flex;
        flex-direction: column;
        gap: 10px;
        max-width: 500px;
        margin: 0 auto;
    }

    .user-form label {
        font-weight: bold;
    }

    .input-field {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    /* BUTTONS */
    .btn {
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        text-decoration: none;
        display: inline-block;
        text-align: center;
        margin-top: 10px;
    }

    .primary {
        background: #28a745;
        color: white;
    }

    .primary:hover {
        background: #218838;
    }

    .edit {
        background: #007bff;
        color: white;
    }

    .edit:hover {
        background: #0056b3;
    }

    .delete {
        background: #dc3545;
        color: white;
    }

    .delete:hover {
        background: #c82333;
    }

    /* TABLE */
    .data-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .data-table th,
    .data-table td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: left;
    }

    .data-table th {
        background-color: #333;
        color: white;
    }

    .data-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .data-table tr:hover {
        background-color: #ddd;
    }

    /* MOBILE RESPONSIVENESS */
    @media screen and (max-width: 768px) {
        .container {
            width: 95%;
        }

        .navbar {
            flex-direction: column;
            text-align: center;
        }

        .user-form {
            max-width: 100%;
        }
    }

</style>

</body>
</html>
