<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/18
  Time: 9:04
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
<form method="post" action="${pageContext.request.contextPath}/medicine/save" method="post" name="ThisForm">
  <div id="contentWrap">
    <!--表格控件 -->
    <div id="widget table-widget">
      <div class="pageTitle">药品添加</div>
      <div class="pageInfo">
        <table>
          <tr>
            <td width="20%" align="right">药品ID</td>
            <td width="20%"><input type="text" id="drugsid" name="id" /></td>
            <td width="10%" align="right"></td>
            <td width="50%"></td>
          </tr>
          <tr>
            <td width="20%" align="right">药品名</td>
            <td width="20%"><input type="text" id="name" name="name" /></td>
            <td width="10%" align="right">进价</td>
            <td width="50%"><input type="text" id="purchaseprice" name="purchasePrice" /></td>
          </tr>
          <tr>
            <td width="20%" align="right">售价</td>
            <td width="20%"><input type="text" id="price" name="price" /></td>
            <td width="10%" align="right">库存数量</td>
            <td width="50%"><input type="text" id="num" name="number" /></td>
          </tr>
          <tr>
            <td width="20%" align="right">生产厂商</td>
            <td width="20%"><input type="text" id="productunit" name="productUnit" /></td>
            <td width="10%" align="right">生产日期</td>
            <td width="50%"><input type="date" id="productdate" name="productDate" onClick="SelectDate(this.name)"/></td>
          </tr>
          <tr>
            <td width="20%" align="right">保质期</td>
            <td width="20%"><input type="date" id="qualityperiod" name="qualityPeriod" onClick="SelectDate(this.name)"/></td>
            <td width="10%" align="right">经销商</td>
            <td width="50%"><input type="text" id="supplyunit" name="supplyUnit" /></td>
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
