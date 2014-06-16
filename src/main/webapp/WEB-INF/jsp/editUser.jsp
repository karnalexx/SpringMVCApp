<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" media="screen"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <title>Admin</title>
</head>

<body>
<jsp:include page="menu.jsp"/>
<h1 id="banner">Admin</h1>
<hr/>
<p>${message}</p>
<form:form method="POST" modelAttribute="user" action="${pageContext.request.contextPath}/admin/editUser/${user.id}">
    <table>
        <tbody>
        <tr>
            <td>Username:</td>
            <td><form:input path="username"/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><form:input path="password"/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><form:input path="email"/></td>
        </tr>
        <tr>
            <td>First Name:</td>
            <td><form:input path="firstName"/></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><form:input path="lastName"/></td>
        </tr>
        <tr>
            <td>Role:</td>
            <td>
                <form:select id="id" items="${roles}" itemValue="id" itemLabel="role" path="role">
                </form:select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"/></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</form:form>

</body>
</html>