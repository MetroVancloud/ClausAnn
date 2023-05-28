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
<div class="modal fade" style="width: 1000px;margin: 0 auto" id="chooseOrdersModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog_scroll" id="modal-dialog_report" style="width: 100%">
        <div class="modal-content modal-content_scroll" id="modal-content_report">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>选择医嘱</b></h4>
            </div>

            <!-- 当前弹出的是怀疑药品（1）/并用药品选择（2） -->
            <input type="hidden" name="flag" value="">

            <div class="modal-body modal-body_scroll">
                <table class="table table-condensed reportTable">
                    <tr>
                        <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">医嘱号：</th>
                        <td style="vertical-align: middle;height: 44px;text-align: left;">
                            <input type="text" style="width: 150px;" class="form-control" name="ordersNo_condition" value="" />
                        </td>
                        <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">药品名称：</th>
                        <td style="vertical-align: middle;height: 44px;">
                            <input type="text" style="width: 150px;" class="form-control" name="drugName_condition" value="" />
                        </td>
                        <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">药品输入码：</th>
                        <td style="vertical-align: middle;height: 44px;">
                            <input type="text" style="width: 150px;" class="form-control" name="inputCode_condition" value="" />
                        </td>

                        <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;"></th>
                        <td style="float: right;vertical-align: middle;height: 44px;">
                            <button type="button" onclick="searchOrders()" class="btn btn-success">搜索</button>
                        </td>
                    </tr>
                </table>

                <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover">                                <thead>
                    <thead>
                        <tr>
                            <th><input type="checkbox" onchange="selectAllOrders(this)"></th>
                            <th>医嘱号</th>
                            <th style="width: 15%;">医嘱名称</th>
                            <th style="width: 15%;">厂商</th>
                            <th>开始时间</th>
                            <th>停止时间</th>
                            <th style="width: 60px;">用法</th>
                            <th>剂量</th>
                            <th style="width: 40px;">单位</th>
                            <th>备注</th>
                            <th>频次</th>
                            <th style="width: 40px;">状态</th>
                        </tr>
                    </thead>
                    <tbody id="chooseOrdersTBody">
                    </tbody>
                </table>
            </div>

            <div class="modal-footer modal-footer_scroll">
                <button onclick="selectDrug2Table()" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                <button onclick="back2Report()" type="button" class="btn btn-default" data-dismiss="modal">返回</button>
            </div>
        </div>
    </div>
</div>

<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>

</body>
</html>

