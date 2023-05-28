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
        function markADR() {
            var suspiciousPatientId = $("input[name='suspiciousPatientId']").val();
            var patientId = $("input[name='patientId']").val();
            var ruleId = $("input[name='ruleId']").val();
            var state = $("input[name='markingState']:checked").val();
            if (state == undefined) {
                alert("请选择一个标记！");
            } else {
                $.ajax({
                    type: 'post',
                    url : 'suspiciousPatient/markADRState.do',
                    dataType: 'json',                               //  表示返回值的数据类型
                    contentType: 'application/json;charset=UTF-8',  //  内容类型
                    traditional: true, //使json格式的字符串不会被转码
                    data: JSON.stringify({suspiciousPatientId: suspiciousPatientId, state: state}),
                    success: function(data){
                        if (data.success) {
                            alert("标记成功");
                            var content;
                            if (state == "1") {
                                content = "<font color=\"#6fce6f\">已排除</font>";
                            } else if (state == "2") {
                                content = "<a href=\"javascript:void(0)\" onclick=\"markState('"+suspiciousPatientId+"', '2', '"+patientId+"', '"+ruleId+"')\"><font color=\"#ffc0cb\">不良反应</font></a>";
                            }
                            $("#"+suspiciousPatientId).html(content);
                            $("#markStateModal").modal('hide');
                        } else {
                            alert(data.message);
                        }
                    }
                });
            }
        }

    </script>
</head>

<body>

<!-- Modal -->
<div class="modal fade" id="markStateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>不良反应判别</b></h4>
            </div>

            <div class="modal-body">
                <div class="radio" style="margin-left: 20px;">
                    <input type="radio" name="markingState" value="1" />非药物不良反应
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="markingState" value="2" />药物不良反应
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" onclick="markADR()" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>

</body>
</html>

