<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/6/24
  Time: 下午 4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- 患者用药医嘱列表 --%>
<div id="orders_info" style="display: none;margin-bottom: 20px;">
    <div class="row">
        <label style="float: left;margin-left: 27px;margin-top: 7px;font-size: 12px;">药品名称：</label>
        <input type="text" name="orders.drugName" value="" style="float: left;border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;" />
        <label style="float: left;margin-left: 20px;margin-top: 7px;font-size: 12px;">选择日期范围：</label>
        <input type="text" name="orders.minDate" onchange="StrDateCompEndDate(this)" readonly="readonly"
               class="notFocus Wdate inTime longInput-in-radio-row beginDate"
               onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"
               style="border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;"
               value="">
        -
        <input type="text" name="orders.maxDate" readonly="readonly"
               class="notFocus Wdate inTime longInput-in-radio-row endDate"
               onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" onchange="StrDateCompEndDate(this)"
               style="border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;"
               value="">

        <button style="padding: 0;text-align: center;height: 30px;font-size: 12px;width: 50px;margin-left: 63px;vertical-align: top;" type="button" onclick="selectOrdersInDisplay()" class="btn btn-primary">搜索</button>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body" style="padding: 0;">
                <table width="100%;" class="table-striped table-bordered table-hover relatedLisTable">
                    <thead>
                    <tr>
                        <th class="operateTd"></th>
                        <th>医嘱号</th>
                        <%--<th style="width: 5%;">医嘱类别</th>--%>
                        <%--<th></th>--%>
                        <th style="width: 15%;">医嘱名称</th>
                        <%--<th></th>--%>
                        <th style="width: 15%;">厂商</th>
                        <th>医嘱分类</th>
                        <th>开始时间</th>
                        <th>停止时间</th>
                        <th>用法</th>
                        <th>用量</th>
                        <th>备注</th>
                        <th>频次</th>
                        <th>医生</th>
                        <th>科室</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody id="ordersTable">
                    <c:forEach items="${ordersList}" var="entry" varStatus="idxStatus">
                        <c:choose>
                            <c:when test="${idxStatus.index % 2 eq 0}" >
                                <tr style="background-color: rgb(220, 237, 245);">
                            </c:when>
                            <c:otherwise>
                                <tr>
                            </c:otherwise>
                        </c:choose>
                        <td>${idxStatus.index + 1}</td></td>
                        <td>${entry.orderNo}</td>
<%--
                        <td style="width: 5%;">${entry.categoryName}</td>
--%>
                        <%--<td class="left-kh">|</td>--%>
                        <td style="width: 15%;">${entry.drugName}</td>
                        <%--<td class="right-kh">|</td>--%>
                        <td style="width: 15%;">${entry.manufacturer}</td>
                        <td>
                            <c:if test="${entry.repeatIndicator eq '1'}">长期</c:if>
                            <c:if test="${entry.repeatIndicator ne '1'}">临时</c:if>
                        <td><fmt:formatDate value="${entry.startDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><fmt:formatDate value="${entry.stopDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${entry.administrationName}</td>
                        <td>${entry.dosage}${entry.dosageUnitsName}</td>
                        <td>${entry.freqDetail}</td>
                        <td>${entry.frequencyName}</td>
                        <td>${entry.doctorName}</td>
                        <td>${entry.orderingDeptName}</td>
                        <td>${entry.orderStatusName}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>
