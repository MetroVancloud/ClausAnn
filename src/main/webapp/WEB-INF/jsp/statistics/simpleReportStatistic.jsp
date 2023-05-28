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
            var groupByType = '${reportCondition.groupByType}';
            setLeftMenuBar('monitorStatisticLink', "statistic_" + groupByType + "Link");
        });
    </script>
</head>
<body>
    <input type="hidden" name="suspiciousPatientId" value="" />
    <div id="page-wrapper">

        <%@include file="../common/contentTitle.jsp"%>
        <form id="searchForm">
            <%@include file="simpleReportStatistic_search.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-body" style="padding: 0;">
                        <table style="width: 800px; margin: 0 auto;font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>${reportCondition.groupByTypeStr}</th>
                                    <th>数量</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                            <c:forEach items="${list}" var="entry">
                                <tr>
                                    <td>${entry.itemName}</td>
                                    <td>${entry.reportNum}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </form>

    </div>

</body>

</html>
