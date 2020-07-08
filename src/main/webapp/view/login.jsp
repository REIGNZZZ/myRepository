<%--
  Created by IntelliJ IDEA.
  User: REIGNZZZ
  Date: 2020/6/30
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>登录页</title>
</head>
<script src="${pageContext.request.contextPath}/static/js/jquery/jquery-1.11.1-min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/algorithm/md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/algorithm/aes.js"></script>
<script>
    function checkSubmit() {

        var pwdInput = $("#pwd").val();
        var uuidSalt = $("#uuidSalt").val();
        var md5Pwd = md5(pwdInput);
        var aesPwd = encodeAesString(md5Pwd, uuidSalt, uuidSalt);
        $("#pwd").val(aesPwd);
        if ($("#pwd").val().length == 64) {
            console.log(aesPwd)
            console.log(uuidSalt)
            return true;
        } else {
            return false;
        }
    }

    function encodeAesString(data,key,iv){
        var key  = CryptoJS.enc.Utf8.parse(key);
        var iv   = CryptoJS.enc.Utf8.parse(iv);
        var encrypted =CryptoJS.AES.encrypt(data,key,{
            iv:iv,
            mode:CryptoJS.mode.CBC,
            padding:CryptoJS.pad.Pkcs7
        });
        //返回的是base64格式的密文
        return encrypted;
    }

    // encrypted 为是base64格式的密文
    function decodeAesString(encrypted,key,iv){
        var key  = CryptoJS.enc.Utf8.parse(key);
        var iv   = CryptoJS.enc.Utf8.parse(iv);
        var decrypted =CryptoJS.AES.decrypt(encrypted,key,{
            iv:iv,
            mode:CryptoJS.mode.CBC,
            padding:CryptoJS.pad.Pkcs7
        });
        return decrypted.toString(CryptoJS.enc.Utf8);
    }



</script>
<body>
    我是登录页<br><br>
    <input id="uuidSalt" value="${uuidSalt}" /><br><br>
<form action="${pageContext.request.contextPath}/shiros/login.do" method="post" onsubmit="checkSubmit()">
    用户名：<input type="text" name="username"><br><br>
    密&nbsp;&nbsp;&nbsp;码：<input id="pwd" type="password" name="password"><br><br>
    <input type="checkbox" name="rememberMe" value="1">7天免登录<br><br>
    <input type="submit" value="登录">
</form>
<br><br>
没有账号？<a href="${pageContext.request.contextPath}/view/register.jsp">申请账号</a>
 <shiro:guest>
     <p>测试shiro标签，仅游客可见</p>
 </shiro:guest>

</body>
</html>
