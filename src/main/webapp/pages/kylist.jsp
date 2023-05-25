<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/21
  Time: 12:03
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

        function deletes(id, orderid) {
            window.location.href = "${pageContext.request.contextPath}/prescribe/deleteByPrescribeId?id=" + id + "&registerOrderId=" + orderid;
        }

        function ky(orderid, doctorAdviceId) {
            <%--// 	var yzid = '<%=yzid%>';--%>
            window.location.href = "${pageContext.request.contextPath}/prescribe/toAdd?registerOrderId=" + orderid + "&doctorAdviceId=" + doctorAdviceId;
        }

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
    <script type="text/javascript">
        function back() {
            window.location.href = "${pageContext.request.contextPath}/doctorAdvice/list";
        }

    </script>
    <style type="text/css">
        body {
            background: #FFF
        }
    </style>
</head>
<body>
<div id="contentWrap">
    <!--表格控件 -->
    <div id="widget table-widget">
        <div class="pageTitle">医生开药列表</div>
        <div class="pageColumn">
            <table>
                <thead>
                <th width="">挂号号</th>
                <th width="">药品ID</th>
                <th width="">药品名称</th>
                <th width="">数量</th>
                <th width="">描述</th>
                <th width="10%">操作</th>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo}" var="ky">
                    <tr>
                        <td>${ky.registerOrderId}</td>
                        <td>${ky.medicineId}</td>
                        <td>
                            <c:forEach items="${medicineList}" var="medicine">
                                <c:if test="${medicine.id == ky.medicineId}">${medicine.name}</c:if>
                            </c:forEach>
                        </td>
                        <td>${ky.number}</td>
                        <td>${ky.description}</td>
                        <td><a onclick="deletes(${ky.id}, ${ky.registerOrderId})"><img src="../images/icon/del.png"
                                                                                       width="16" height="16"/></a></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="6"><input type="button"
                                           onclick="ky(${sessionScope.registerOrderId}, ${sessionScope.doctorAdviceId})"
                                           value="新增药品"/>&nbsp;<input type="button" value="返回" onclick="back()"/></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div><!-- #widget -->
</div>
</body>
</html>
