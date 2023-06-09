<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/19
  Time: 21:35
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
    <script type="text/javascript" src="../js/rl.js"></script>

    <style type="text/css">
        body {
            background: #FFF
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/doctorduty/save" method="post" name="ThisForm">
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">医生值班添加</div>
            <div class="pageInfo">
                <table>
                    <tr>
                        <td width="20%" align="right">医生</td>
                        <td width="20%">
                            <select id="doctorId" name="doctorId">
                                <option value="0">-请选择-</option>
                                <c:forEach items="${doctorList}" var="doctor">
                                    <option value="${doctor.id}">${doctor.realname}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td width="10%" align="right">日期</td>
                        <td width="50%"><input type="text" id="workTime" name="workTime"
                                               onClick="SelectDate(this.name)"/></td>
                    </tr>
                    <!-- <tr>
                        <td width="20%" align="right">开始时间</td>
                        <td width="20%"><input type="text" id="benginhour" name="benginhour" /> </td>
                        <td width="10%" align="right">结束时间</td>
                        <td width="50%"><input type="text" id="endhour" name="endhour" /></td>
                    </tr> -->
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
