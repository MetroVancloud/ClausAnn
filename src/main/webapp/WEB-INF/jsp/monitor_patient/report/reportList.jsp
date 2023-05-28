<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/9/8
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="resources/CustomCSS/commonCSS.css" rel="stylesheet">
    <script>
        $(document).ready(function() {
            setLeftMenuBar('monitorStatisticLink', 'reportLink');
        });
    </script>
</head>
<body>
    <input type="hidden" name="suspiciousPatientId" value="" />
    <input type="hidden" name="patientId" value="" />
    <div id="page-wrapper">

        <%@include file="../../common/contentTitle.jsp"%>
        <form id="searchForm">
            <%@include file="reportList_search.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-body" style="padding: 0;">
                        <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>编码</th>
                                    <th>患者姓名</th>
                                    <th>报告类型</th>
                                    <th>不良反应名称</th>
                                    <th>结果</th>
                                    <th>报告日期</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                            <c:forEach items="${reportList}" var="entry" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td><a href="javascript:void(0)" onclick="openSavedReportInReportList('${entry.patientId}', '${entry.suspiciousPatientId}')">${entry.reportCode}</a></td>
                                    <td>${entry.patientName}</td>
                                    <td>${entry.reportTypeNew}，${entry.reportTypeSerious}</td>
                                    <td>${entry.adrName}</td>
                                    <td>${entry.adrResult}</td>
                                    <td>${entry.reportDate}</td>
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
    <%@include file="../suspiciousPatient/generateReport.jsp"%>
    <%@include file="../suspiciousPatient/chooseOrders.jsp"%>
    <%@include file="../suspiciousPatient/chooseAdrDescriptionTemplate.jsp"%>

</body>

<script>
    function fillTable(list, pageUtil) {
        var content = "";
        for (var i = 0; i < list.length; i++) {
            content += "" +
                "<tr>\n" +
                "    <td>"+ (Number(pageUtil.startNum) + i)+"</td>\n" +
                "    <td><a href=\"javascript:void(0)\" onclick=\"openSavedReportInReportList('"+list[i].patientId+"', '"+list[i].suspiciousPatientId+"')\">"+list[i].reportCode+"</a></td>\n" +
                "    <td>"+list[i].patientName+"</td>\n" +
                "    <td>"+list[i].reportType+"</td>\n" +
                "    <td>"+list[i].adrName+"</td>\n" +
                "    <td>"+list[i].adrResult+"</td>\n" +
                "    <td>"+list[i].reportDate+"</td>\n" +
                "</tr>";
        }
        $("#tbody").html(content)
    }
</script>

</html>
