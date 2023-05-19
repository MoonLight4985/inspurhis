<%--
  Created by IntelliJ IDEA.
  User: qiwenyong
  Date: 2023/5/15
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--导入JSTL标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/select.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/select-ui.min.js"></script>
    <script type="text/javascript">
        /*
        * 设置每页显示的条数
        * */
        function deletes(id) {
            window.location.href = "${pageContext.request.contextPath}/users/deleteByUserId?id=" + id;
        }

        function modify(id) {
            window.location.href = "${pageContext.request.contextPath}/users/findUserById?id=" + id;
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
    <form action="${pageContext.request.contextPath}/users/list" method="get">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">用户管理</div>
            <div class="querybody">
                <ul class="seachform">
                    <li><label>用户ID</label><input name="id" value="${users.id}" type="text" class="scinput"/></li>
                    <li><label>用户姓名</label><input name="realname" value="${users.realname}" type="text"
                                                  class="scinput"/></li>
                    <li><label>用户类型</label>
                        <select name="role" style="width:150px;height:32px;">
                            <option value="">-请选择-</option>
                            <option value="1" ${users.role==1?'selected':''}>管理人员</option>
                            <option value="2" ${users.role==2?'selected':''}>会员</option>
                            <option value="3" ${users.role==3?'selected':''}>服务台员工</option>
                            <option value="4" ${users.role==4?'selected':''}>药剂师</option>
                        </select>
                    </li>
                    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
                </ul>
            </div>
        </div>
    </form>
    <div class="pageColumn">
        <div class="pageButton"><a href="${pageContext.request.contextPath}/pages/adminadd.jsp"><img
                src="${pageContext.request.contextPath}/images/t01.png" title="新增"/></a><span>用户列表</span></div>
        <table>
            <thead>
            <th width="">用户ID</th>
            <th width="">用户名</th>
            <th width="">密码</th>
            <th width="">姓名</th>
            <th width="">用户类型</th>
            <th width="">联系电话</th>
            <th width="">年龄</th>
            <th width="">家庭住址</th>
            <th width="10%">操作</th>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="users">
                <tr>
                    <td>${users.id}</td>
                    <td>${users.username}</td>
                    <td>${users.password}</td>
                    <td>${users.realname}</td>
                    <td>
                        <c:choose>
                            <c:when test="${users.role == '1'}">管理人员</c:when>
                            <c:when test="${users.role == '2'}">会员</c:when>
                            <c:when test="${users.role == '3'}">服务台员工</c:when>
                            <c:when test="${users.role == '4'}">药剂师</c:when>
                        </c:choose>
                    </td>
                    <td>${users.tel}</td>
                    <td>${users.age}</td>
                    <td>${users.address}</td>
                    <td>
                        <a onclick="modify(${users.id})"><img src="../images/icon/edit.png" width="16" height="16"/></a>
                        <a onclick="deletes(${users.id})"><img src="../images/icon/del.png" width="16" height="16"/></a>
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
                        href="${pageContext.request.contextPath}/users/list?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&id=${users.id}&realname=${users.realname}&role=${users.role}">«</a>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                    <li class="${pageInfo.pageNum==nav?'active':''}"><a
                            href="${pageContext.request.contextPath}/users/list?pageNum=${nav}&pageSize=${pageInfo.pageSize}&id=${users.id}&realname=${users.realname}&role=${users.role}">${nav}</a>
                    </li>
                </c:forEach>


                <li>
                    <a href="${pageContext.request.contextPath}/users/list?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&id=${users.id}&realname=${users.realname}&role=${users.role}">»</a>
                </li>
            </ul>
            <ul>
                <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
                <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
            </ul>
            <ul>
                <li class="${pageInfo.pageSize==5?'active':''}"><a
                        href="${pageContext.request.contextPath}/users/list?pageSize=5&id=${users.id}&realname=${users.realname}&role=${users.role}">5</a>
                </li>
                <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/users/list?pageSize=10&id=${users.id}&realname=${users.realname}&role=${users.role}">10</a>
                </li>
                <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/users/list?pageSize=15&id=${users.id}&realname=${users.realname}&role=${users.role}">15</a>
                </li>
                <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                        href="${pageContext.request.contextPath}/users/list?pageSize=20&id=${users.id}&realname=${users.realname}&role=${users.role}">20</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
