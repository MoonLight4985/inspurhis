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

    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript">

        function deletes(id) {
            window.location.href = "${pageContext.request.contextPath}/depart/deleteByDepartId?id=" + id;
        }

        function modify(id) {
            window.location.href = "ksadd.html";
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
        <div class="pageButton"><a href="${pageContext.request.contextPath}/ksadd.jsp"><img src="../images/t01.png"
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
                        <a onclick="modify(id)"><img src="../images/icon/edit.png" width="16" height="16"/></a>
                        <a onclick="deletes(${depart.id})"><img src="../images/icon/del.png" width="16" height="16"/></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div><!-- #widget -->
</div>
</body>
</html>
