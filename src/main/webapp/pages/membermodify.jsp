<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/21
  Time: 19:41
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
<form method="post" action="${pageContext.request.contextPath}/member/save" name="ThisForm">
  <input id="id" name="id" value="${member.id}" hidden/>
  <div id="contentWrap">
    <!--表格控件 -->
    <div id="widget table-widget">
      <div class="pageTitle">会员修改</div>
      <div class="pageColumn">
        <div class="pageButton"></div>
        <table>
          <thead>
          <th width="">姓名</th>
          <th width=""><input type="text" id="name" name="name" value="${member.name}"/></th>
          </thead>
          <thead>
          <th width="">身份证</th>
          <th width=""><input type="text" id="credit" name="credit" value="${member.credit}"/></th>
          </thead>
          <thead>
          <th width="">电话</th>
          <th width=""><input type="text" id="tel" name="tel" value="${member.tel}"/></th>
          </thead>
          <thead hidden>
          <th width="">余额</th>
          <th width=""><input type="text" id="balance" name="balance" value="${member.balance}"/></th>
          </thead>
          </thead>
          <thead>
          <th colspan="2"><input type="submit" value="确定"/> </th>
          </thead>
        </table>
      </div>
    </div><!-- #widget -->
  </div>
</form>
</body>
</html>
