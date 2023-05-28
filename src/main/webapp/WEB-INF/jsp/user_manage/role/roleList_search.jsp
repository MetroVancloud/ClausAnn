<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/9/10
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="resources/js/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body" style="padding: 0;">

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">角色名称</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input name="roleCondition.roleName" class="form-control" value="${roleCondition.roleName}">
                    </label>
                </div>

                <div class="form-group" style="float: right;">
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <button onclick="searchRole()" type="button" class="btn btn-primary">搜索</button>
                        <button onclick="createDetail()" type="button" class="btn btn-success">创建</button>
                    </label>
                </div>

            </div>
        </div>
    </div>

</body>
<script src="resources/CustomJS/role.js"></script>

<script>
    $(document).ready(function () {

    });
</script>
</html>
