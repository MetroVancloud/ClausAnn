<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/6/14
  Time: 下午 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="resources/js/jquery.js"></script>
</head>

<body>

<!-- Modal -->
<div class="modal fade" id="ruleTypeChooseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>选择指标类型</b></h4>
            </div>

            <div class="modal-body">
                <p style="text-align: center">
                    <button type="button" onclick="chooseRuleType('1')" class="btn btn-success">区间型指标</button>
                    <button type="button" onclick="chooseRuleType('2')" class="btn btn-info">差值型指标</button>
                    <button type="button" onclick="chooseRuleType('3')" class="btn btn-warning">体征型指标</button>
                </p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>

</body>
</html>

