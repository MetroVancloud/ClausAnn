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
    <script src="resources/CustomJS/user.js"></script>

</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body" style="padding: 0;">
                
                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">用户ID</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input name="usersCondition.userId" class="form-control" value="${usersCondition.userId}">
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">用户姓名</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input name="usersCondition.userName" class="form-control" value="${usersCondition.userName}">
                    </label>
                </div>

                <div class="form-group" style="float: right;">
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <button onclick="searchUser()" type="button" class="btn btn-primary">搜索</button>
                        <button onclick="createDetail()" type="button" class="btn btn-success">创建</button>
                    </label>
                </div>

            </div>
        </div>
    </div>

</body>

<script>
    $(document).ready(function () {

    });
</script>
</html>
