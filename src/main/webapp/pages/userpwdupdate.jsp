<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/21
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $('tbody tr:odd').addClass("trLight");

            $(".select-all").click(function(){
                if($(this).attr("checked")){
                    $(".checkBox input[type=checkbox]").each(function(){
                        $(this).attr("checked", true);
                    });
                }else{
                    $(".checkBox input[type=checkbox]").each(function(){
                        $(this).attr("checked", false);
                    });
                }
            });

        });
    </script>
    <style type="text/css">
        body {
            background:#FFF
        }
    </style>
</head>

<body>
<form method="post" action="${pageContext.request.contextPath}/updatepwd" name="ThisForm">
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">密码修改</div>
            <div class="pageInfo">
                <table>
                    <!-- <tr>
                        <td width="20%" align="right">登录名</td>
                        <td width="20%"><input type="text" id="username" name="username" /></td>
                    </tr> -->
                    <tr>
                        <td width="20%" align="right">原始密码</td>
                        <td width="20%"><input type="text" id="password1" name="password1" /></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">新密码</td>
                        <td width="20%"><input type="password" id="password2" name="password2" /></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">密码确认</td>
                        <td width="20%"><input type="password" id="password3" name="password3" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"  align="center"><input type="submit" value="确定" /></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">${message}</td>
                    </tr>
                </table>
            </div>
        </div><!-- #widget -->
    </div>

</form>
</body>
</html>
