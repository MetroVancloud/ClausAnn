<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/6/24
  Time: 下午 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--- LIS检验信息 --%>
<div id="lis_info" style="display: none;margin-bottom: 20px">
    <div class="row">
        <label style="float: left;margin-left: 27px;margin-top: 7px;font-size: 12px;">项目名称：</label>
        <input type="text" name="lis.itemName" value="" style="float: left;border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;" />
        <label style="float: left;margin-left: 20px;margin-top: 7px;font-size: 12px;">选择日期范围：</label>
        <input type="text" name="lis.minDate" onchange="StrDateCompEndDate(this)" readonly="readonly"
               class="notFocus Wdate inTime longInput-in-radio-row beginDate"
               onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"
               style="border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;"
               value="">
        -
        <input type="text" name="lis.maxDate" readonly="readonly"
               class="notFocus Wdate inTime longInput-in-radio-row endDate"
               onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" onchange="StrDateCompEndDate(this)"
               style="border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;"
               value="">

        <button style="padding: 0;text-align: center;height: 30px;font-size: 12px;width: 50px;margin-left: 63px;vertical-align: top;" type="button" onclick="selectLisInDisplay()" class="btn btn-primary">搜索</button>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body" style="padding: 0;">
                <table width="100%;" class="table-striped table-bordered table-hover relatedLisTable">
                    <thead>
                    <tr>
                        <th></th>
                        <c:if test="${fn:indexOf(ruleName, '体温') eq -1}">
                            <th>检验指标</th>
                            <th>中文名称</th>
                            <th>结果值</th>
                            <th>正常标志</th>
                            <th>单位</th>
                            <th>大项名称</th>
                            <th>报告时间</th>
                            <th>参考值</th>
                        </c:if>
                        <c:if test="${fn:indexOf(ruleName, '体温') ne -1}">
                            <th>指标名称</th>
                            <th>结果值</th>
                            <th>单位</th>
                            <th>测量时间</th>
                        </c:if>

                    </tr>
                    </thead>
                    <tbody id="lisTable">
                    <c:forEach items="${lisList}" var="entry" varStatus="idxStatus">
                        <c:set var="fontColor" value="#000" />
                        <c:if test="${'l' eq entry.abnormalIndicator or 'h' eq entry.abnormalIndicator}">
                            <c:set var="fontColor" value="red" />
                        </c:if>
                        <c:set var="backgroundColor" value="#fff" />
                        <c:if test="${idxStatus.index % 2 eq 0}">
                            <c:set var="backgroundColor" value="rgb(220, 237, 245)" />
                        </c:if>

                        <tr style="background-color: ${backgroundColor};color: ${fontColor};">
                            <td>${idxStatus.index + 1}</td>
                            <c:if test="${fn:indexOf(ruleName, '体温') eq -1}">
                                <td>${entry.itemCode}</td>
                                <td>${entry.itemName}</td>
                                <td>${entry.result}</td>
                                <td>${entry.abnormalIndicator}</td>
                                <td>${entry.itemUnit}</td>
                                <td>${entry.lisGroupName}</td>
                                <td><fmt:formatDate value="${entry.lisTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${entry.referenceRange}</td>
                            </c:if>

                            <c:if test="${fn:indexOf(ruleName, '体温') ne -1}">
                                <td>${entry.itemName}</td>
                                <td>${entry.result}</td>
                                <td>${entry.itemUnit}</td>
                                <td><fmt:formatDate value="${entry.lisTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </c:if>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%--<div style="margin-top: 5px;margin-bottom: 5px">
        <div style="width: 12%;float: left;margin-left: 2%;overflow: auto;overflow: auto;max-height: 400px">
            <table class="table table-condensed table-bordered" id="timeMenu">
                <thead>
                <tr>
                    <th style="color: red">请选择时间</th>
                </tr>
                </thead>
                <tbody>
                </tbody>

            </table>
        </div>

        <div style="width: 17%;float: left;margin-left: 2%;overflow: auto;overflow: auto;max-height: 400px">
            <table class="table table-condensed table-bordered" id="bigMenu">
                <thead>
                <tr>
                    <th style="color: red">大项目录</th>
                </tr>
                </thead>
                <tbody>
                </tbody>

            </table>
        </div>

        <div style="width: 65%;float: right;overflow: auto;max-height: 400px">
            <table class="table table-condensed table-bordered" id="lisResults">
                <tr>
                    <th style="text-align: center">检验分组</th>
                    <th style="text-align: center">检验项目</th>
                    <th style="text-align: center">检验结果</th>
                    <th style="text-align: center">检验时间</th>
                    <th style="text-align: center">正常标志</th>
                    <th style="text-align: center">参考值</th>
                </tr>
                <tbody id="lis_result">
                </tbody>
            </table>
        </div>
    </div>
    <div id="containerLisResult" style="width: 800px;height: 400px;margin: 8px auto;display: none;clear: both"></div>--%>
</div>

</body>
</html>
