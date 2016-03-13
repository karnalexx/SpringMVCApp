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
        <li id="changePassword"><a href="#" onclick="changePassword();">Change Password</a></li>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li id="admin"><a href="${adminUrl}">Admin</a></li>
        </sec:authorize>
        <li><a href="${logoutUrl}">Logout</a></li>
    </ul>
</div>

<script>
    function changePassword() {
        $('#changePasswordModalDialog').modal();
    }
</script>

<!-- Change Password Modal Dialog -->
<div class="modal fade" id="changePasswordModalDialog" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Change Password</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="POST" action="${pageContext.request.contextPath}/admin/editUser/${user.id}">
                    <div class="form-group">
                        <label for="old-password">Old Password:</label>
                        <input type="password" class="form-control" id="old-password"/>
                    </div>
                    <div class="form-group">
                        <label for="new-password">New Password:</label>
                        <input type="password" path="password" class="form-control" id="new-password"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-default">Change</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

