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
<%--
    <script src="resources/js/jquery.js"></script>
--%>
    <script>
    </script>
</head>

<body>

<!-- Modal -->
<div class="modal fade" id="chooseOperationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>选择操作</b></h4>
            </div>

            <div class="modal-body">
                <p style="text-align: center">
                    <button type="button" id="reportButton" onclick="toGenerateReportPage()" class="btn btn-warning">填写不良反应报告</button>
                    <button type="button" id="adviceButton" class="btn btn-info">发起用药建议</button>
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

