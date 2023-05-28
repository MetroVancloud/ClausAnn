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
    <script src="resources/js/My97DatePicker/WdatePicker.js"></script>

    <script>


    </script>
</head>

<body>

<!-- Modal -->
<div class="modal fade" style="width: 600px;height: 400px;margin: 0 auto" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog_scroll" style="width: 100%">
        <div class="modal-content modal-content_scroll">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>编辑角色权限</b></h4>
            </div>

            <div class="modal-body modal-body_scroll" id="" style="overflow-y: scroll; ">
                <div style="margin-bottom: 20px; text-align: right">
                    <form id="submitForm" action="" method="post">
                        <table class="table table-condensed reportTable">
                            <input type="hidden" name="role.id" value="">

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">角色名称：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" style="width: 200px" class="form-control" name="role.roleName" value="" />
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">模块权限：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input type="checkbox" name="role.rightList" value="1">监测患者&nbsp;&nbsp;
                                    <input type="checkbox" name="role.rightList" value="2">监测主题&nbsp;&nbsp;
                                    <input type="checkbox" name="role.rightList" value="3">监测统计&nbsp;&nbsp;
                                    <input type="checkbox" name="role.rightList" value="4">用户管理
                                </td>
                            </tr>

                        </table>


                    </form>
                </div>
            </div>



            <div class="modal-footer modal-footer_scroll">
                <button style="float: right;margin-left: 10px;" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button style="float: right;margin-left: 10px;" type="button" id="saveButton" class="btn btn-success" onclick="saveDetail()" >保存</button>
                <button style="float: right;margin-left: 10px;" type="button" id="modifyButton" class="btn btn-primary" onclick="modifyDetail()">修改</button>
                <%--<button style="float: right;margin-left: 10px;" type="button" id="exportReportButton" class="btn btn-warning" onclick="modifyReport()">导出</button>--%>
            </div>
        </div>
    </div>
</div>

<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
</body>
</html>

