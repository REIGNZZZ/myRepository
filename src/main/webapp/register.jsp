<%--
  Created by IntelliJ IDEA.
  User: REIGNZZZ
  Date: 2020/7/1
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-1.11.1-min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/algorithm/md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/algorithm/aes-min.js"></script>
<script>
    function checkRegister() {
        var pwdInput = $("#pwd").val();
        $("#pwd").val(md5(pwdInput));
        if ($("#pwd").val().length == 32) {
            return true;
        } else {
            return false;
        }
    }
</script>
<body>
    我是注册页<br><br>
    <form action="${pageContext.request.contextPath}/shiros/register.do" method="post" onsubmit="checkRegister()">
        用户名：<input type="text" name="username"><br><br>
        密&nbsp;&nbsp;&nbsp;码：<input id="pwd" type="password" name="password"><br><br>
        <input type="submit" value="注册">
    </form>
</body>
</html>
