<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/19
  Time: 17:31
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
    <script type="text/javascript" src="../js/rl.js"></script>
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
<form action="${pageContext.request.contextPath}/registerorder/save" method="post" name="ThisForm">
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">挂号添加</div>
            <div class="pageInfo">
                <table>
                    <tr>
                        <td width="20%" align="right">会员</td>
                        <td width="20%"><select id="memberId" name="memberId">
                            <option value="0">请选择</option>
                            <c:forEach items="${memberList}" var="member">
                                <option value="${member.id}">${member.name}</option>
                            </c:forEach>
                        </select></td>
                        <td width="10%" align="right">科室</td>
                        <td width="48%" ><select id="ks" name="departId">
                            <option value="0">请选择</option>
                            <c:forEach items="${departList}" var="depart">
                                <option value="${depart.id}">${depart.name}</option>
                            </c:forEach>
                        </select></td>
                        <td width="2%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">医生</td>
                        <td width="48%" ><select id="userid" name="doctorId">
                            <option value="0">请选择</option>
                            <c:forEach items="${doctorList}" var="doctor">
                                <option value="${doctor.id}">${doctor.name}</option>
                            </c:forEach>
                        </select></td>
                        <td width="20%" align="right">挂号费用</td>
                        <td width="20%"><input type="text" name="price" id="ghcost" value="6"/></td>
                        <td width="2%">元</td>
                    </tr>
                    <tr>
                        <td width="10%" align="right">挂号时间</td>
                        <td width="48%" ><input type="date" name="roTime" id="ghtime""/></td>
                        <td width=""></td>
                        <td width=""></td>
                        <td width=""></td>
                    </tr>
                    <tr>
                        <td colspan="5" align="center"><input type="submit" value="确定" /></td>
                    </tr>
                </table>
            </div>
        </div><!-- #widget -->
    </div>
</form>
</body>
</html>
