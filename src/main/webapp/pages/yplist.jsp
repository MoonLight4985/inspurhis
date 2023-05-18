<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/17
  Time: 15:51
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
            window.location.href = "${pageContext.request.contextPath}/medicine/deleteByMedicineId?id=" + id;
        }

        function modify(id) {
            window.location.href = "${pageContext.request.contextPath}/medicine/findMedicineById?id=" + id;
        }

        function cz(id) {
            window.location.href = "${pageContext.request.contextPath}/medicine/increase?id=" + id;
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
    <form action="${pageContext.request.contextPath}/medicine/list" method="get">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">药品管理</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>药品ID</label><input name="drugsid" type="text" class="scinput"/></li>
                    <li><label>药品名称</label><input name="name" type="text" class="scinput"/></li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>
    <div class="pageColumn">
        <div class="pageButton"><a href="${pageContext.request.contextPath}/pages/ypadd.jsp"><img
                src="${pageContext.request.contextPath}/images/t01.png" title="新增"/></a><span>药品列表</span>
        </div>
        <table>
            <thead>
            <th width="">药品ID</th>
            <th width="">药品名称</th>
            <th width="">进价</th>
            <th width="">售价</th>
            <th width="">库存数量</th>
            <th width="">引入日期</th>
            <th width="">生产厂商</th>
            <th width="">生产日期</th>
            <th width="">保质期</th>
            <th width="">供货单位</th>
            <th width="10%">操作</th>
            <th width="10%">库存新增</th>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="medicine">
                <tr>
                    <td>${medicine.id}</td>
                    <td>${medicine.name}</td>
                    <td>${medicine.purchasePrice}</td>
                    <td>${medicine.price}</td>
                    <td><font color="red">${medicine.number}</font></td>
                    <td>${medicine.introduceDate}</td>
                    <td>${medicine.productUnit}</td>
                    <td>${medicine.productDate}</td>
                    <td>${medicine.qualityPeriod}</td>
                    <td>${medicine.supplyUnit}</td>
                    <td>
                        <a onclick="modify(${medicine.id})"><img src="../images/icon/edit.png" width="16" height="16"/></a>
                        <a onclick="deletes(${medicine.id})"><img src="../images/icon/del.png" width="16" height="16"/></a>
                    </td>
                    <td>
                        <a onclick="cz(${medicine.id})"><img src="../images/icon/edit2.png" width="16" height="16"/></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- #widget -->
    <div id="pagination" style="align:right;margin-top:-10px;">
        <div id='project_pagination' class="pagination pagination-centered">
            <div class="pagination">
                <ul>
                    <li class="disabled"><a
                            href="${pageContext.request.contextPath}/medicine/list?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&id=${medicine.id}&name=${medicine.name}">«</a>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                        <li class="${pageInfo.pageNum==nav?'active':''}"><a
                                href="${pageContext.request.contextPath}/medicine/list?pageNum=${nav}&pageSize=${pageInfo.pageSize}&id=${medicine.id}&name=${medicine.name}">${nav}</a>
                        </li>
                    </c:forEach>


                    <li>
                        <a href="${pageContext.request.contextPath}/medicine/list?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&id=${medicine.id}&name=${medicine.name}">»</a>
                    </li>
                </ul>
                <ul>
                    <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
                    <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
                </ul>
                <ul>
                    <li class="${pageInfo.pageSize==5?'active':''}"><a
                            href="${pageContext.request.contextPath}/medicine/list?pageSize=5&id=${medicine.id}&name=${medicine.name}">5</a>
                    </li>
                    <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                            href="${pageContext.request.contextPath}/medicine/list?pageSize=10&id=${medicine.id}&name=${medicine.name}">10</a>
                    </li>
                    <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                            href="${pageContext.request.contextPath}/medicine/list?pageSize=15&id=${medicine.id}&name=${medicine.name}">15</a>
                    </li>
                    <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                            href="${pageContext.request.contextPath}/medicine/list?pageSize=20&id=${medicine.id}&name=${medicine.name}">20</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
