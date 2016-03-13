<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <jsp:include page="import.jsp"/>

    <title>Manage Users</title>

    <script>
        $(document).ready(function () {
            $('.nav-pills li#admin').addClass('active');

            $("#role option[value=${selectedRoleId}]").attr('selected', 'selected');
        });
    </script>
</head>

<body>
<div class="container">
    <div class="page-header">
        <h1>Manage Users</h1>
    </div>
    <jsp:include page="menu.jsp"/>

    <form:form role="form" method="POST" modelAttribute="user"
               action="${pageContext.request.contextPath}/admin/editUser/${user.id}">
        <div class="form-group">
            <label for="username">Username:</label>
            <form:input path="username" class="form-control" id="username" placeholder="Username"/>
        </div>
        <div class="form-group">
            <label for="username">Password:</label>
            <form:input path="password" class="form-control" id="password" placeholder="Password"/>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <form:input type="email" path="email" class="form-control" id="email" placeholder="Email"/>
        </div>
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <form:input path="firstName" class="form-control" id="firstName" placeholder="First Name"/>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <form:input path="lastName" class="form-control" id="lastName" placeholder="Last Name"/>
        </div>
        <div class="form-group">
            <label for="role">Role:</label>
            <form:select class="form-control" id="role" path="role">
                <c:forEach items="${roles}" var="role">
                    <form:option value="${role.id}" label="${role}"/>
                </c:forEach>
            </form:select>
        </div>
        <button type="submit" class="btn btn-default">Save</button>
    </form:form>
</div>
</body>
</html>