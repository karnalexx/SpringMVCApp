<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <jsp:include page="import.jsp"/>

    <title>Messages</title>

    <script>
        function showMessage(from, date, subject, text) {
            var dialog = $("#messageModalDialog");
            dialog.find("div[name=msg-from]").empty().append(from);
            dialog.find("div[name=msg-date]").empty().append(date);
            dialog.find("div[name=msg-subject]").empty().append(subject);
            dialog.find("div[name=msg-text]").empty().append(text);
            dialog.modal();
        }

        function deleteMessage(id) {
            bootbox.confirm('Delete Message?', function (result) {
                if (result) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/messages/delete/" + id,
                        type: 'DELETE',
                        success: function (data) {
                            $("#message" + id).remove();
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    })
                }
            });
        }

        $(document).ready(function () {
            $('.nav-pills li#messages').addClass('active');

            $('tr a').on('click', function (e) {
                e.stopPropagation();
            })
        });
    </script>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>Messages</h1>
    </div>
    <jsp:include page="menu.jsp"/>
    <div class="panel panel-default">
        <div class="panel-body">
            <table id="messages" class="table table-bordered table-hover sortable">
                <thead>
                <tr>
                    <th data-sortcolumn="1">FROM</th>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <th>TO</th>
                    </sec:authorize>
                    <th>DATE</th>
                    <th>SUBJECT</th>
                    <th>ACTION</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="msg" items="${messages}" varStatus="loop">
                    <tr id="message${msg.id}"
                        onclick="showMessage('${msg.from}', '${msg.date}', '${msg.subject}', '${msg.text}');">
                        <td>${msg.from}</td>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <td>${msg.to}</td>
                        </sec:authorize>
                        <td>${msg.date}</td>
                        <td>${msg.subject}</td>
                        <td>
                            <a href="#" onclick="deleteMessage('${msg.id}');">Delete</a><br/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Message Modal Dialog -->
<div class="modal fade" id="messageModalDialog" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Message</h4>
            </div>
            <div class="modal-body">
                <div name="msg-from"></div>
                <div name="msg-date"></div>
                <div name="msg-subject"></div>
                <div name="msg-text"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>