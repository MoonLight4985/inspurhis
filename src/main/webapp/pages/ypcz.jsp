<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/18
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
<form action="${pageContext.request.contextPath}/medicine/saveIncrease" method="post" name="ThisForm">
    <input id="id" name="id" value="${czMedicine.id}" hidden/>
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">药品库存新增</div>
            <div class="pageColumn">
                <div class="pageInfo">
                    <table>
                        <tr>
                            <td width="">新增数量</td>
                            <td width=""><input type="text" id="num" name="num" /></td>
                            <td><input type="submit" value="确定"/> </td>
                        </tr>
                    </table>
                </div>
            </div><!-- #widget -->
        </div>
    </div>
</form>
</body>
</html>
