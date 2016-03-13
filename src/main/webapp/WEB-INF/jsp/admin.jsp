<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <jsp:include page="import.jsp"/>

    <title>Manage Users</title>

    <script>
        function deleteUser(id) {
            bootbox.confirm('Delete User?', function (result) {
                if (result) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/deleteUser/" + id,
                        type: 'DELETE',
                        success: function (data) {
                            console.log(data);
                            $("#user" + id).remove();
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    })
                }
            });
        }

        $(document).ready(function () {
            $('.nav-pills li#admin').addClass('active');
        });
    </script>
</head>

<body>
<div class="container">
    <div class="page-header">
        <h1>Manage Users</h1>
    </div>
    <jsp:include page="menu.jsp"/>
    <div class="panel panel-default">
        <div class="panel-body">
            <a style="margin-bottom: 10px;" class="btn btn-info" role="button"
               href="${pageContext.request.contextPath}/admin/addUser">Add new
                user</a>
            <table id="users" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>USERNAME</th>
                    <th>EMAIL</th>
                    <th>FIRST NAME</th>
                    <th>LAST NAME</th>
                    <th>ROLE</th>
                    <th>ACTION</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                    <tr id="user${user.id}">
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.role}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/editUser/${user.id}">Edit</a><br/>
                            <a href="#" onclick="deleteUser('${user.id}');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>