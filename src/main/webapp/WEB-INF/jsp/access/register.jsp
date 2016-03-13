<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
    <jsp:include page="../import.jsp"/>
    <title>Register</title>

    <script>
        function register() {
            var username = $('#username').val();
            var password = $('#password').val();
            var json = {"username": username, "password": password};
            $.ajax({
                url: "${pageContext.request.contextPath}/register",
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: JSON.stringify(json),
                success: function (data) {
                    alert(data);
                },
                error: function (err) {
                    console.log(err);
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>Register</h1>
    </div>

    <div id="error" style="display: none;" class="alert alert-danger">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong id="text"></strong>
    </div>

    <div class="well">
        <div class="form-group">
            <label for="username">Username:</label>
            <input required="true" path="username" class="form-control" id="username" placeholder="Username"/>
        </div>
        <div class="form-group">
            <label for="username">Password:</label>
            <input required="true" path="password" class="form-control" id="password" placeholder="Password"/>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" path="email" class="form-control" id="email" placeholder="Email"/>
        </div>
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input path="firstName" class="form-control" id="firstName" placeholder="First Name"/>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input path="lastName" class="form-control" id="lastName" placeholder="Last Name"/>
        </div>
        <div class="form-group">
            <button id="register" onclick="register();" class="btn btn-default">Register</button>
            <a class="btn btn-info" role="button"
               href="${pageContext.request.contextPath}/login">Login</a>
        </div>
    </div>
</div>
</body>
</html>