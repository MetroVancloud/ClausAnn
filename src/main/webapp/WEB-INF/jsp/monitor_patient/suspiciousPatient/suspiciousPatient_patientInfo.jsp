<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/6/24
  Time: 下午 4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- 患者信息 --%>
<div id="patient_info" style="margin-bottom: 20px; text-align: right">

    <table width="100%" class="table table-condensed" style="font-size: 12px;margin-bottom:0;border-bottom: 1px solid #ddd;">
        <tr>
            <th>住 院 号:</th>
            <td>${patVisit.patientId}</td>
            <th>性　　别:</th>
            <td>${patVisit.patientSex}</td>
            <th>婚　　姻:</th>
            <td>
                <c:if test="${empty patVisit.maritalStatusName}">不详</c:if>
                <c:if test="${not empty patVisit.maritalStatusName}">${patVisit.maritalStatusName}</c:if>
            </td>
            <th>付费方式:</th>
            <td>
                <c:if test="${empty patVisit.chargeTypeName}">不详</c:if>
                <c:if test="${not empty patVisit.chargeTypeName}">${patVisit.chargeTypeName}</c:if>
            </td>
        <tr>
            <th>患者姓名:</th>
            <td>${patVisit.patientName}</td>
            <th>血　　型:</th>
            <td>
                <c:if test="${empty patVisit.bloodTypeName}">不详</c:if>
                <c:if test="${not empty patVisit.bloodTypeName}">${patVisit.bloodTypeName}</c:if>
            </td>
            <th>职　　业:</th>
            <td>
                <c:if test="${empty patVisit.occupationName}">不详</c:if>
                <c:if test="${not empty patVisit.occupationName}">${patVisit.occupationName}</c:if>
            </td>
            <th>医保类别:</th>
            <td>
                <c:if test="${empty patVisit.insuranceType}">不详</c:if>
                <c:if test="${not empty patVisit.insuranceType}">${patVisit.insuranceType}</c:if>
            </td>
        </tr>
        <tr>
            <th>入院日期:</th>
            <td>
                <c:if test="${not empty patVisit.admissionDateTime}">
                    <fmt:formatDate value="${patVisit.admissionDateTime}" pattern="yyyy-MM-dd"/>
                </c:if>
            </td>
            <th>入院科别:</th>
            <td>${patVisit.deptAdmissionToName}</td>
            <th>入院方式:</th>
            <td>
                <c:if test="${empty patVisit.patientClassName}">不详</c:if>
                <c:if test="${not empty patVisit.patientClassName}">${patVisit.patientClassName}</c:if>
            </td>
            <%--<th>入院病情:</th>
            <td>
                <c:if test="${empty patVisit.patAdmConditionName}">不详</c:if>
                <c:if test="${not empty patVisit.patAdmConditionName}">${patVisit.patAdmConditionName}</c:if>
            </td>--%>
            <th>入院诊断:</th>
            <td>
                <c:if test="${empty patVisit.admittedDiagnosis}">不详</c:if>
                <c:if test="${not empty patVisit.admittedDiagnosis}">${patVisit.admittedDiagnosis}</c:if>
            </td>
        </tr>
        <tr>
            <th>出院日期:</th>
            <td>
                <c:if test="${not empty patVisit.dischargeDateTime}">
                    <fmt:formatDate value="${patVisit.dischargeDateTime}" pattern="yyyy-MM-dd"/>
                </c:if>
            </td>
            <th>出院科别:</th>
            <td>
                <c:if test="${empty patVisit.deptDischargeFromName}">不详</c:if>
                <c:if test="${not empty patVisit.deptDischargeFromName}">${patVisit.deptDischargeFromName}</c:if>
            </td>
            <th>出院方式:</th>
            <td>
                <c:if test="${empty patVisit.dischargeDispositionName}">不详</c:if>
                <c:if test="${not empty patVisit.dischargeDispositionName}">${patVisit.dischargeDispositionName}</c:if>
            </td>
            <th>过敏药物:</th>
            <td>
                <c:if test="${empty patVisit.alergyDrugs}">不详</c:if>
                <c:if test="${not empty patVisit.alergyDrugs}">${patVisit.alergyDrugs}</c:if>
            </td>
        </tr>
        <tr>
            <th>接诊日期:</th>
            <td>
                <c:if test="${empty patVisit.consultingDate}">不详</c:if>
                <c:if test="${empty patVisit.consultingDate}">
                    <fmt:formatDate value="${entry.consultingDate}" pattern="yyyy-MM-dd"/>
                </c:if>
            </td>
            <th>门诊医师:</th>
            <td>
                <c:if test="${empty patVisit.consultingDoctorName}">不详</c:if>
                <c:if test="${not empty patVisit.consultingDoctorName}">${patVisit.consultingDoctorName}</c:if>
            </td>
            <th>办理住院:</th>
            <td>
                <c:if test="${empty patVisit.admittedByName}">无</c:if>
                <c:if test="${not empty patVisit.admittedByName}">${patVisit.admittedByName}</c:if>
            </td>
            <th>住院目的:</th>
            <td>
                <c:if test="${empty patVisit.admissionCauseName}">不详</c:if>
                <c:if test="${not empty patVisit.admissionCauseName}">${patVisit.admissionCauseName}</c:if>
            </td>
        </tr>
        <tr>
            <th>主治医生:</th>
            <td>
                <c:if test="${empty patVisit.attendingDoctorName}">不详</c:if>
                <c:if test="${not empty patVisit.attendingDoctorName}">${patVisit.attendingDoctorName}</c:if>
            </td>
            <th>科室主任:</th>
            <td>
                <c:if test="${empty patVisit.directorName}">不详</c:if>
                <c:if test="${not empty patVisit.directorName}">${patVisit.directorName}</c:if>
            </td>
            <th>经治医生:</th>
            <td>
                <c:if test="${empty patVisit.doctorInChargeName}">无</c:if>
                <c:if test="${not empty patVisit.doctorInChargeName}">${patVisit.doctorInChargeName}</c:if>
            </td>
            <th>RH血型:</th>
            <td>
                <c:if test="${empty patVisit.bloodTypeRh}">无</c:if>
                <c:if test="${not empty patVisit.bloodTypeRh}">${patVisit.bloodTypeRh}</c:if>
            </td>
        </tr>
        <tr>
            <th>联系人姓名:</th>
            <td>
                <c:if test="${empty patVisit.nextOfKin}">不详</c:if>
                <c:if test="${not empty patVisit.nextOfKin}">${patVisit.nextOfKin}</c:if>
            </td>
            <th>联系人关系:</th>
            <td>
                <c:if test="${empty patVisit.relationshipName}">不详</c:if>
                <c:if test="${not empty patVisit.relationshipName}">${patVisit.relationshipName}</c:if>
            </td>
            <th>联系人邮编:</th>
            <td>
                <c:if test="${empty patVisit.nextOfKinZipcode}">不详</c:if>
                <c:if test="${not empty patVisit.nextOfKinZipcode}">${patVisit.nextOfKinZipcode}</c:if>
            </td>
            <th>联系人电话:</th>
            <td>
                <c:if test="${empty patVisit.nextOfKinPhone}">不详</c:if>
                <c:if test="${not empty patVisit.nextOfKinPhone}">${patVisit.nextOfKinPhone}</c:if>
            </td>
        </tr>
        <tr>
            <th>出生日期:</th>
            <td>
                <c:if test="${empty patVisit.birthday}">不详</c:if>
                <c:if test="${not empty patVisit.birthday}">
                    <fmt:formatDate value="${patVisit.birthday}" pattern="yyyy-MM-dd" />
                </c:if>
            </td>
            <th>年    龄:</th>
            <td>${realPatientAge}</td>
            <th>身    高:</th>
            <td>
                <c:if test="${empty patVisit.bodyHeight}">不详</c:if>
                <c:if test="${not empty patVisit.bodyHeight}">${patVisit.bodyHeight}</c:if>
            </td>
            <th>体    重:</th>
            <td>
                <c:if test="${empty patVisit.bodyWeight}">不详</c:if>
                <c:if test="${not empty patVisit.bodyWeight}">${patVisit.bodyWeight}</c:if>
            </td>
        </tr>
        <%--<tr>
            <th>毒药医嘱:</th>
            <td><c:if test="${patVisit.ddrug gt 0}">是</c:if></td>
            <th>麻药医嘱:</th>
            <td><c:if test="${patVisit.mdrug gt 0}">是</c:if></td>
        </tr>--%>
        <tr>
            <th>联系人地址:</th>
            <td colspan="3">
                <c:if test="${empty patVisit.nextOfKinAddr}">不详</c:if>
                <c:if test="${not empty patVisit.nextOfKinAddr}">${patVisit.nextOfKinAddr}</c:if>
            </td>
        </tr>
        <tr>
            <th>工作单位:</th>
            <td colspan="7">
                <c:if test="${empty patVisit.serviceAgency}">不详</c:if>
                <c:if test="${not empty patVisit.serviceAgency}">${patVisit.serviceAgency}</c:if>
            </td>
        </tr>
        <tr>
            <th>通信地址:</th>
            <td colspan="7">
                <c:if test="${empty patVisit.mailingAddress}">不详</c:if>
                <c:if test="${not empty patVisit.mailingAddress}">${patVisit.mailingAddress}</c:if>
            </td>
        </tr>

    </table>

</div>

</body>
</html>
