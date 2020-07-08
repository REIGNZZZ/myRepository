<%--
  Created by IntelliJ IDEA.
  User: REIGNZZZ
  Date: 2020/6/30
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<body>
    我是首页<br><br>
<a href="${pageContext.request.contextPath}/logout.do">退出</a>
    <br><br>
<a href="${pageContext.request.contextPath}/view/user/userlist.jsp">用户列表</a>
    <br><br>
<a href="${pageContext.request.contextPath}/view/user/adduser.jsp">新增用户</a>
    <br><br>


</body>
</html>
