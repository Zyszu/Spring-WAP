<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="label.addAppUser" /></title>
</head>
<body>

    <div class="header">
        <span>
            <a href="?lang=en">en</a> | <a href="?lang=es">es</a> | <a href="?lang=pl">pl</a>
        </span>
    </div>

    <h1>App user info:</h1>
    <form:form method="post" action="addAppUser" modelAttribute="appUser">
        <table>
            <tr>
                <td><form:label path="firstName"><spring:message code="label.firstName" /></form:label></td>
                <td><form:input path="firstName" /></td>
            </tr>
            <tr>
                <td><form:label path="lastName"><spring:message code="label.lastName" /></form:label></td>
                <td><form:input path="lastName" /></td>
            </tr>
            <tr>
                <td><form:label path="email"><spring:message code="label.email" /></form:label></td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td><form:label path="telephone"><spring:message code="label.telephone" /></form:label></td>
                <td><form:input path="telephone" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Add AppUser" />
                </td>
            </tr>

        </table>
    </form:form>
</body>
</html>