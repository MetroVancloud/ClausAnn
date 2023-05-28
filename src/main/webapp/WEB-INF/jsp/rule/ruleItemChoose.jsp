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
<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>选择指标</b></h4>
            </div>

            <div class="modal-body">
                <p style="text-align: center" id="modalContentId">
                </p>
            </div>

            <div class="modal-footer">
                <button type="button" onclick="returnChooseType()" class="btn btn-primary" data-dismiss="modal">返回</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>

</body>
</html>

