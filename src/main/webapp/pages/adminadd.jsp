<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: qiwenyong
  Date: 2023/5/15
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('tbody tr:odd').addClass("trLight");
            $(".select-all").click(function () {
                if ($(this).attr("checked")) {
                    $(".checkBox input[type=checkbox]").each(function () {
                        $(this).attr("checked", true);
                    });
                } else {
                    $(".checkBox input[type=checkbox]").each(function () {
                        $(this).attr("checked", false);
                    });
                }
            });
        });
    </script>
    <style type="text/css">
        body {
            background: #FFF
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/users/save" method="post" name="ThisForm">
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">用户添加</div>
            <div class="pageInfo">
                <table>
                    <c:if test="${user.id != null}">
                        <tr>
                            <td width="20%" align="right">ID</td>
                            <td width="20%"><input type="text" id="id" name="id" value="${user.id}"/></td>
                        </tr>
                    </c:if>
                    <tr>
                        <td width="20%" align="right">用户名</td>
                        <td width="20%"><input type="text" id="username" name="username" value="${user.username}"/></td>
                        <td width="10%" align="right">用户密码</td>
                        <td width="50%"><input type="text" id="password" name="password" value="${user.password}"/></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">姓名</td>
                        <td width="20%"><input type="text" id="realname" name="realname" value="${user.realname}"/></td>
                        <td width="10%" align="right">用户类型</td>
                        <td width="50%">
                            <select id="type" name="role">
                                <option value="0">-请选择-</option>
                                <option value="1" ${user.role==1? 'selected':''}>管理人员</option>
                                <option value="2" ${user.role==2? 'selected':''}>会员</option>
                                <option value="3" ${user.role==3? 'selected':''}>服务台员工</option>
                                <option value="4" ${user.role==4? 'selected':''}>药剂师</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="10%" align="right">联系电话</td>
                        <td width="50%"><input type="text" id="tel" name="tel" value="${user.tel}"/></td>
                        <td width="20%" align="right">年龄</td>
                        <td width="20%"><input type="text" id="age" name="age" value="${user.age}"/></td>
                    </tr>
                    <tr>
                        <td width="10%" align="right">家庭住址</td>
                        <td width="50%"><input type="text" id="address" name="address" value="${user.address}"/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center"><input type="submit" value="确定"/></td>
                    </tr>
                </table>
            </div>
        </div><!-- #widget -->
    </div>
</form>
</body>
</html>

