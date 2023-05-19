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
            window.location.href = "gylist.html";
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
    <form action="${pageContext.request.contextPath}/registerOrder/list" method="get">
        <div id="widget table-widget">
            <div class="pageTitle">挂号管理</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>挂号号</label><input name="" type="text" class="scinput"/></li>
                    <li><label>会员ID</label><input name="" type="text" class="scinput"/></li>
                    <li><label>科室</label><input name="" type="text" class="scinput"/></li>
                    <li><label>挂号时间</label><input name="" type="text" class="scinput"/></li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>
    <!--表格控件 -->
    <div class="pageColumn">
        <div class="pageButton"><a href="${pageContext.request.contextPath}/registerOrder/save"><img src="../images/t01.png" title="新增"/></a><span>挂号列表</span>
        </div>
        <table>
            <thead>
            <th width="">挂号号</th>
            <th width="">会员ID</th>
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
                    <td>${registerOrder.memberId}</td>
                    <td>${registerOrder.departId}</td>
                    <td>${registerOrder.doctorId}</td>
                    <td>${registerOrder.price}</td>
                    <td>${registerOrder.roTime}</td>
                    <td>${registerOrder.optionTime}</td>
                    <td><a onclick="deletes(id)"><img src="../images/icon/del.png" width="16" height="16"/></a></td>
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
                <li class="disabled"><a href="#">«</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">»</a></li>
            </ul>
            <ul>
                <li><span>(1-10/38)</span></li>
                <li><span>显示条数&nbsp;:&nbsp;</span></li>
            </ul>
            <ul>
                <li class="active"><a href="#">10</a></li>
                <li class=""><a href="#">30</a></li>
                <li class=""><a href="#">50</a></li>
            </ul>
        </div>
    </div>
</div>
</div>
</body>
</html>
