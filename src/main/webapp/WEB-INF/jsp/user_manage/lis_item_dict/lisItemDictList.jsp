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
            setLeftMenuBar('userManageLink', 'lisItemDictListLink');
        });
    </script>
</head>
<body>
    <div id="page-wrapper">
        <%@include file="../../common/contentTitle.jsp"%>
        <form id="searchForm">
            <%@include file="lisItemDictList_search.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-body" style="padding: 0;">
                        <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>是否可用于建立规则</th>
                                    <th>检验项目名称</th>
                                    <th>检验项目代码</th>
                                    <th>检验项目单位</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                            <c:forEach items="${list}" var="entry" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>
                                        <c:if test="${entry.enable eq '0'}">
                                            <input type="checkbox" onchange="updateEnableState(this, '${entry.itemName}')" />
                                        </c:if>
                                        <c:if test="${entry.enable eq '1'}">
                                            <input type="checkbox" onchange="updateEnableState(this, '${entry.itemName}')" checked="checked"/>
                                        </c:if>
                                    </td>
                                    <td>${entry.itemName}</td>
                                    <td>${entry.itemCode}</td>
                                    <td>${entry.itemUnit}</td>
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
    <%@include file="lisItemDictList_search.jsp"%>

</body>

<script>
    function fillTable(list, pageUtil) {
        var content = "";
        for (var i = 0; i < list.length; i++) {
            content += "" +
                "<tr>\n" +
                "    <td>"+ (Number(pageUtil.startNum) + i)+"</td>\n";
            if (list[i].enable == "0") {
                content += "" +
                    "<td><input type=\"checkbox\" onchange=\"updateEnableState(this, '"+list[i].itemName+"')\" /></td>";
            } else {
                content += "" +
                    "<td><input type=\"checkbox\" onchange=\"updateEnableState(this, '"+list[i].itemName+"')\" checked=\"checked\"/></td>";
            }
            content +=
                "    <td>"+list[i].itemName+"</td>\n" +
                "    <td>"+list[i].itemCode+"</td>\n" +
                "    <td>"+list[i].itemUnit+"</td>\n" +
                "</tr>";
        }
        $("#tbody").html(content)
    }
</script>

</html>
