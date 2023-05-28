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

        <%@include file="../../common/contentTitle.jsp"%>
        <form id="searchForm">
            <%@include file="userList_search.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-body" style="padding: 0;">
                        <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>用户ID</th>
                                    <th>用户姓名</th>
                                    <th>科室</th>
                                    <th>权限</th>
                                    <th>职业</th>
                                    <th>电话</th>
                                    <th>邮箱</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                            <c:forEach items="${usersList}" var="entry" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td><a href="javascript:void(0)" onclick="openSavedDetail('${entry.userId}')">${entry.userId}</a></td>
                                    <td>${entry.userName}</td>
                                    <td>${entry.deptName}</td>
                                    <td>${entry.roleName}</td>
                                    <td>${entry.occupation}</td>
                                    <td>${entry.telephoneNumber}</td>
                                    <td>${entry.email}</td>
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
