<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/4/22
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="resources/CustomCSS/suspiciousPatient.css" rel="stylesheet">
    <link href="resources/CustomCSS/commonCSS.css" rel="stylesheet">
</head>
<body>
<div class="mainDiv">
    <input type="hidden" name="patientId" value="${patVisit.patientId}" />
    <input type="hidden" name="ruleDrugNames" value="${ruleDrugCodes}" />
    <input type="hidden" name="ruleId" value="${ruleId}" />
    <h4 style="margin-bottom: 20px;" class="text-center">疑似不良反应患者信息（${ruleName}）</h4>

    <%-- 菜单列表 --%>
    <div id="menuBar">
        <table class="table table-bordered" style="margin-bottom: 0px;">
            <tbody>
                <tr>
                    <td id="patInfo" onclick="selectCategory(1, this)" class="selected">
                        <a href="javascript:void(0)" style="text-decoration: none">患者信息</a>
                    </td>
                    <td onclick="selectCategory(2, this)">
                        <a href="javascript:void(0)" style="text-decoration: none">监测结果</a>
                    </td>
                    <td onclick="selectCategory(3, this)">
                        <a href="javascript:void(0)" style="text-decoration: none">指标数据</a>
                    </td>
                    <td onclick="selectCategory(4, this)">
                        <a href="javascript:void(0)" style="text-decoration: none">医嘱数据</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <%@include file="suspiciousPatient_patientInfo.jsp"%>

    <%@include file="suspiciousPatient_monitorInfo.jsp"%>

    <%@include file="suspiciousPatient_lisInfo.jsp"%>

    <%@include file="suspiciousPatient_ordersInfo.jsp"%>

    <%@include file="suspiciousPatient_lisGraph.jsp"%>


</div>
</body>
<script src="resources/CustomJS/suspiciousPatient.js"></script>
</html>
