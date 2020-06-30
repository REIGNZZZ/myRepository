<%--
  Created by IntelliJ IDEA.
  User: REIGNZZZ
  Date: 2020/6/30
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页</title>
</head>
<body>

    我是登录页<br><br>
<form action="${pageContext.request.contextPath}/shiros/login.do" method="post">
    用户名：<input type="text" name="username"><br><br>
    密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"><br><br>
    <input type="submit" value="登录">
</form>

</body>
</html>
