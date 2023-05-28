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
                <form id="statisticForm" action="/statistics/getSimpleReportStatistic.do" method="post">
                    <input type="hidden" name="groupByType" value="${reportCondition.groupByType}">
                    <div class="form-group" style="float: left;margin-right: 20px;">
                        <label style="font-size: 12px;margin-right: 5px;">报告日期</label>
                        <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                            <input type="text" name="reportStartDate" readonly="readonly" value="${reportCondition.reportStartDate}"
                                   class="notFocus Wdate inTime longInput-in-radio-row endDate"
                                   onfocus="WdatePicker({maxDate:'%y-%M-%d', dateFmt:'yyyy-MM-dd'})"
                                   style="cursor: pointer;font-size: 12px;border-radius: 3px;width:110px;height: 34px;margin-top: 0px;padding-left: 5px;">
                        </label>
                        -
                        <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                            <input type="text" name="reportStopDate" readonly="readonly" value="${reportCondition.reportStopDate}"
                                   class="notFocus Wdate inTime longInput-in-radio-row endDate"
                                   onfocus="WdatePicker({maxDate:'%y-%M-%d', dateFmt:'yyyy-MM-dd'})"
                                   style="cursor: pointer;font-size: 12px;border-radius: 3px;width:110px;height: 34px;margin-top: 0px;padding-left: 5px;">
                        </label>
                    </div>
                    <div class="form-group" style="float: right;">
                        <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                            <input <%--onclick="getSimpleReportStatistic()"--%> type="submit" class="btn btn-primary">
                        </label>
                    </div>
                </form>
            </div>


        </div>
    </div>

</body>

<script>
    function getSimpleReportStatistic() {
       /* var reportStartDate = $("input[name='reportCondition.reportStartDate']").val();
        var reportStopDate = $("input[name='reportCondition.reportStopDate']").val();
        var groupByType = $("input[name='groupByType']");*/

        //$("#statisticForm").submit();
        var form = document.getElementById('statisticForm');

        form.submit();
    }
</script>
</html>
