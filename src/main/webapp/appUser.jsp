<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App user page form</title>
</head>
<body>
    <h1>App user info:</h1>
    <form:form method="post" action="addAppUser" modelAttribute="appUser">
        <table>
            <tr>
                <td><form:label path="firstName">First Name</form:label></td>
                <td><form:input path="firstName" /></td>
            </tr>
            <tr>
                <td><form:label path="lastName">Last Name</form:label></td>
                <td><form:input path="lastName" /></td>
            </tr>
            <tr>
                <td><form:label path="email">Email</form:label></td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td><form:label path="telephone">Telephone</form:label></td>
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