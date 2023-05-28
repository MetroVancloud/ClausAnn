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
                    <label style="font-size: 12px;margin-right: 5px;">检验项目名称</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <input name="lisItemDictCondition.itemName" class="form-control" value="${lisItemDictCondition.itemName}">
                    </label>
                </div>

                <div class="form-group" style="float: left;margin-right: 20px;">
                    <label style="font-size: 12px;margin-right: 5px;">是否可用于建立规则</label>
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <select style="font-size: 12px;" class="form-control" name="lisItemDictCondition.enable">
                            <option value="">全部</option>
                            <option value="1">可以</option>
                            <option value="0">不可以</option>
                        </select>
                    </label>
                </div>

                <div class="form-group" style="float: right;">
                    <label class="radio-inline" style="padding-left: 0px;margin-left: 0px;">
                        <button onclick="searchLisItemDict()" type="button" class="btn btn-primary">搜索</button>
                    </label>
                </div>

            </div>
        </div>
    </div>

</body>
<script src="resources/CustomJS/lisItemDict.js"></script>

<script>
    $(document).ready(function () {
        var enable = '${lisItemDictCondition.enable}';
        $("select[name='lisItemDictCondition.enable']").val(enable);
    });
</script>
</html>
