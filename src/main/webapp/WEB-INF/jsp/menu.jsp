<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<c:url value="${pageContext.request.contextPath}/" var="homeUrl"/>
<c:url value="${pageContext.request.contextPath}/user" var="userUrl"/>
<c:url value="${pageContext.request.contextPath}/admin" var="adminUrl"/>
<c:url value="${pageContext.request.contextPath}/manager" var="managerUrl"/>
<c:url value="${pageContext.request.contextPath}/logout" var="logoutUrl"/>

<div class="menu">
    <ul>
        <li><a href="${homeUrl}">Home</a></li>
        <li><a href="${userUrl}">User</a></li>
        <sec:authorize access="hasRole('ROLE_MANAGER')">
            <li><a href="${managerUrl}">Manager</a></li>
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="${adminUrl}">Admin</a></li>
        </sec:authorize>

        <li><a href="${logoutUrl}">Logout</a></li>
    </ul>
    <span id="menu-username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span>
    <br style="clear:left"/>
</div>