<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/18
  Time: 15:43
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
            window.location.href = "${pageContext.request.contextPath}/depart/deleteByDepartId?id=" + id;
        }

        function modify(id) {
            window.location.href = "${pageContext.request.contextPath}/depart/findDepartById?id=" + id;
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
    <form action="${pageContext.request.contextPath}/depart/list" method="get">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">科室管理</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>科室ID</label><input name="departid" type="text" class="scinput"/></li>
                    <li><label>科室名称</label><input name="name" type="text" class="scinput"/></li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>
    <div class="pageColumn">
        <div class="pageButton"><a href="${pageContext.request.contextPath}/pages/ksadd.jsp"><img
                src="../images/t01.png"
                title="新增"/></a><span>科室列表</span>
        </div>
        <table>
            <thead>
            <th width="">科室ID</th>
            <th width="">科室名称</th>
            <th width="">修改人员</th>
            <th width="">添加日期</th>
            <th width="10%">操作</th>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="depart">
                <tr>
                    <td>${depart.id}</td>
                    <td>${depart.name}</td>
                    <td>${depart.userId}</td>
                    <td>${depart.createTime}</td>
                    <td>
                        <a onclick="modify(${depart.id})"><img src="../images/icon/edit.png" width="16"
                                                               height="16"/></a>
                        <a onclick="deletes(${depart.id})"><img src="../images/icon/del.png" width="16"
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
                        href="${pageContext.request.contextPath}/depart/list?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&id=${depart.id}&name=${depart.name}">«</a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                    <li class="${pageInfo.pageNum==nav?'active':''}"><a
                            href="${pageContext.request.contextPath}/depart/list?pageNum=${nav}&pageSize=${pageInfo.pageSize}&id=${depart.id}&name=${depart.name}">${nav}</a>
                    </li>
                </c:forEach>


                <li>
                    <a href="${pageContext.request.contextPath}/depart/list?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&id=${depart.id}&name=${depart.name}">»</a>
                </li>
            </ul>
            <ul>
                <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
                <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
            </ul>
            <ul>
                <li class="${pageInfo.pageSize==5?'active':''}"><a
                        href="${pageContext.request.contextPath}/depart/list?pageSize=5&id=${depart.id}&name=${depart.name}">5</a>
                </li>
                <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/depart/list?pageSize=10&id=${depart.id}&name=${depart.name}">10</a>
                </li>
                <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/depart/list?pageSize=15&id=${depart.id}&name=${depart.name}">15</a>
                </li>
                <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/depart/list?pageSize=20&id=${depart.id}&name=${depart.name}">20</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
