<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><spring:message code="label.addAddress" /></title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom Dark Theme CSS -->
  <style>
    /* GENERAL STYLING */
    body {
      font-family: 'Arial', sans-serif;
      background-color: #121212; /* Dark background */
      color: #e0e0e0; /* Light text color */
      margin: 0;
      padding: 0;
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

    /* CONTAINER */
    .container {
      width: 80%;
      margin: 30px auto;
      background: #1e1e1e; /* Dark gray for container */
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); /* Darker shadow */
    }

    h1, h2 {
      color: #bb86fc; /* Light purple for headings */
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
      color: #e0e0e0; /* Light text color */
    }

    .input-field {
      padding: 8px;
      border: 1px solid #333; /* Darker border */
      border-radius: 5px;
      font-size: 16px;
      background-color: #2d2d2d; /* Dark gray for input fields */
      color: #e0e0e0; /* Light text color */
    }

    .input-field:focus {
      border-color: #bb86fc; /* Light purple on focus */
      outline: none;
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
      color: #ffffff; /* White text for buttons */
    }

    .primary {
      background: #bb86fc; /* Light purple for primary button */
    }

    .primary:hover {
      background: #9a67ea; /* Darker purple on hover */
    }

    .edit {
      background: #007bff; /* Blue for edit button */
    }

    .edit:hover {
      background: #0056b3; /* Darker blue on hover */
    }

    .delete {
      background: #dc3545; /* Red for delete button */
    }

    .delete:hover {
      background: #c82333; /* Darker red on hover */
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
      border: 1px solid #444; /* Darker border */
      text-align: left;
      color: #e0e0e0; /* Light text color */
    }

    .data-table th {
      background-color: #333; /* Dark gray for table header */
      color: #bb86fc; /* Light purple for header text */
    }

    .data-table tr:nth-child(even) {
      background-color: #2d2d2d; /* Dark gray for even rows */
    }

    .data-table tr:hover {
      background-color: #444; /* Darker gray on hover */
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
</head>
<body>

<header class="navbar">
  <div class="logo">Addresses Management</div>
  <div class="language">
    <a href="?lang=en">EN</a> | <a href="?lang=es">ES</a> | <a href="?lang=pl">PL</a>
  </div>
  <div>
    <a href="/" class="btn btn-primary">
      <spring:message code="label.homepage_btn" />
    </a>
  </div>
</header>

<main class="container">
  <h1>Address Info</h1>

  <form:form method="post" action="addAddress" modelAttribute="address" class="user-form">
    <form:hidden path="id" />

    <label for="country"><spring:message code="label.country" /></label>
    <form:input path="country" class="input-field" />
    <form:errors path="country"/>

    <label for="state"><spring:message code="label.state" /></label>
    <form:input path="state" class="input-field" />
    <form:errors path="state"/>

    <label for="zipcode"><spring:message code="label.zipcode" /></label>
    <form:input path="zipcode" class="input-field" />
    <form:errors path="zipcode"/>

    <label for="city"><spring:message code="label.city" /></label>
    <form:input path="city" class="input-field" />
    <form:errors path="city"/>

    <label for="street"><spring:message code="label.street" /></label>
    <form:input path="street" class="input-field" />
    <form:errors path="street"/>

    <c:if test="${address.id == 0}">
      <button type="submit" class="btn primary"><spring:message code="label.addAddress" /></button>
    </c:if>
    <c:if test="${address.id != 0}">
      <button type="submit" class="btn edit"><spring:message code="label.editAddress" /></button>
    </c:if>
  </form:form>

  <c:if test="${!empty addressList}">
    <h2>Registered Addresses</h2>
    <table class="data-table">
      <thead>
      <tr>
        <th><spring:message code="label.country"/></th>
        <th><spring:message code="label.state"/></th>
        <th><spring:message code="label.zipcode"/></th>
        <th><spring:message code="label.city"/></th>
        <th><spring:message code="label.street"/></th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${addressList}" var="address">
        <tr>
          <td>${address.country}</td>
          <td>${address.state}</td>
          <td>${address.zipcode}</td>
          <td>${address.city}</td>
          <td>${address.street}</td>
          <td>
            <a href="deleteAddress/${address.id}" class="btn delete">
              <spring:message code="label.entity.delete" />
            </a>
            <a href="addresses?addressId=${address.id}" class="btn edit">
              <spring:message code="label.entity.edit" />
            </a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </c:if>
</main>

</body>
</html>