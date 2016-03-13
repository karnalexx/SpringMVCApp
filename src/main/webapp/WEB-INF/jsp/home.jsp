<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<html>
<head>
    <jsp:include page="import.jsp"/>

    <title>Home</title>

    <script>
        $(document).ready(function () {
            $('.nav-pills li#home').addClass('active');
        });
    </script>

</head>

<body>
<div class="container">
    <div class="page-header">
        <h1>Home</h1>
    </div>
    <jsp:include page="menu.jsp"/>
    <div class="panel panel-default">
        <div class="panel-body">
            <p>Welcome <span id="username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span>!
            </p>
            <p>Home page main content</p>
        </div>
    </div>
</div>

</body>
</html>