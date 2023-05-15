<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<body>
<h2>Hello World!</h2>
<form action="${pageContext.request.contextPath}/users/save" method="post">
    用户名：<input type="text" name="username"/> <br>
    密码： <input type="password" name="password"/>
    <input type="submit" value="注册">
</form>
</body>
</html>
