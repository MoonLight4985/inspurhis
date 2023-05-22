<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/18
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../css/select.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/select-ui.min.js"></script>
    <script type="text/javascript">
        function deletes(id) {
            window.location.href = "${pageContext.request.contextPath}/doctor/deleteByDoctorId?id=" + id;
        }

        function modify(id) {
            window.location.href = "${pageContext.request.contextPath}/doctor/findDoctorById?id=" + id;
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
    <form action="${pageContext.request.contextPath}/doctor/list" method="get">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">医生管理</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>医生ID</label><input name="id" value="${doctor.id}" type="text" class="scinput"/></li>
                    <li><label>医生名称</label><input name="realname" value="${doctor.realname}" type="text"
                                                  class="scinput"/></li>
                    <li><label>科室</label>  <!-- 从数据库科室表里面查询出科室id和科室名称，组合成下拉框 -->
                        <select style="width:150px;height:32px;" name="departId">
                            <option value="0">请选择</option>
                            <c:forEach items="${departList}" var="depart">
                                <option value="${depart.id}">${depart.name}</option>
                            </c:forEach>
                        </select>
                    </li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>
    <div class="pageColumn">
        <div class="pageButton"><a href="${pageContext.request.contextPath}/doctor/findDoctorById"><img
                src="../images/t01.png" title="新增"/></a><span>医生列表</span>
        </div>
        <table>
            <thead>
            <th width="">医生ID</th>
            <th width="">医生名</th>
            <th width="">密码</th>
            <th width="">真实姓名</th>
            <th width="">所属科室</th>
            <th width="">职称</th>
            <th width="">联系电话</th>
            <th width="">年龄</th>
            <th width="">性别</th>
            <th width="">家庭住址</th>
            <th width="10%">操作</th>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="doctor">
                <tr>
                    <td>${doctor.id}</td>
                    <td>${doctor.name}</td>
                    <td>${doctor.password}</td>
                    <td>${doctor.realname}</td>
                    <td>
                        <c:forEach items="${departList}" var="depart">
                            <c:if test="${depart.id == doctor.departId}">${depart.name}</c:if>
                        </c:forEach>
                    </td>
                    <td>${doctor.positional}</td>
                    <td>${doctor.tel}</td>
                    <td>${doctor.age}</td>
                    <td>${doctor.sex}</td>
                    <td>山东济南历城区</td>
                    <td>
                        <a onclick="modify(${doctor.id})"><img src="../images/icon/edit.png" width="16"
                                                               height="16"/></a>
                        <a onclick="deletes(${doctor.id})"><img src="../images/icon/del.png" width="16"
                                                                height="16"/></a>
                    </td>
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
                        href="${pageContext.request.contextPath}/doctor/list?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&id=${doctor.id}&realname=${doctor.realname}">«</a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                    <li class="${pageInfo.pageNum==nav?'active':''}"><a
                            href="${pageContext.request.contextPath}/doctor/list?pageNum=${nav}&pageSize=${pageInfo.pageSize}&id=${doctor.id}&realname=${doctor.realname}">${nav}</a>
                    </li>
                </c:forEach>


                <li>
                    <a href="${pageContext.request.contextPath}/doctor/list?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&id=${doctor.id}&realname=${doctor.realname}">»</a>
                </li>
            </ul>
            <ul>
                <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
                <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
            </ul>
            <ul>
                <li class="${pageInfo.pageSize==5?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctor/list?pageSize=5&id=${doctor.id}&realname=${doctor.realname}">5</a>
                </li>
                <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctor/list?pageSize=10&id=${doctor.id}&realname=${doctor.realname}">10</a>
                </li>
                <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctor/list?pageSize=15&id=${doctor.id}&realname=${doctor.realname}">15</a>
                </li>
                <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/doctor/list?pageSize=20&id=${doctor.id}&realname=${doctor.realname}">20</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
