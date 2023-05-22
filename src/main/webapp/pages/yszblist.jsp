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
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/rl.js"></script>
    <script type="text/javascript">

        function deletes(id) {
            window.location.href = "${pageContext.request.contextPath}/doctorduty/deleteByDoctorDutyId?id=" + id;
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
    <style type="text/css">
        body {
            background: #FFF
        }
    </style>
</head>
<body>
<div id="contentWrap">
    <form action="${pageContext.request.contextPath}/doctorduty/list" method="get">

        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">医生值班管理</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>医生ID</label><input name="doctorId" type="text" class="scinput" value="${doctorDuty.doctorId}"/></li>
                    <li><label>日期</label><input type="text" id="workTime" name="workTime" value="${doctorDuty.workTime}"
                                                onClick="SelectDate(this.name)" class="scinput"/></li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>

    <div class="pageColumn">
        <div class="pageButton"><a href="${pageContext.request.contextPath}/doctorduty/toAddDoctorDuty"><img
                src="../images/t01.png" title="新增"/></a><span>医生值班列表</span></div>
        <table>
            <thead>
            <th width="">值班ID</th>
            <th width="">医生ID</th>
            <th width="">日期</th>
            <th width="10%">操作</th>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="doctorDuty">
                <tr>
                    <td>${doctorDuty.id}</td>
                    <td>
                        <c:forEach items="${doctorList}" var="doctor">
                            <c:if test="${doctor.id == doctorDuty.doctorId}">${doctor.realname}</c:if>
                        </c:forEach>
                    </td>
                    <td>${doctorDuty.workTime}</td>
                    <td>
                        <a onclick="deletes(${doctorDuty.id})"><img src="../images/icon/del.png" width="16"
                                                                    height="16"/></a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
<!-- #widget -->
<div id="pagination" style="align:right;margin-top:-10px;">
    <div id='project_pagination' class="pagination pagination-centered">
        <div class="pagination">
            <ul>
                <li class="disabled"><a
                        href="${pageContext.request.contextPath}/doctorduty/list?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&doctorId=#{doctorDuty.doctorId}&workTime=#{doctorDuty.workTime}">«</a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                    <li class="${pageInfo.pageNum==nav?'active':''}"><a
                            href="${pageContext.request.contextPath}/doctorduty/list?pageNum=${nav}&pageSize=${pageInfo.pageSize}&doctorId=#{doctorDuty.doctorId}&workTime=#{doctorDuty.workTime}">${nav}</a>
                    </li>
                </c:forEach>
                <li>
                    <a href="${pageContext.request.contextPath}/doctorduty/list?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&doctorId=#{doctorDuty.doctorId}&workTime=#{doctorDuty.workTime}">»</a>
                </li>
            </ul>
            <ul>
                <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
                <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
            </ul>
            <ul>
                <li class="${pageInfo.pageSize==5?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctorduty/list?pageSize=5&doctorId=#{doctorDuty.doctorId}&workTime=#{doctorDuty.workTime}">5</a>
                </li>
                <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctorduty/list?pageSize=10&doctorId=#{doctorDuty.doctorId}&workTime=#{doctorDuty.workTime}">10</a>
                </li>
                <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctorduty/list?pageSize=15&doctorId=#{doctorDuty.doctorId}&workTime=#{doctorDuty.workTime}">15</a>
                </li>
                <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctorduty/list?pageSize=20&doctorId=#{doctorDuty.doctorId}&workTime=#{doctorDuty.workTime}">20</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
</body>
</html>
