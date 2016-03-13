<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:url value="${pageContext.request.contextPath}/" var="homeUrl"/>
<c:url value="${pageContext.request.contextPath}/admin" var="adminUrl"/>
<c:url value="${pageContext.request.contextPath}/logout" var="logoutUrl"/>
<c:url value="${pageContext.request.contextPath}/messages" var="messagesUrl"/>

<div class="menu">
    <ul class="nav nav-pills">
        <li id="home"><a href="${homeUrl}">Home</a></li>
        <li id="messages"><a href="${messagesUrl}">Messages</a></li>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li id="admin"><a href="${adminUrl}">Admin</a></li>
        </sec:authorize>

        <li><a href="${logoutUrl}">Logout</a></li>
    </ul>
</div>