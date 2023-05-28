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
<style>
    .lisDrugFilterInput {
        font-size: 12px;
        width: 200px;
        float: left;
        margin-right: 10px;
    }
    .lisDrugFilterInputDelete {
        float: left;
        color: #d9534f;
        font-size: 16px;
        margin-top: 9px;
        margin-right: 20px;
        cursor: pointer;
        display: none;
    }
</style>
<div>
    <div class="sub_title_bar">
        <a href="javascript:void(0)" onclick="displaySwitch(this)">收起</a>
        &nbsp;
        <span>*&nbsp;过滤药品关键字（总数：<b id="lisDrugFilterCount" style="color: #bb8e67;">${lisDrugFilterSet.size()}</b>）</span>
        <a href="javascript:void(0)" onclick="saveLisDrugFilter()" style="float: right; margin-right: 8px;">保存</a>
        <a href="javascript:void(0)" onclick="addLisDrugFilter(this)" style="float: right; margin-right: 16px;">增加</a>
        <a href="javascript:void(0)" onclick="editLisDrugFilter(this)" style="float: right; margin-right: 16px;">编辑</a>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body" style="padding: 0;">
                <div id="lisDrugFilterZone">
                    <c:forEach items="${lisDrugFilterSet}" var="entry" varStatus="idxStatus">
                        <input name="lisDrugFilter" class="form-control lisDrugFilterInput" value="${entry}" readonly>
                        <p onclick="deleteLisDrugFilterInput(this)" class="fa fa-times lisDrugFilterInputDelete"></p>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
