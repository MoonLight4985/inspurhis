<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/18
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
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
<form method="post" action="${pageContext.request.contextPath}/doctor/save" method="post" name="ThisForm">
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">医生添加</div>
            <div class="pageInfo">
                <table>
                    <tr>
                        <td width="20%" align="right" hidden>医生ID</td>
                        <td width="20%"><input type="text" id="id" name="id" value="${doctor.id}" hidden/></td>
                        <td width="10%" align="right"></td>
                        <td width="50%"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">医生名</td>
                        <td width="20%"><input type="text" id="name" name="name" value="${doctor.name}"/></td>
                        <td width="10%" align="right">密码</td>
                        <td width="50%"><input type="text" id="password" name="password" value="${doctor.password}"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">真实姓名</td>
                        <td><input type="text" id="realname" name="realname" value="${doctor.realname}"/></td>
                        <td align="right">所属科室</td>
                        <td>
                            <select id="departId" name="departId">
                                <option value="0" ${doctor.departId==0 ? 'selected': ''}>请选择</option>
                                <c:forEach items="${departList}" var="depart">
                                    <option value="${depart.id}">${depart.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">职称</td>
                        <td>
                            <select id="positional" name="positional">
                                <option value="0">请选择</option>
                                <option value="1">技师</option>
                                <option value="2">主任医师</option>
                                <option value="3">专家</option>
                            </select>
                        </td>
                        <td align="right">联系电话</td>
                        <td><input type="text" id="tel" name="tel" value="${doctor.tel}"/></td>
                    </tr>
                    <tr>
                        <td align="right">年龄</td>
                        <td><input type="text" id="age" name="age" value="${doctor.age}"/></td>
                        <td align="right">性别</td>
                        <td><input type="text" id="sex" name="sex" value="${sex}"/></td>
                    </tr>
                    <tr>
                        <td align="right">家庭住址</td>
                        <td><input type="text" id="address" name="address"/></td>
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
