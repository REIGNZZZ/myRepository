<%--
  Created by IntelliJ IDEA.
  User: REIGNZZZ
  Date: 2020/6/30
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>首页</title>
</head>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-1.11.1-min.js"></script>
<script>
    $(function () {
        $.ajax({
            url:'${pageContext.request.contextPath}/users/getCurrentUser.do',
            type:'get',
            success:function (data) {
                var a = "/"+data.data.photoURL;

                $("#userPhoto").attr("src", a);
            },
            error:function (e) {

            }
        })
    })



</script>
<body>
    我是首页<br><br>
<a href="${pageContext.request.contextPath}/shiros/logout.do">退出</a>
    <br><br>
<a href="${pageContext.request.contextPath}/view/user/userlist.jsp">用户列表</a>
    <br><br>
<a href="${pageContext.request.contextPath}/view/user/adduser.jsp">新增用户</a>
    <br><br>
    <shiro:guest>
        <p>测试shiro标签，仅游客可见</p>
    </shiro:guest>

<form action="${pageContext.request.contextPath}/users/uploadPhoto.do" method="post" enctype="multipart/form-data">
    <input type="file" name="userphoto"><br><br>
    <input type="text" name="abc"><br><br>
    <input type="submit" value="上传头像">
</form>
<br><br>
<img id="userPhoto">


</body>
</html>
