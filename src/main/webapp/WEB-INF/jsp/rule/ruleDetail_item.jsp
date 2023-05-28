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
        <span>*&nbsp;区间型指标（指标总数：<b id="ruleItemCount" style="color: #bb8e67;">${ruleItemList.size()}</b>）</span>
        <a href="javascript:void(0)" onclick="saveRuleItem()" style="float: right; margin-right: 8px;">保存</a>
        <a href="javascript:void(0)" onclick="editItem(this)" style="float: right; margin-right: 16px;">编辑</a>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body" style="padding: 0;">
                <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                    <tr>
                        <th class="operateTd">序号</th>
                        <th style="display: none;"></th>
                        <th>检验项代码</th>
                        <th>检验项名称</th>
                        <th>异常范围下限</th>
                        <th>异常范围上限</th>
                        <th>单位</th>
                        <th class="operateTd">操作</th>
                    </tr>
                    </thead>
                    <tbody id="ruleItemRangeTable">
                    <c:forEach items="${ruleItemList}" var="entry" varStatus="idxStatus">
                        <tr>
                            <td class="operateTd">${idxStatus.index + 1}</td>
                            <td style="display: none;">${entry.id}</td>
                            <td><input style="border: none;background: #f9f9f9;" type="text" name="itemCode" value="${entry.itemCode}" readonly /></td>
                            <td><input style="border: none;background: #f9f9f9;" type="text" name="itemName" value="${entry.itemName}" readonly /></td>
                            <td><input style="border: none;background: #f9f9f9;" type="number" name="minValue" value="${entry.minValue}" readonly /></td>
                            <td><input style="border: none;background: #f9f9f9;" type="number" name="maxValue" value="${entry.maxValue}" readonly /></td>
                            <td><input style="border: none;background: #f9f9f9;" type="text" name="itemUnit" value="${entry.itemUnit}" readonly /></td>
                            <td class="operateTd"><a href="javascript:void(0)" onclick="deleteItem(this, 'ruleItemCount')">删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

</body>
</html>
