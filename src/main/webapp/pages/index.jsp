<%--
  Created by IntelliJ IDEA.
  User: qiwenyong
  Date: 2023/5/15
  Time: 14:25
  To change this template use File | Settings | File Templates.
  isELIgnored设置EL表达式生效
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>社区医疗管理系统</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            //setMenuHeight
            $("#modifyPassword").click(function () {
                $("#showModify").dialog({
                    title: '修改密码',
                    width: 430,
                    height: 230,
                    buttons: {
                        "确定": function () {
                        },
                        "取消": function () {
                            $(this).dialog('close');
                        }
                    }
                });
            });
            $('.menu').height($(window).height() - 51 - 27 - 26 - 5);
            $('.sidebar').height($(window).height() - 51 - 27 - 26 - 5);
            $('.page').height($(window).height() - 51 - 27 - 26 - 5);
            $('.page iframe').width($(window).width() - 15 - 168);
            //menu on and off
            $('.btn').click(function () {
                $('.menu').toggle();

                if ($(".menu").is(":hidden")) {
                    $('.page iframe').width($(window).width() - 15 + 5);
                } else {
                    $('.page iframe').width($(window).width() - 15 - 168);
                }
            });

            $('.subMenu a[href="#"]').click(function () {
                $(this).next('ul').toggle();
                return false;
            });
        });

    </script>
</head>
<body style="overflow-y:hidden">
<div id="wrap">
    <div id="header">
        <div class="logo fleft"></div>
        <div class="topright">
            <ul>
                <li><span><img src="${pageContext.request.contextPath}/images/index-logout.png" class="helpimg"
                               height="16" width="16"/></span><a href="${pageContext.request.contextPath}/logout">注销</a></li>
                <li><span><img src="${pageContext.request.contextPath}/images/t07.png" class="helpimg" height="16"
                               width="16"/></span><a href="userpwdupdate.html">修改密码</a></li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="subnav">
            <div class="subnavLeft fleft"></div>
            <div class="fleft"></div>
            <div class="subnavRight fright"></div>
        </div>
    </div><!--#header -->
    <div id="content">
        <div class="space"></div>
        <div class="menu fleft">
            <ul>
                <li class="subMenuTitle">菜单</li>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/users/list" target="right">用户管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/medicine/list" target="right">药品信息管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/doctor/list" target="right">医生管理</a></li>
                    <li><a href="ypfflist.html" target="right">药品发放</a></li>
                    <li><a href="${pageContext.request.contextPath}/depart/list" target="right">科室管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/member/list" target="right">会员管理</a></li>
                    <!-- 挂号人员独有 -->
                    <li><a href="${pageContext.request.contextPath}/pages/yyghadd.jsp" target="right">预约挂号</a></li>
                    <li><a href="${pageContext.request.contextPath}/registerorder/list" target="right">挂号管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/doctorduty/list" target="right">医生值班管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/doctorAdvice/list" target="right">医生诊断管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/" target="right">费用结算</a></li>
                    <li><a href="${pageContext.request.contextPath}/payment/list" target="right">缴费明细查询</a></li>
                    <li><a href="${pageContext.request.contextPath}/costSettleDetail/list" target="right">费用结算明细查询</a></li>
                    <!--                   <li><a href="myyszblist.html" target="right">医生值班</a></li> -->
                    <!--                    <li><a href="myyzlist.html" target="right">医生诊断</a></li> -->
                </ul>
            </ul>
        </div>
        <div class="sidebar fleft">
            <div class="btn"></div>
        </div>
        <div class="page">
            <iframe width="100%" scrolling="auto" height="100%" frameborder="false" allowtransparency="true"
                    style="border: medium none;" src="${pageContext.request.contextPath}/pages/main.jsp" id="rightMain"
                    name="right"></iframe>
        </div>
    </div><!--#content -->
    <div class="clear"></div>
    <div id="footer">CopyRight &copy; 2017-2018</div><!--#footer -->
</div><!--#wrap -->
</body>
</html>
