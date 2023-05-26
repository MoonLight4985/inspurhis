<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/21
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>无标题文档</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript" src="../js/rl.js"></script>
  <script type="text/javascript">
    function ypff(id){
      window.location.href="${pageContext.request.contextPath}/prescribe/sendMedicineById?id=" + id;
    }
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
<div id="contentWrap">
  <!--表格控件 -->
  <div id="widget table-widget">
    <div class="pageTitle">药品发放</div>
    <div class="querybody">
      <ul class="seachform">
        <li><label>挂号号</label><input name="" type="text" class="scinput" /></li>
        <li><label>会员ID</label><input name="" type="text" class="scinput" /></li>
        <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
      </ul>
    </div>
    <div class="pageColumn">
      <div class="pageButton"><span>待发放药品列表</span></div>
      <table>
        <thead>
        <th width="">挂号号</th>
        <th width="">会员ID</th>
        <th width="">药品</th>
        <th width="">诊断人</th>
        <th width="">诊断时间</th>
        <th width="10%">发放药品</th>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="prescribe">
          <tr>
            <td>${prescribe.registerOrderId}</td>
            <td>
                <c:forEach items="${memberList}" var="member">
                  <c:if test="${prescribe.memberId == member.id}">${member.name}</c:if>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${sessionScope.medicineList}" var="medicine">
                  <c:if test="${prescribe.medicineId == medicine.id}">${medicine.name}</c:if>
                </c:forEach>
            </td>
            <td>
              <c:forEach items="${sessionScope.doctorList}" var="doctor">
                <c:if test="${prescribe.doctorId == doctor.id}">${doctor.name}</c:if>
              </c:forEach>
            </td>
            <td>${prescribe.createTime}</td>
            <td><a onclick="ypff(${prescribe.id})"><img src="../images/icon/edit2.png" width="16" height="16" /></a></td>
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
                  href="${pageContext.request.contextPath}/prescribe/sendList?pageNum=${pageInfo.isFirstPage?1:pageInfo.prePage}&pageSize=${pageInfo.pageSize}&registerOrderId=${prescribe.registerOrderId}">«</a>
          </li>
          <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
            <li class="${pageInfo.pageNum==nav?'active':''}"><a
                    href="${pageContext.request.contextPath}/prescribe/sendList?pageNum=${nav}&pageSize=${pageInfo.pageSize}&registerOrderId=${prescribe.registerOrderId}">${nav}</a>
            </li>
          </c:forEach>


          <li>
            <a href="${pageContext.request.contextPath}/prescribe/sendList?pageNum=${pageInfo.isLastPage?pageInfo.pages:pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&registerOrderId=${prescribe.registerOrderId}">»</a>
          </li>
        </ul>
        <ul>
          <li><span>(${pageInfo.startRow}-${pageInfo.endRow}/${pageInfo.total})</span></li>
          <li><span>显示条数&nbsp;:${pageInfo.size}</span></li>
        </ul>
        <ul>
          <li class="${pageInfo.pageSize==5?'active':''}"><a
                  href="${pageContext.request.contextPath}/prescribe/sendList?pageSize=5&registerOrderId=${prescribe.registerOrderId}">5</a>
          </li>
          <li class="${pageInfo.pageSize==10 ?'active':''}"><a
                  href="${pageContext.request.contextPath}/prescribe/sendList?pageSize=10&registerOrderId=${prescribe.registerOrderId}">10</a>
          </li>
          <li class="${pageInfo.pageSize==15 ?'active':''}"><a
                  href="${pageContext.request.contextPath}/prescribe/sendList?pageSize=15&registerOrderId=${prescribe.registerOrderId}">15</a>
          </li>
          <li class="${pageInfo.pageSize==20 ?'active':''}"><a
                  href="${pageContext.request.contextPath}/prescribe/sendList?pageSize=20&registerOrderId=${prescribe.registerOrderId}">20</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</body>
</html>
