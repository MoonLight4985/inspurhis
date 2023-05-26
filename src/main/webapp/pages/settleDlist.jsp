<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/21
  Time: 16:58
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

        function cz(id) {
            window.location.href = "membercz.html";
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
    <form action="${pageContext.request.contextPath}/costSettleDetail/list" method="get">
        <div id="widget table-widget">
            <div class="pageTitle">费用结算明细查询</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>会员ID</label><input name="memberId" type="text" class="scinput" value="${costSettleDetail.memberId}"/></li>
                    <li><label>会员名称</label><input name="" type="text" class="scinput"/></li>
                    <li><label>挂号号</label><input name="registerOrderId" type="text" class="scinput"/></li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>
    <!--表格控件 -->
    <div class="pageColumn">
        <div class="pageButton"><span>结算明细列表</span></div>
        <table>
            <thead>
            <th width="">会员ID</th>
            <th width="">会员名称</th>
            <th width="">挂号号</th>
            <th width="">结算费用</th>
            <th width="">结算人</th>
            <th width="">结算时间</th>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="costSettleDetail">
                <tr>
                    <td>${costSettleDetail.memberId}</td>
                    <td>
                        <c:forEach items="${memberList}" var="member">
                            <c:if test="${member.id == costSettleDetail.memberId}">${member.name}</c:if>
                        </c:forEach>
                    </td>
                    <td>${costSettleDetail.registerOrderId}</td>
                    <td>${costSettleDetail.settleAmount}</td>
                    <td>
                        <c:forEach items="${doctorList}" var="doctor">
                            <c:if test="${doctor.id == costSettleDetail.userId}">${doctor.name}</c:if>
                        </c:forEach>
                    </td><!-- 数据库结构应存储id值 -->
                    <td>${costSettleDetail.createTime}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div><!-- #widget -->
<div id="pagination" style="align:right;margin-top:-10px;">
    <div id='project_pagination' class="pagination pagination-centered">
        <div class="pagination">
            <ul>
                <li class="disabled"><a
                        href="${pageContext.request.contextPath}/costSettleDetail/list?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&memberId=${costSettleDetail.memberId}">«</a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                    <li class="${pageInfo.pageNum==nav?'active':''}"><a
                            href="${pageContext.request.contextPath}/costSettleDetail/list?pageNum=${nav}&pageSize=${pageInfo.pageSize}&memberId=${costSettleDetail.memberId}">${nav}</a>
                    </li>
                </c:forEach>


                <li>
                    <a href="${pageContext.request.contextPath}/costSettleDetail/list?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&memberId=${costSettleDetail.memberId}">»</a>
                </li>
            </ul>
            <ul>
                <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
                <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
            </ul>
            <ul>
                <li class="${pageInfo.pageSize==5?'active':''}"><a
                        href="${pageContext.request.contextPath}/costSettleDetail/list?pageSize=5&memberId=${costSettleDetail.memberId}">5</a>
                </li>
                <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/costSettleDetail/list?pageSize=10&memberId=${costSettleDetail.memberId}">10</a>
                </li>
                <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/costSettleDetail/list?pageSize=15&memberId=${costSettleDetail.memberId}">15</a>
                </li>
                <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/costSettleDetail/list?pageSize=20&memberId=${costSettleDetail.memberId}">20</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
</body>
</html>
