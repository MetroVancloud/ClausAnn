<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/4/18
  Time: 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>左侧菜单栏</title>

    <script>
        function addRule(obj) {
            var newRuleName = "";
            while (newRuleName == "") {
                newRuleName = prompt("请输入新建主题名称：", "");
            }
            if (null == newRuleName) {
                return;
            }
            $.ajax({
                type: 'post',
                url : 'rule/addNewRule.do',
                dataType: 'json',                               //  表示返回值的数据类型
                contentType: 'application/json;charset=UTF-8',  //  内容类型
                traditional: true, //使json格式的字符串不会被转码
                data: JSON.stringify({newRuleName: newRuleName}),
                success: function(data){
                    if (data.success) {
                        var rule = data.data;
                        //var content = "<li><a id='newAdd' href='rule/ruleDetail.do?id="+rule.id+"'>"+newRuleName+"</a></li>";
                        //$(obj).parent().parent().prepend(content);
                        var href = "rule/ruleDetail.do?id=" + rule.id;
                        window.location.href = href;
                    } else {
                        alert(data.message);
                        addRule();
                    }
                }
            });
        }
    </script>
</head>
<body>
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <c:forEach items="${userRightList}" var="entry">
                    <c:if test="${entry eq '1'}">
                        <li>
                            <a href="javascript:void(0)">
                                <i class="fa fa-table fa-fw"></i>
                                监测患者
                                    <%--<span class="fa arrow"></span>--%>
                            </a>
                            <ul class="nav nav-second-level" id="monitorPatientLink">
                                <li>
                                    <a href="suspiciousPatient/search.do" id="suspiciousPatientLink">可疑患者</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${entry eq '2'}">
                        <li>
                            <a href="javascript:void(0)">
                                <i class="fa fa-edit fa-fw"></i>
                                监测主题
                                    <%--<span class="fa arrow"></span>  --%>
                            </a>
                            <ul class="nav nav-second-level">
                                <c:forEach items="${urlList}" var="entry">
                                    <li>
                                        <a href="rule/ruleDetail.do?id=${entry.id}">${entry.ruleName}</a>
                                    </li>
                                </c:forEach>

                                <li>
                                    <a style="color: #5cb85c;" href="javascript:void(0)" onclick="addRule(this)">添加主题</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${entry eq '3'}">
                        <li>
                            <a href="javascript:void(0)">
                                <i class="fa fa-bar-chart-o fa-fw"></i>
                                监测统计
                            </a>
                            <ul class="nav nav-second-level" id="monitorStatisticLink">
                                <li><a href="report/toReportList.do?pageUtil.pageNum=1&pageUtil.limit=10" id="reportLink">不良反应事件报告一览</a></li>
                                <li><a href="statistics/getSimpleReportStatistic.do?groupByType=eventLevel" id="statistic_eventLevelLink">按事件严重级别</a></li>
                                <li><a href="statistics/getSimpleReportStatistic.do?groupByType=eventType" id="statistic_eventTypeLink">按事件新老级别</a></li>
                                <li><a href="statistics/getSimpleReportStatistic.do?groupByType=adrName" id="statistic_adrNameLink">按事件名称类型</a></li>
                                <li><a href="statistics/getSimpleReportStatistic.do?groupByType=reporterProfession" id="statistic_reporterProfessionLink">按报告人岗位类别</a></li>
                                <li><a href="statistics/getSimpleReportStatistic.do?groupByType=reporterDept" id="statistic_reportDeptLink">按上报科室统计</a></li>
                                <li><a href="statistics/getSimpleReportStatistic.do?groupByType=reportPerson" id="statistic_reportPersonLink">按上报人员统计</a></li>
                                <li><a href="statistics/getSimpleReportStatistic.do?groupByType=patientDept" id="statistic_patientDeptLink">按临床科室统计</a></li>
                                <li><a href="statistics/getSimpleReportStatistic.do?groupByType=monitorRule" id="statistic_monitorRuleLink">按监测种类统计</a></li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${entry eq '4'}">
                        <li>
                            <a href="javascript:void(0)">
                                <i class="fa fa fa-sitemap fa-fw fa-fw"></i>
                                用户管理
                            </a>
                            <ul class="nav nav-second-level" id="userManageLink">
                                <li><a href="user/toUserList.do?pageUtil.pageNum=1&pageUtil.limit=10" id="userListLink">用户列表</a></li>
                                <li><a href="role/toRoleList.do?pageUtil.pageNum=1&pageUtil.limit=10" id="roleListLink">权限列表</a></li>
                                <li><a href="lisItemDict/toLisItemDictList.do?pageUtil.pageNum=1&pageUtil.limit=10" id="lisItemDictListLink">检验列表</a></li>


                            </ul>

                        </li>
                    </c:if>

                </c:forEach>







                <%--<li>
                    <a href="systemSetting/main.do"><i class="fa fa fa-wrench fa-fw fa-fw"></i>系统设置</a>
                </li>--%>

            </ul>
        </div>
    </div>


    <script src="resources/js/jquery-1.10.2.js"></script>


</body>

</html>
