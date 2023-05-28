<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/6/24
  Time: 下午 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--- 监测信息 --%>
<div id="monitor_info" style="display: none;margin-bottom: 20px">
    <div>
        <div class="sub_title_bar">
            <span>*&nbsp;患者简要信息</span>
        </div>
        <table width="100%" class="table table-condensed" style="font-size: 12px;margin-bottom:0;border-bottom: 1px solid #ddd;">
            <tr>
                <th>床 位 号:</th>
                <td>暂缺</td>
                <th>患者姓名:</th>
                <td>${patVisit.patientName}</td>
                <th>性　　别:</th>
                <td>${patVisit.patientSex}</td>
                <th>年    龄:</th>
                <td>${realPatientAge}</td>
            <tr>
                <th>住 院 号:</th>
                <td>${patVisit.patientId}</td>
                <th>主治医生:</th>
                <td>
                    <c:if test="${empty patVisit.attendingDoctorName}">不详</c:if>
                    <c:if test="${not empty patVisit.attendingDoctorName}">${patVisit.attendingDoctorName}</c:if>
                </td>
                <th>入院科别:</th>
                <td>${patVisit.deptAdmissionToName}</td>
                <th>病    区:</th>
                <td>暂缺</td>
            </tr>
            <tr>
                <th>入院诊断:</th>
                <td>
                    <c:if test="${empty patVisit.admittedDiagnosis}">不详</c:if>
                    <c:if test="${not empty patVisit.admittedDiagnosis}">${patVisit.admittedDiagnosis}</c:if>
                </td>
                <th>入院日期:</th>
                <td colspan="5">
                    <c:if test="${not empty patVisit.admissionDateTime}">
                        <fmt:formatDate value="${patVisit.admissionDateTime}" pattern="yyyy-MM-dd"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>

    <c:if test="${fn:length(itemDTOMap) gt 0}">
    <div>
        <div class="sub_title_bar">
            <span>*&nbsp;${ruleName}-<font color="#5cb85c">区间型指标</font>相关检验结果-
                <c:forEach var="entry" items="${itemDTOMap}">
                    <font style="color: #bb8e67; font-weight: initial;">${entry.value.ruleItem.itemName}(${entry.value.ruleItem.itemCode}): ${entry.value.zone}; </font>
                </c:forEach>
            </span>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel-body" style="padding: 0;">
                    <table width="100%;" class="table-striped table-bordered table-hover relatedLisTable">
                        <thead>
                        <tr>
                            <th class="operateTd"></th>
                            <c:if test="${fn:indexOf(ruleName, '体温') eq -1}">
                                <th>指标代码</th>
                                <th>指标名称</th>
                                <th>结果值</th>
                                <th>规则设定值</th>
                                <th>单位</th>
                                <th>取样时间</th>
                            </c:if>

                            <c:if test="${fn:indexOf(ruleName, '体温') ne -1}">
                                <th>指标名称</th>
                                <th>结果值</th>
                                <th>规则设定值</th>
                                <th>单位</th>
                                <th>测量时间</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${relatedLisList}" var="entry" varStatus="idxStatus">
                            <c:if test="${idxStatus.index % 2 eq 0}">
                                <tr style="background-color: rgb(220, 237, 245);">
                            </c:if>
                            <c:if test="${idxStatus.index % 2 ne 0}" >
                                <tr>
                            </c:if>
                                <td class="operateTd">${idxStatus.index + 1}</td>
                                <c:if test="${fn:indexOf(ruleName, '体温') eq -1}">
                                    <td>${entry.itemCode}</td>
                                    <td>${entry.itemName}</td>
                                    <td>${entry.result}</td>
                                    <td>${entry.referenceRange}</td>
                                    <td>${entry.itemUnit}</td>
                                    <td><fmt:formatDate value="${entry.lisTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                </c:if>

                                <c:if test="${fn:indexOf(ruleName, '体温') ne -1}">
                                    <td>${entry.itemName}</td>
                                    <td>${entry.result}</td>
                                    <td>${entry.referenceRange}</td>
                                    <td>${entry.itemUnit}</td>
                                    <td><fmt:formatDate value="${entry.lisTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                </c:if>


                            </tr>
                        </c:forEach>
                        <c:if test="${null ne alpLis}">
                            <tr>
                                <td class="operateTd"></td>
                                <td>${alpLis.itemCode}</td>
                                <td>${alpLis.itemName}</td>
                                <td>${alpLis.result}</td>
                                <td>${alpLis.referenceRange}</td>
                                <td>${alpLis.itemUnit}</td>
                                <td><fmt:formatDate value="${alpLis.lisTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                        </c:if>
                        <c:if test="${null ne rLis}">
                            <tr>
                                <td class="operateTd"></td>
                                <td>${rLis.itemCode}</td>
                                <td colspan="2">${rLis.result}</td>
                                <td colspan="3">${rLis.itemName}</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </c:if>

    <c:if test="${fn:length(itemDiffDTOMap) gt 0}">
        <div>
            <div class="sub_title_bar">
            <span>*&nbsp;${ruleName}-<font color="#5bc0de">差值型指标</font>相关检验结果-
                <c:forEach var="entry" items="${itemDiffDTOMap}">
                    <font style="color: #bb8e67; font-weight: initial;">${entry.value.ruleItem.itemName}(${entry.value.ruleItem.itemCode}): ${entry.value.zone}; </font>
                </c:forEach>
            </span>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-body" style="padding: 0;">
                        <table width="100%;" class="table-striped table-bordered table-hover relatedLisTable">
                            <thead>
                            <tr>
                                <th class="operateTd"></th>
                                <th>检验指标</th>
                                <th>中文名称</th>
                                <th>近两次检验结果值</th>
                                <th>规则设定值</th>
                                <th>单位</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${relatedItemDiffLisMap}" var="entry" varStatus="idxStatus">
                                <tr>
                                    <td class="operateTd">${idxStatus.index + 1}</td>
                                    <td>${entry.value[0].itemCode}</td>
                                    <td>${entry.value[0].itemName}</td>
                                    <td>
                                        ${entry.value[0].result}(<fmt:formatDate value="${entry.value[0].lisTime}" pattern="yyyy-MM-dd HH:mm:ss"/>)
                                        &nbsp;&nbsp;
                                        ${entry.value[1].result}(<fmt:formatDate value="${entry.value[1].lisTime}" pattern="yyyy-MM-dd HH:mm:ss"/>)
                                    </td>
                                    <td>${entry.value[0].referenceRange}</td>
                                    <td>${entry.value[0].itemUnit}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${fn:length(bodySignDTOMap) gt 0}">
    <div>
        <div class="sub_title_bar">
            <span>*&nbsp;${ruleName}-<font color="#d58512">体征指标</font>相关结果-
                <c:forEach var="entry" items="${bodySignDTOMap}">
                    <font style="color: #bb8e67; font-weight: initial;">${entry.value.ruleBodySign.signName}: ${entry.value.zone}; </font>
                </c:forEach>
            </span>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel-body" style="padding: 0;">
                    <table width="100%;" class="table-striped table-bordered table-hover relatedLisTable">
                        <thead>
                        <tr>
                            <th class="operateTd"></th>
                            <th>体征名称</th>
                            <th>测量值</th>
                            <th>规则设定值</th>
                            <th>单位</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${bodySignResultDTOList}" var="entry" varStatus="idxStatus">
                            <tr>
                                <td class="operateTd">${idxStatus.index + 1}</td>
                                <td>${entry.signName}</td>
                                <td>${entry.signValue}</td>
                                <td>${entry.signRange}</td>
                                <td>${entry.signUnit}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </c:if>

    <div>
        <div class="sub_title_bar">
            <span>*&nbsp;相关医嘱数据</span>
        </div>

        <div class="row">
            <label style="float: left;margin-left: 27px;margin-top: 7px;font-size: 12px;">药品名称：</label>
            <input type="text" name="relatedOrders.drugName" value="" style="border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;" />

            <button style="padding: 0;text-align: center;height: 30px;font-size: 12px;width: 50px;margin-left: 63px;vertical-align: top;" type="button" onclick="selectRelatedOrdersInDisplay()" class="btn btn-primary">搜索</button>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel-body" style="padding: 0;">
                    <table width="100%;" class="table-striped table-bordered table-hover relatedLisTable">
                        <thead>
                        <tr>
                            <th class="operateTd"></th>
                            <th>医嘱号</th>
                            <%--<th></th>--%>
                            <th style="width: 15%;">医嘱名称</th>
                            <%--<th></th>--%>
                            <th style="width: 15%;">厂商</th>
                            <%--<th>医嘱分类</th>--%>
                            <th style="width: 5%;">医嘱类别</th>
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
                        <tbody id="relatedOrdersTable">
                        <c:forEach items="${relatedOrdersList}" var="entry" varStatus="idxStatus">
                            <c:choose>
                                <c:when test="${idxStatus.index % 2 eq 0}" >
                                    <tr style="background-color: rgb(220, 237, 245);">
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                </c:otherwise>
                            </c:choose>
                            <td class="operateTd">${idxStatus.index + 1}</td>
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
</div>

</body>
</html>
