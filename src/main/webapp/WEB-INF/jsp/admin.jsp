<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <title>Admin</title>
</head>

<body>
<jsp:include page="menu.jsp"/>
<h1 id="banner">Admin</h1>
<hr/>
<p>${message}</p>
<a href="${pageContext.request.contextPath}/admin/addUser">Add new user</a><br/>
<table>
<tr>
    <th>USERNAME</th>
    <th>EMAIL</th>
    <th>FIRST NAME</th>
    <th>LAST NAME</th>
    <th>ROLE</th>
    <th></th>
</tr>
<c:forEach var="user" items="${users}">
    <tr>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.role.role}</td>
        <td>
            <a href="${pageContext.request.contextPath}/admin/editUser/${user.id}">Edit</a><br/>
            <a href="${pageContext.request.contextPath}/admin/deleteUser/${user.id}">Delete</a><br/>
        </td>
    </tr>
</c:forEach>
</table>
</body>
</html>