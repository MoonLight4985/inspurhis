<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/20
  Time: 11:12
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
            window.location.href = "${pageContext.request.contextPath}/doctorAdvice/deleteByDoctorAdviceId?id=" + id;
        }

        function ky(id, doctorAdviceId) {
            window.location.href = "${pageContext.request.contextPath}/prescribe/list?registerOrderId=" + id + "&doctorAdviceId=" + doctorAdviceId;
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
    <form action="${pageContext.request.contextPath}/doctorAdvice/list">
        <div id="widget table-widget">
            <div class="pageTitle">医生诊断管理</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>挂号号</label><input name="registerOrderId" value="${doctorAdvice.registerOrderId}" type="text" class="scinput"/></li>
                    <li><label>会员ID</label><input name="memberId" value="${doctorAdvice.memberId}" type="text" class="scinput"/></li>
                    <li><label>诊断时间</label><input name="createTime" value="${doctorAdvice.createTime}" id="createTime" type="text" class="scinput"
                                                  onClick="SelectDate(this.name)"/></li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>
    <!--表格控件 -->

    <div class="pageColumn">
        <div class="pageButton"><a href="${pageContext.request.contextPath}/doctorAdvice/toAddDoctorAdvice"><img src="../images/t01.png" title="新增"/></a><span>医生诊断结果列表</span>
        </div>
        <table>
            <thead>
            <th width="">挂号号</th>
            <th width="">会员ID</th>
            <th width="">诊断人</th>
            <th width="">诊断时间</th>
            <th width="">诊断结果</th>
<%--            <th width="">药方</th>--%>
            <th width="10%">操作</th>
            <th width="10%">开药信息</th>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="doctorAdvice">
                <tr>
                    <td>${doctorAdvice.id}</td>
                    <td>${doctorAdvice.memberId}</td>
                    <td>
                        <c:forEach items="${doctorList}" var="doctor">
                            <c:if test="${doctor.id == doctorAdvice.doctorId}">${doctor.name}</c:if>
                        </c:forEach>
                    </td>
                    <td>${doctorAdvice.createTime}</td>
                    <td>${doctorAdvice.prescription}</td>
<%--                    <td>西药治疗：皮炎平</td>--%>
                    <td><a onclick="deletes(${doctorAdvice.id})"><img src="../images/icon/del.png" width="16" height="16"/></a></td>
                    <td><a onclick="ky(${doctorAdvice.registerOrderId}, ${doctorAdvice.id})"><img src="../images/icon/edit2.png" width="16" height="16"/></a></td>
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
                        href="${pageContext.request.contextPath}/doctorAdvice/list?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&registerOrderId=${doctorAdvice.registerOrderId}&memberId=${doctorAdvice.memberId}&createTime=${doctorAdvice.createTime}">«</a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                    <li class="${pageInfo.pageNum==nav?'active':''}"><a
                            href="${pageContext.request.contextPath}/doctorAdvice/list?pageNum=${nav}&pageSize=${pageInfo.pageSize}&registerOrderId=${doctorAdvice.registerOrderId}&memberId=${doctorAdvice.memberId}&createTime=${doctorAdvice.createTime}">${nav}</a>
                    </li>
                </c:forEach>


                <li>
                    <a href="${pageContext.request.contextPath}/doctorAdvice/list?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&registerOrderId=${doctorAdvice.registerOrderId}&memberId=${doctorAdvice.memberId}&createTime=${doctorAdvice.createTime}">»</a>
                </li>
            </ul>
            <ul>
                <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
                <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
            </ul>
            <ul>
                <li class="${pageInfo.pageSize==5?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctorAdvice/list?pageSize=5&registerOrderId=${doctorAdvice.registerOrderId}&memberId=${doctorAdvice.memberId}&createTime=${doctorAdvice.createTime}">5</a>
                </li>
                <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctorAdvice/list?pageSize=10&registerOrderId=${doctorAdvice.registerOrderId}&memberId=${doctorAdvice.memberId}&createTime=${doctorAdvice.createTime}">10</a>
                </li>
                <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctorAdvice/list?pageSize=15&registerOrderId=${doctorAdvice.registerOrderId}&memberId=${doctorAdvice.memberId}&createTime=${doctorAdvice.createTime}">15</a>
                </li>
                <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctorAdvice/list?pageSize=20&registerOrderId=${doctorAdvice.registerOrderId}&memberId=${doctorAdvice.memberId}&createTime=${doctorAdvice.createTime}">20</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
