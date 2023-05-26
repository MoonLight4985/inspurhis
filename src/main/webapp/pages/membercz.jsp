<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/19
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <script type="text/javascript">
        function back(){
            history.go(-1);
        }
        function add(){
            var moneys =document.getElementById("moneys").value;
            if(moneys==null||moneys==''){
                alert("请输入");
            }else{
                if(!isNaN(moneys)){
                    document.ThisForm.submit();
                } else {
                    alert("不是数字");
                }
            }
        }
    </script>
    <style type="text/css">
        body {
            background:#FFF
        }
    </style>
</head>

<body>
<form method="post" action="${pageContext.request.contextPath}/member/saveIncrease" method="post" name="ThisForm">
    <input  type="hidden" id="id" name="id" value=""/>
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">会员充值</div>
            <div class="pageInfo">
                <table>
                    <tr>
                        <td width="10%" align="right">充值额</td>
                        <td width="20%"><input type="text" id="moneys" name="money" /></td>
                        <td width="10%" align="right">充值方式</td>
                        <td width="50%">
                            <select id="rechargeMethod" name="rechargeMethod" >
                                <option value="0">请选择</option>
                                <option value="现金">现金</option>
                                <option value="刷卡">刷卡</option>
                                <option value="扫码支付">扫码支付</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center"><input type="button" value="确定" onclick="add()"/> </td>
                    </tr>
                </table>
            </div>
        </div><!-- #widget -->
    </div>
</form>
</body>
</html>
