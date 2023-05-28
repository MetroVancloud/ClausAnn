<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/4/22
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
<div>
    <div class="sub_title_bar">
        <a href="javascript:void(0)" onclick="displaySwitch(this)">收起</a>
        &nbsp;
        <span>*&nbsp;关联药品（药品总数：<b id="drugCount" style="color: #bb8e67;">${drugDTOList.size()}</b>）</span>
        <a href="javascript:void(0)" onclick="addDrug(this)" style="float: right; margin-right: 8px;">增加</a>
        <%--<a href="javascript:void(0)" onclick="addDrug()" style="float: right; margin-right: 16px;">增加</a>--%>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body" style="padding: 0;">
                <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <%--<th>序号</th>--%>
                        <th>代码</th>
                        <th>名称</th>
                        <th>规格</th>
                        <%--<th>剂型</th>
                        <th>最小剂量</th>
                        <th>剂量单位</th>--%>
                        <th>生产厂家</th>
                        <th class="operateTd">操作</th>
                    </tr>
                    </thead>
                    <tbody id="ruleDrugTable">
                    <c:forEach items="${drugDTOList}" var="entry" varStatus="idxStatus">
                        <tr>
                            <%--<td>${idxStatus.index + 1}</td>--%>
                            <td>${entry.drugCode}</td>
                            <td>${entry.drugName}</td>
                            <td>${entry.drugSpec}</td>
                            <%--<td>${entry.drugForm}</td>
                            <td>${entry.dosePerUnit}</td>
                            <td>${entry.dosageUnit}</td>--%>
                            <td>${entry.drugProducer}</td>
                            <td class="operateTd"><a href="javascript:void(0)" onclick="deleteDrug(this)">删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<%@include file="../common/drugSelectModal.jsp"%>

</body>
</html>
