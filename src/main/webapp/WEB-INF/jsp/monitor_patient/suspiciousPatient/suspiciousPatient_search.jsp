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
                    <label style="font-size: 12px;margin-right: 5px;">监测日期</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input type="text" name="suspiciousPatientCondition.monitorStartDate" readonly="readonly" value="${suspiciousPatientCondition.monitorStartDate}"
                               class="notFocus Wdate inTime longInput-in-radio-row endDate"
                               onfocus="WdatePicker({maxDate:'%y-%M-%d', dateFmt:'yyyy-MM-dd'})"
                               style="cursor: pointer;font-size: 12px;border-radius: 3px;width:110px;height: 34px;margin-top: 0px;padding-left: 5px;">
                    </label>
                    -
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input type="text" name="suspiciousPatientCondition.monitorStopDate" readonly="readonly" value="${suspiciousPatientCondition.monitorStopDate}"
                               class="notFocus Wdate inTime longInput-in-radio-row endDate"
                               onfocus="WdatePicker({maxDate:'%y-%M-%d', dateFmt:'yyyy-MM-dd'})"
                               style="cursor: pointer;font-size: 12px;border-radius: 3px;width:110px;height: 34px;margin-top: 0px;padding-left: 5px;">
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">住院号</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input name="suspiciousPatientCondition.patientId" class="form-control" value="${suspiciousPatientCondition.patientId}">
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">患者姓名</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input name="suspiciousPatientCondition.patientName" class="form-control" value="${suspiciousPatientCondition.patientName}">
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">科室名称</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input name="suspiciousPatientCondition.deptName" class="form-control" value="${suspiciousPatientCondition.deptName}">
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">处理状态</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <select style="font-size: 12px;" class="form-control" name="suspiciousPatientCondition.state">
                            <option value="">不限</option>
                            <option value="0">机器判定</option>
                            <option value="1">已排除</option>
                            <option value="2">不良反应</option>
                        </select>
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">监测主题</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <select style="font-size: 12px;" class="form-control" name="suspiciousPatientCondition.ruleId">
                            <option value="0">不限</option>
                            <option value="1">肝主题</option>
                            <option value="2">肾主题</option>
                            <option value="11">低体温</option>
                            <option value="12">高体温</option>
                            <option value="110">多监测指标主题</option>
                        </select>
                    </label>
                </div>

                <div class="form-group" style="float: right;">
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <button onclick="searchSuspiciousPatientList()" type="button" class="btn btn-primary">搜索</button>
                    </label>
                </div>

            </div>
        </div>
    </div>

</body>

    <script>
        $(document).ready(function () {
           var state = '${suspiciousPatientCondition.state}';
           $("select[name='suspiciousPatientCondition.state']").val(state);

            var ruleId = '${suspiciousPatientCondition.ruleId}';
            $("select[name='suspiciousPatientCondition.ruleId']").val(ruleId);
        });
    </script>
</html>
