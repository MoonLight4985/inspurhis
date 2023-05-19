<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/18
  Time: 16:16
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
<form action="${pageContext.request.contextPath}/depart/save" method="post" name="ThisForm">
  <div id="contentWrap">
    <!--表格控件 -->
    <div id="widget table-widget">
      <div class="pageTitle">科室添加</div>
      <div class="pageInfo">
        <table>
          <tr>
            <td width="20%" align="right">科室ID</td>
            <td width="20%"><input type="text" id="names" name="id" value="${depart.id}"/></td>
            <td width="10%" align="right">科室名称</td>
            <td width="50%"><input type="text" id="moneys" name="name" value="${depart.name}"/></td>
          </tr>
          <tr>
            <td colspan="4" align="center"><input type="submit" value="确定" /></td>
          </tr>
        </table>
      </div>
    </div><!-- #widget -->
  </div>

</form>
</body>
</html>
