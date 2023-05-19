<%--isELIgnored="false" ：设置支持EL表达式--%>
<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<body>
<%--<h2>Hello World!</h2>
<form action="${pageContext.request.contextPath}/users/save" method="post">
    用户名：<input type="text" name="username"><br/>
    用户名：<input type="password" name="password"><br/>
    <input type="submit" value="注册">
</form>--%>
<%--默认就跳转到登录界面--%>
<jsp:forward page="pages/login.jsp"></jsp:forward>
</body>
</html>
