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
            setLeftMenuBar('userManageLink', 'roleListLink');
        });
    </script>
</head>
<body>
    <div id="page-wrapper">
        <%@include file="../../common/contentTitle.jsp"%>
        <form id="searchForm">
            <%@include file="roleList_search.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-body" style="padding: 0;">
                        <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>角色名称</th>
                                    <th>角色管理的模块</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                            <c:forEach items="${roleList}" var="entry" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td><a href="javascript:void(0)" onclick="openSavedDetail('${entry.id}')">${entry.roleName}</a></td>
                                    <td>${entry.rightList}</td>
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
    <%@include file="roleDetail.jsp"%>

</body>

<script>
    function fillTable(list, pageUtil) {
        var content = "";
        for (var i = 0; i < list.length; i++) {
            content += "" +
                "<tr>\n" +
                "    <td>"+ (Number(pageUtil.startNum) + i)+"</td>\n" +
                "    <td><a href=\"javascript:void(0)\" onclick=\"openSavedDetail('"+list[i].id+"')\">"+list[i].roleName+"</a></td>\n" +
                "    <td>"+list[i].rightList+"</td>\n" +
                "</tr>";
        }
        $("#tbody").html(content)
    }
</script>

</html>
