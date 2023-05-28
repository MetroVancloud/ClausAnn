<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/9/10
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="resources/js/My97DatePicker/WdatePicker.js"></script>
    <script src="resources/CustomJS/suspiciousPatient.js"></script>

</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body" style="padding: 0;">
                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">报告日期</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input type="text" name="reportCondition.reportStartDate" readonly="readonly" value="${reportCondition.reportStartDate}"
                               class="notFocus Wdate inTime longInput-in-radio-row endDate"
                               onfocus="WdatePicker({maxDate:'%y-%M-%d', dateFmt:'yyyy-MM-dd'})"
                               style="cursor: pointer;font-size: 12px;border-radius: 3px;width:110px;height: 34px;margin-top: 0px;padding-left: 5px;">
                    </label>
                    -
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input type="text" name="reportCondition.reportStopDate" readonly="readonly" value="${reportCondition.reportStopDate}"
                               class="notFocus Wdate inTime longInput-in-radio-row endDate"
                               onfocus="WdatePicker({maxDate:'%y-%M-%d', dateFmt:'yyyy-MM-dd'})"
                               style="cursor: pointer;font-size: 12px;border-radius: 3px;width:110px;height: 34px;margin-top: 0px;padding-left: 5px;">
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">报告类型</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <select style="font-size: 12px;" class="form-control" name="reportCondition.reportTypeNew">
                            <option value="">全部</option>
                            <option value="新的">新的</option>
                            <option value="已知">已知</option>
                        </select>
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">严重程度</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <select style="font-size: 12px;" class="form-control" name="reportCondition.reportTypeSerious">
                            <option value="">全部</option>
                            <option value="一般">一般</option>
                            <option value="严重">严重</option>
                        </select>
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">不良反应名称</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input name="reportCondition.adrName" class="form-control" value="${reportCondition.adrName}">
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">不良反应结果</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <select style="font-size: 12px;" class="form-control" name="reportCondition.adrResult">
                            <option value="">全部</option>
                            <option value="痊愈">痊愈</option>
                            <option value="好转">好转</option>
                            <option value="未好转">未好转</option>
                            <option value="不祥">不祥</option>
                            <option value="有后遗症">有后遗症</option>
                            <option value="死亡">死亡</option>
                        </select>
                    </label>
                </div>

               <%-- <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">字段：</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <select style="font-size: 12px;" class="form-control" name="reportCondition.adrResult">
                            <option value="">请选择字段</option>
                            <option value="">患者姓名</option>
                            <option value="好转">好转</option>
                            <option value="未好转">未好转</option>
                            <option value="不祥">不祥</option>
                            <option value="有后遗症">有后遗症</option>
                            <option value="死亡">死亡</option>
                        </select>
                    </label>
                </div>--%>

                <div class="form-group" style="float: right;">
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <button onclick="searchReport()" type="button" class="btn btn-primary">搜索</button>
                    </label>
                </div>

            </div>
        </div>
    </div>

</body>

<script>
    $(document).ready(function () {
        var reportTypeNew = '${reportCondition.reportTypeNew}';
        $("select[name='reportCondition.reportTypeNew']").val(reportTypeNew);

        var reportTypeSerious = '${reportCondition.reportTypeSerious}';
        $("select[name='reportCondition.reportTypeSerious']").val(reportTypeSerious);

        var adrResult = '${reportCondition.adrResult}';
        $("select[name='reportCondition.adrResult']").val(adrResult);
    });
</script>
</html>
