<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/19
  Time: 14:25
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
<form method="post" action="${pageContext.request.contextPath}/member/save" method="post" name="ThisForm">
  <div id="contentWrap">
    <!--表格控件 -->
    <div id="widget table-widget">
      <div class="pageTitle">会员添加</div>
      <div class="pageInfo">
        <table>
          <tr hidden>
            <td width="20%" align="right">会员ID</td>
            <td width="20%"><input type="text" id="id" name="id" value="${member.id}"/></td>
          </tr>
          <tr>
            <td width="20%" align="right">会员名称</td>
            <td width="20%"><input type="text" id="name" name="name" value="${member.name}"/></td>
            <td width="20%" align="right">会员密码</td>
            <td width="20%"><input type="password" id="password" name="password" value="${member.password}"/></td>
          </tr>
          <tr>
            <td width="10%" align="right">身份证</td>
            <td width="50%"><input type="text" id="credit" name="credit" value="${member.credit}"/></td>

            <td width="20%" align="right">电话</td>
            <td width="50%"><input type="text" id="tel" name="tel" value="${member.tel}"/></td>
          </tr>
          <c:if test="${member == null}">
            <tr>
              <td width="10%" align="right">充值金额</td><!-- 编辑时卡余额不能修改 -->
              <td width="50%"><input type="text" id="moneys" name="balance"/></td>

              <td width="10%" align="right">充值方式</td>
              <td width="50%">
                <select id="type" name="type" >
                  <option value="0">请选择</option>
                  <option value="1">现金</option>
                  <option value="2">刷卡</option>
                  <option value="3">扫码支付</option>
                </select>
              </td>
            </tr>
          </c:if>
          <tr>
            <td width="20%" align="right">年龄</td>
            <td width="20%"><input type="text" id="age" name="age" value="${member.age}"/></td>

            <td width="10%" align="right">性别</td>
            <td width="50%"><input type="text" id="sex" name="sex" value="${member.sex}"/></td>
          </tr>
          <tr>
            <td width="20%" align="right">过敏史</td>
            <td width="20%"><input type="text" id="anaphylaxis" name="anaphylaxis" value="${member.anaphylaxis}"/></td>
            <td></td>
            <td></td>
          </tr>
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
