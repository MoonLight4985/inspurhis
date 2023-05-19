<%--
  Created by IntelliJ IDEA.
  User: qiwenyong
  Date: 2023/5/19
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>社区医疗管理系统</title>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $('.captcha').focus(function(){
                $('.yzm-box').show();
            });

            $('.captcha').focusout(function(){
                $('.yzm-box').hide();
            });
        });
    </script>
</head>
<body>
<div id="message-box"> 用户名或密码错误！ </div>
<div id="wrap">
    <div id="header"> </div>
    <div id="content-wrap">
        <div class="space"> </div>
        <form action="${pageContext.request.contextPath}/login" method="post" name="ThisForm">
            <div class="content">
                <div class="field"><label>账　户：</label><input class="username" name="name"  type="text" /></div>
                <div class="field"><label>密　码：</label><input class="password" name="password"  type="password" /><br/></div>
                <div class="yzm-box">
                    <!-- <label>验证码：</label>
                        <img src="image.do" id="yzmimage" align="middle"
                            onclick="this.src=this.src+'?'" /><label
                            style="color: red" id="yzmerror"></label> -->
                </div>
            </div>
            <div class="btn"><input  type="submit" class="login-btn" value="登录" /></div>
        </form>
    </div>
    <div id="footer"> </div>
</div>
</body>
</html>
