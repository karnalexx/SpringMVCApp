<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <div>
        <p>Welcome!</p>
        <p>Home page main content</p>
    </div>
</div>
</body>
</html>