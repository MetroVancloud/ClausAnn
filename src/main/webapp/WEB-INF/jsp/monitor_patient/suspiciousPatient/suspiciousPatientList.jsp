<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="resources/CustomCSS/commonCSS.css" rel="stylesheet">
    <script src="resources/CustomJS/suspiciousPatient.js"></script>
    <script src="resources/CustomJS/common.js"></script>
    <script>

        $(document).ready(function() {
            setLeftMenuBar('monitorPatientLink', 'suspiciousPatientLink');
        });
    </script>

</head>
<body>
    <input name="contextPath" value="<%=request.getContextPath()%>" />
    <input type="hidden" name="suspiciousPatientId" value="" />
    <input type="hidden" name="suspiciousPatient_monitorDate" value="" />
    <input type="hidden" name="patientId" value="" />
    <input type="hidden" name="ruleId" value="" />
    <div id="page-wrapper">
        <%@include file="../../common/contentTitle.jsp"%>
        <form id="searchForm">
            <%@include file="suspiciousPatient_search.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-body" style="padding: 0;">
                        <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>处理状态</th>
                                    <th>规则名称</th>
                                    <th>住院号</th>
                                    <th>患者姓名</th>
                                    <th>性别</th>
                                    <th>科室</th>
                                    <th>病区</th>
                                    <th>入院日期</th>
                                    <th>出院日期</th>
                                    <th>主管医生</th>
                                    <th>诊断</th>
                                    <th>监测日期</th>
                                </tr>
                            </thead>
                            <tbody id="suspiciousPatientListBody">
                            <c:forEach items="${suspiciousPatientList}" var="entry">
                                <tr>
                                    <td id="${entry.id}">
                                        <c:choose>
                                            <c:when test="${'0' eq entry.state}">
                                                <a href="javascript:void(0)" onclick="markState('${entry.id}', '${entry.state}', '${entry.patientId}', '${entry.ruleId}', '${entry.monitorDate}')"><font color="#d8b36a">机器判定</font></a>
                                            </c:when>
                                            <c:when test="${'1' eq entry.state}">
                                                <font color="#6fce6f">已排除</font>
                                            </c:when>
                                            <c:when test="${'2' eq entry.state or '3' eq entry.state or '4' eq entry.state or '5' eq entry.state}">
                                                <a href="javascript:void(0)" onclick="markState('${entry.id}', '${entry.state}', '${entry.patientId}',  '${entry.ruleId}', '${entry.monitorDate}')"><font color="#ffc0cb">不良反应</font></a>
                                            </c:when>
                                            <c:when test="${'6' eq entry.state}">
                                                <font color="red">已上报</font>
                                            </c:when>
                                            <c:otherwise>${entry.state}</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${entry.ruleName}</td>
                                    <td><a href="javascript:void(0)" onclick="toPatientDetail('<%=request.getContextPath()%>', '${entry.patientId}', '${entry.ruleId}', '${entry.monitorDate}')">${entry.patientId}</a></td>
                                    <td>${entry.patientName}</td>
                                    <td>${entry.patientSex}</td>
                                    <td>${entry.deptName}</td>
                                    <td>${entry.wardName}</td>
                                    <td><fmt:formatDate value="${entry.admissionDateTime}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatDate value="${entry.dischargeDateTime}" pattern="yyyy-MM-dd"/> </td>
                                    <td>${entry.attendingDoctorName}</td>
                                    <td>${entry.diagnosis}</td>
                                    <%--<td><fmt:formatDate value="${entry.monitorDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>--%>
                                    <td>${entry.monitorDate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <%@include file="../../common/pagination.jsp"%>

        </form>
    </div>
    <%@include file="markState.jsp"%>
    <%@include file="chooseOperation.jsp"%>
    <%@include file="generateReport.jsp"%>
    <%@include file="chooseOrders.jsp"%>
    <%@include file="chooseAdrDescriptionTemplate.jsp"%>
</body>

<script>
    function fillTable(list, pageUtil) {
        var content = "";
        var contextPath = $("input[name='contextPath']").val();
        for (var i = 0; i < list.length; i++) {
            var stateStr = "";
            if ('0' == list[i].state) {
                stateStr = "<a href='javascript:void(0)' onclick=\"markState('"+list[i].id+"', '"+list[i].state+"', '"+list[i].patientId+"', '"+list[i].ruleId+"')\"><font color='#d8b36a'>机器判定</font></a>";
            } else if ('1' == list[i].state) {
                stateStr = "<font color=\"#6fce6f\">已排除</font>";
            } else if ('2' == list[i].state || '3' == list[i].state || '4' == list[i].state || '5' == list[i].state) {
                stateStr = "<a href='javascript:void(0)' onclick=\"markState('"+list[i].id+"', '"+list[i].state+"', '"+list[i].patientId+"', '"+list[i].ruleId+"')\"><font color='#ffc0cb'>不良反应</font></a>";
            } else if ('6' == list[i].state) {
                stateStr = "<font color=\"red\">已上报</font>";
            } else {
                stateStr = "";
            }
            var admissionDateTime = new Date(list[i].admissionDateTime).format("yyyy-MM-dd");
            var dischargeDateTime = new Date(list[i].dischargeDateTime).format("yyyy-MM-dd");
            content += "" +
                "<tr>\n" +
                "    <td id='"+ list[i].id+"'>" + stateStr + "</td>" +
                "    <td>"+replaceNull(list[i].ruleName)+"</td>\n" +
                "    <td><a href=\"javascript:void(0)\" onclick=\"toPatientDetail('"+contextPath+"', '"+list[i].patientId+"', '"+list[i].ruleId+"', '"+list[i].monitorDate+"')\">"+list[i].patientId+"</a></td>\n" +
                "    <td>"+replaceNull(list[i].patientName)+"</td>\n" +
                "    <td>"+replaceNull(list[i].patientSex)+"</td>\n" +
                "    <td>"+replaceNull(list[i].deptName)+"</td>\n" +
                "    <td>"+replaceNull(list[i].wardName)+"</td>\n" +
                "    <td>"+ admissionDateTime + "</td>\n" +
                "    <td>"+ dischargeDateTime + "</td>\n" +
                "    <td>"+replaceNull(list[i].attendingDoctorName)+"</td>\n" +
                "    <td>"+replaceNull(list[i].diagnosis)+"</td>\n" +
                "    <td>"+replaceNull(list[i].monitorDate)+"</td>\n" +
                "</tr>";
        }

        $("#suspiciousPatientListBody").html(content)
    }
</script>


</html>
