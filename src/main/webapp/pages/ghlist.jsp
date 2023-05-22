<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/19
  Time: 17:47
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
    <script type="text/javascript">

        function deletes(id) {
            window.location.href = "${pageContext.request.contextPath}/registerorder/deleteByOrderId?id=" + id;
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
    <form action="${pageContext.request.contextPath}/registerorder/list" method="get">
        <div id="widget table-widget">
            <div class="pageTitle">挂号管理</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>挂号号</label><input name="id" value="${registerOrder.id}" type="text" class="scinput"/>
                    </li>
                    <li><label>会员ID</label><input name="memberId" value="${registerOrder.memberId}" type="text"
                                                  class="scinput"/></li>
                    <li><label>科室</label><input name="departId" value="${registerOrder.departId}" type="text"
                                                class="scinput"/></li>
                    <li><label>挂号时间</label><input name="roTime" value="${registerOrder.roTime}" type="text"
                                                  class="scinput"/></li>
                    <li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>
    <!--表格控件 -->
    <div class="pageColumn">
        <div class="pageButton"><a href="${pageContext.request.contextPath}/registerorder/toAddOrder"><img
                src="../images/t01.png" title="新增"/></a><span>挂号列表</span>
        </div>
        <table>
            <thead>
            <th width="">挂号号</th>
            <th width="">会员</th>
            <th width="">科室</th>
            <th width="">医生</th>
            <th width="">挂号费用</th>
            <th width="">挂号时间</th>
            <th width="">操作时间</th>
            <th width="10%">操作</th>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="registerOrder">
                <tr>
                    <td>${registerOrder.id}</td>
                    <td>
                        <c:forEach items="${memberList}" var="member">
                            <c:if test="${member.id == registerOrder.memberId}">${member.name}</c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${departList}" var="depart">
                            <c:if test="${depart.id == registerOrder.departId}">${depart.name}</c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${doctorList}" var="doctor">
                            <c:if test="${doctor.id == registerOrder.doctorId}">${doctor.realname}</c:if>
                        </c:forEach>
                    </td>
                    <td>${registerOrder.price}</td>
                    <td>${registerOrder.roTime}</td>
                    <td>${registerOrder.optionTime}</td>
                    <td><a onclick="deletes(${registerOrder.id})"><img src="../images/icon/del.png" width="16"
                                                                       height="16"/></a></td>
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
                        href="${pageContext.request.contextPath}/registerorder/list?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&id=${registerorder.id}&memberId=#{registerOrder.memberId}&departId=#{registerOrder.departId}&roTime=#{registerOrder.roTime}">«</a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                    <li class="${pageInfo.pageNum==nav?'active':''}"><a
                            href="${pageContext.request.contextPath}/registerorder/list?pageNum=${nav}&pageSize=${pageInfo.pageSize}&id=${registerorder.id}&memberId=#{registerOrder.memberId}&departId=#{registerOrder.departId}&roTime=#{registerOrder.roTime}">${nav}</a>
                    </li>
                </c:forEach>


                <li>
                    <a href="${pageContext.request.contextPath}/registerorder/list?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&id=${registerorder.id}&memberId=#{registerOrder.memberId}&departId=#{registerOrder.departId}&roTime=#{registerOrder.roTime}">»</a>
                </li>
            </ul>
            <ul>
                <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
                <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
            </ul>
            <ul>
                <li class="${pageInfo.pageSize==5?'active':''}"><a
                        href="${pageContext.request.contextPath}/registerorder/list?pageSize=5&id=${registerorder.id}&memberId=#{registerOrder.memberId}&departId=#{registerOrder.departId}&roTime=#{registerOrder.roTime}">5</a>
                </li>
                <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/registerorder/list?pageSize=10&id=${registerorder.id}&memberId=#{registerOrder.memberId}&departId=#{registerOrder.departId}&roTime=#{registerOrder.roTime}">10</a>
                </li>
                <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/registerorder/list?pageSize=15&id=${registerorder.id}&memberId=#{registerOrder.memberId}&departId=#{registerOrder.departId}&roTime=#{registerOrder.roTime}">15</a>
                </li>
                <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/registerorder/list?pageSize=20&id=${registerorder.id}&memberId=#{registerOrder.memberId}&departId=#{registerOrder.departId}&roTime=#{registerOrder.roTime}">20</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
</body>
</html>
