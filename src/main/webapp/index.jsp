<%--
  Created by IntelliJ IDEA.
  User: REIGNZZZ
  Date: 2020/6/29
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>
<script src="static/js/jquery-1.11.1-min.js"></script>
<script>
    $(function () {
        $("#login").click(function () {
            window.location.href = "/login.jsp"
        })
    })
</script>
<body>

    <div align="center">
        <h3>我是首页</h3>
        <button id="login">登录</button>
    </div>

</body>
</html>
