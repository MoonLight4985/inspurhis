<%--
  Created by IntelliJ IDEA.
  User: MoonLight
  Date: 2023/5/21
  Time: 14:29
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
<form method="post" action="${pageContext.request.contextPath}/prescribe/save" name="ThisForm">
    <input type="hidden" id="yzid" name="yzid" value=""/>
    <div id="contentWrap">
        <!--表格控件 -->
        <div id="widget table-widget">
            <div class="pageTitle">医生诊断药品添加</div>
            <div class="pageInfo">
                <table>
                    <tr>
                        <td width="10%" align="right">registerOrderId</td>
                        <td width="50%"><input type="text" id="registerOrderId" name="registerOrderId" value="${registerOrderId}"/></td>
                        <td width="10%" align="right">doctorAdviceId</td>
                        <td width="50%"><input type="text" id="doctorAdviceId" name="doctorAdviceId" value="${doctorAdviceId}"/></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">药品</td>
                        <td width="20%" ><select id="medicineId" name="medicineId">
                            <option value="123456">皮炎平</option>
                            <option value="123456">皮炎平</option>
                            <option value="123456">皮炎平</option>
                        </select></td>
                        <td width="10%" align="right">数量</td>
                        <td width="50%"><input type="text" id="number" name="number" /></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">描述</td>
                        <td width="80%" colspan="3"><textarea rows="5"  id="description"
                                                              name="description" style="width:99%"></textarea></td>
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
