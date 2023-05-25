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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $('tbody tr:odd').addClass("trLight");

            $(".select-all").click(function(){
                if($(this).attr("checked")){
                    $(".checkBox input[type=checkbox]").each(function(){
                        $(this).attr("checked", true);
                    });
                }else{
                    $(".checkBox input[type=checkbox]").each(function(){
                        $(this).attr("checked", false);
                    });
                }
            });
        });
    </script>
    <style type="text/css">
        body {
            background:#FFF
        }
    </style>
</head>

<body>
<form action="${pageContext.request.contextPath}/doctorAdvice/save" method="post" name="ThisForm">
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">医生诊断添加</div>
            <div class="pageInfo">
                <table>
                    <tr>
                        <td width="20%" align="right">会员</td>
                        <td width="20%"><select id="memberId" name="memberId" >
                            <option value="0">-请选择-</option>
                            <c:forEach items="${memberList}" var="member">
                                <option value="${member.id}">${member.name}</option>
                            </c:forEach>
                        </select>
                        </td>
                        <td width="10%" align="right">挂号号</td>
                        <td width="50%">
                            <select name="registerOrderId" id="registerOrderId">
                                <option value="">-请选择-</option>
                                <c:forEach items="${sessionScope.OrderList}" var="order">
                                    <option value="${order.id}">
                                            ${order.id} -
                                        <c:forEach items="${sessionScope.memberList}" var="member">
                                            <c:if test="${order.memberId == member.id}">${member.name}</c:if>
                                        </c:forEach>
                                    </option>
                                </c:forEach>
                            </select>
                    </tr>
                    <tr>
                        <td width="20%" align="right">诊断</td>
                        <td width="80" colspan="3" >
                            <textarea rows="5" cols="12" id="prescription" name="prescription" style="width:99%"></textarea></td>
                    </tr>
<%--                    <tr>--%>
<%--                        <td width="20%" align="right">处方</td>--%>
<%--                        <td colspan="3" >--%>
<%--                            <textarea rows="5" cols="12" id="yf" name="yf" style="width:99%"></textarea></td>--%>
<%--                    </tr>--%>
                    <tr>
                        <td colspan="4" align="center"><input type="submit" value="确定"/> </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</form>
</body>
</html>
