<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/4/18
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>顶栏</title>

</head>
<body>

    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="color: #000;" href="index/main.do">新华医院药物不良反应监测系统</a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li style="margin-top: 15px;">
                <label style="font-weight: normal;">${user.userName}老师</label>
            </li>
            <li style="margin-top: 15px;">
                <label style="font-weight: normal;"><a href="login/out.do">注销</a></label>
            </li>
            <%--<li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>黄医师</strong>
                                <span class="pull-right text-muted">
                                    <em>2018-04-18</em>
                                </span>
                            </div>
                            <div>已接受停药建议</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有消息</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> 今日待判断可疑患者
                                <span class="pull-right text-muted small">2018-04-18</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有患者</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user_manage fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user_manage">
                    <li><a href="#"><i class="fa fa-user_manage fa-fw"></i>个人信息</a></li>
                    <li class="divider"></li>
                    <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>注销</a></li>
                </ul>
            </li>--%>
        </ul>


        <%@include file="menu.jsp"%>
    </nav>

</body>
</html>
