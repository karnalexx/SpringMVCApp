<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
    <jsp:include page="../import.jsp"/>
    <title>Login</title>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>Login</h1>
    </div>

    <c:if test="${not empty message}">
        <div class="alert alert-danger">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>${message}</strong>
        </div>
    </c:if>

    <div class="well">
        <form class="form-horizontal" role="form" action="j_spring_security_check" method="post">
            <div class="form-group">
                <label class="control-label col-sm-2" for="j_username">Username:</label>
                <div class="col-sm-10">
                    <input class="form-control" id="j_username" name="j_username" size="10" maxlength="10" type="text"
                           placeholder="Username"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="j_password">Password:</label>
                <div class="col-sm-10">
                    <input class="form-control" id="j_password" name="j_password" size="10" maxlength="10"
                           type="password"
                           placeholder="Enter password"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Login</button>
                    <a class="btn btn-info" role="button"
                       href="${pageContext.request.contextPath}/register">Register</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>