<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello World</title>
</head>
<body>
    <h3>Hello World to me!</h3>

    <a href="/appUsers">App users page</a>
    <br />
    ${serverTime}
    <br />
    ${message}

    <a href="/exampleOne"> <spring:message code="label.example" /> 1</a> <br />
    <a href="/exampleTwo"> <spring:message code="label.example" /> 2</a> <br />
    <a href="/exampleThree"> <spring:message code="label.example" /> 3</a> <br />

    <div>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <p>
                <spring:message code="label.welcome" /> : ${pageContext.request.userPrincipal.name} | <a href="/logout"><spring:message code="label.logout"/></a>
            </p>
        </c:if>
    </div>

</body>
</html>