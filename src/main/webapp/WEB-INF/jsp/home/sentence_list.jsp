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
            setLeftMenuBar('userManageLink', 'userListLink');
        });
    </script>
</head>
<body>
    <input type="hidden" name="suspiciousPatientId" value="" />
    <input type="hidden" name="patientId" value="" />
    <div id="page-wrapper">
        <form id="searchForm">
            <%@include file="sentecen_list_search.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-body" style="padding: 0;">
                        <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>数据集</th>
                                    <th>数据子集</th>
                                    <th>文档ID</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                            <c:forEach items="${sentenceList}" var="entry" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${entry.dataset}</td>
                                    <td>${entry.subDataset}</td>
                                    <td>${entry.documentId}</td>
                                    <td>${entry.sentenceId}</td>
                                    <td><a href="javascript:void(0)" onclick="openClauseSegmentationPage('${entry.userId}')">${entry.userId}</a>标注</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
            <%@include file="../common/pagination.jsp"%>

        </form>

    </div>
    <%@include file="userDetail.jsp"%>

</body>

<script>
    function fillTable(list, pageUtil) {
        var content = "";
        for (var i = 0; i < list.length; i++) {
            content += "" +
                "<tr>\n" +
                "    <td>"+ (Number(pageUtil.startNum) + i)+"</td>\n" +
                "    <td><a href=\"javascript:void(0)\" onclick=\"openSavedDetail('"+list[i].userId+"')\">"+list[i].userId+"</a></td>\n" +
                "    <td>"+list[i].userName+"</td>\n" +
                "    <td>"+replaceNull(list[i].deptName)+"</td>\n" +
                "    <td>"+replaceNull(list[i].roleName)+"</td>\n" +
                "    <td>"+replaceNull(list[i].occupation)+"</td>\n" +
                "    <td>"+replaceNull(list[i].telephoneNumber)+"</td>\n" +
                "    <td>"+replaceNull(list[i].email)+"</td>\n" +
                "</tr>";
        }
        $("#tbody").html(content)
    }
</script>

</html>
