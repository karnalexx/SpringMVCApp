<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/style.css"/>
	<title>Home</title>
</head>

<body>
	<jsp:include page="menu.jsp" />
	<h1 id="banner">Home</h1>
	<hr/>
	
	<p>Welcome <span id="username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span>!</p>
	<p>Home page main content</p>
</body>
</html>