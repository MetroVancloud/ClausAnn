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
<div class="modal fade" style="width: 1000px;margin: 0 auto" id="chooseAdrDescriptionTemplateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog_scroll" id="modal-dialog_report" style="width: 100%">
        <div class="modal-content modal-content_scroll" id="modal-content_report">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>选择不良反应描述模板</b></h4>
            </div>

            <div class="modal-body modal-body_scroll">
                <div class="form-group">
                    <label>不良反应描述</label>
                    <%--<div>
                        <input name="templateOrLis" type="radio" onchange="chooseTemplateOrLis(this)" checked="checked" value="template" />&nbsp;<label>选择模板</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input name="templateOrLis" type="radio" onchange="chooseTemplateOrLis(this)"  value="lis" />&nbsp;<label>选择LIS</label>
                    </div>--%>
                    <textarea id="chosenDescription" class="form-control" rows="4"></textarea>
                </div>
                <div id="adrDescriptionTemplateZone" style="display: block;"></div>
                <div id="lisSelectingZone" style="display: none;">
                    <div class="form-group" style="float: left;margin-right: 20px;">
                        <label style="font-size: 12px;margin-right: 5px;">日期范围</label>
                        <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                            <input type="text" name="lisStartDate" readonly="readonly"
                                   class="notFocus Wdate inTime longInput-in-radio-row endDate"
                                   onfocus="WdatePicker({maxDate:'%y-%M-%d', dateFmt:'yyyy-MM-dd'})"
                                   style="cursor: pointer;font-size: 12px;border-radius: 3px;width:110px;height: 34px;margin-top: 0px;padding-left: 5px;">
                        </label>
                        -
                        <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                            <input type="text" name="lisStopDate" readonly="readonly"
                                   class="notFocus Wdate inTime longInput-in-radio-row endDate"
                                   onfocus="WdatePicker({maxDate:'%y-%M-%d', dateFmt:'yyyy-MM-dd'})"
                                   style="cursor: pointer;font-size: 12px;border-radius: 3px;width:110px;height: 34px;margin-top: 0px;padding-left: 5px;">
                        </label>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel-body" style="padding: 0;">
                                <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>检验指标</th>
                                        <th>中文名称</th>
                                        <th>结果值</th>
                                        <th>正常标志</th>
                                        <th>单位</th>
                                        <th>大项名称</th>
                                        <th>报告时间</th>
                                        <th>参考值</th>
                                    </tr>
                                    </thead>
                                    <tbody id="chooseLisTableBody">

                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="modal-footer modal-footer_scroll">
                <button onclick="selectADRDescription2Table()" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                <button onclick="back2Report()" type="button" class="btn btn-default" data-dismiss="modal">返回</button>
            </div>
        </div>
    </div>
</div>

<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>

</body>
</html>

