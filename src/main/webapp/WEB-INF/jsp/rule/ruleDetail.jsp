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
</head>
<body>
    <div id="page-wrapper">
        <%--<%@include file="../common/contentTitle.jsp"%>--%>
        <div id="content_title" style="margin-top: 12px;">
            <p>
                <b>${contentTitle}</b>
                &nbsp;&nbsp;<a style="font-weight: bold" href="javascript:void(0)" onclick="openRuleTypeChoose()">新增指标</a>
                &nbsp;&nbsp;<a style="color: #d9534f;font-weight: bold" href="javascript:void(0)" onclick="deleteRule('${rule.id}')">删除主题</a>
            </p>
        </div>
        <input type="hidden" name="id" value="${rule.id}">
        <input type="hidden" name="ruleName" value="${rule.ruleName}">
        <%@include file="ruleDetail_item.jsp"%>
        <%@include file="ruleDetail_item_diff.jsp"%>
        <%@include file="ruleDetail_body_sign.jsp"%>
        <%@include file="ruleDetail_drug.jsp"%>
        <%@include file="ruleDetail_lis_drug_filter.jsp"%>

        <%@include file="ruleTypeChoose.jsp"%>

        <%@include file="ruleItemChoose.jsp"%>
    </div>
</body>
<script src="resources/CustomJS/rule.js"></script>
</html>
