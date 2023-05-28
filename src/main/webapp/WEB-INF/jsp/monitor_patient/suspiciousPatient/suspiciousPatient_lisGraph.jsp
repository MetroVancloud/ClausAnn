<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/7/2
  Time: 下午 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检验数据-医嘱图表</title>
    <style>
        .notFocus{border:1px solid #ccc;}
        .focus{border:1px solid #66afe9;}
    </style>
</head>
<body>

<div style="width: 1000px;margin: 0 auto;">
    <label style="float: left;margin-left: 20px;margin-top: 7px;font-size: 12px;">选择检验项：</label>
    <div style="float:left;line-height: 30px;font-size: 12px;">
        <c:forEach var="lisGraphOption" varStatus="i" items="${optionMap}" begin="">
            <input type="checkbox" name="${lisGraphOption.key}_cb" checked="checked" onchange="displayLisGraph(this)"/>${lisGraphOption.key}&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="hidden" name="${lisGraphOption.key}_optionValue" value="${lisGraphOption.value}"/>
        </c:forEach>
    </div>

    <label style="float: left;margin-left: 20px;margin-top: 7px;font-size: 12px;">选择日期范围：</label>
    <input type="text" name="minDate" onchange="StrDateCompEndDate(this)" readonly="readonly"
           class="notFocus Wdate inTime longInput-in-radio-row beginDate"
           onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"
           style="border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;"
           value="${minDate}">
    -
    <input type="text" name="maxDate" readonly="readonly"
           class="notFocus Wdate inTime longInput-in-radio-row endDate"
           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" onchange="StrDateCompEndDate(this)"
           style="border-radius: 3px;width:187px;font-size: 12px;height: 30px;margin-top: 0px;padding-left: 5px;"
           value="${maxDate}">

    <button style="padding: 0;text-align: center;height: 30px;font-size: 12px;width: 50px;margin-left: 63px;vertical-align: top;" type="button" id="searchLisDrugGraph" onclick="showNewItem()" class="btn btn-primary">搜索</button>
</div>

<div class="graph-wrapper" id="lisGraphContainers" style="height: 200px;width: 1000px;margin: 0 auto;">
    <c:forEach var="lisGraphOption" varStatus="i" items="${optionMap}" begin="">
        <div id="container_${lisGraphOption.key}" style="height: 100%;width: 100%;float: right"></div>
    </c:forEach>
</div>

<div class="graph-wrapper" id="ordersGraph" style="height: 350px;width: 1000px;margin: 0 auto;">
    <div id="ordersContainer" style="height: 100%;width: 100%;margin: 0 auto;"></div>
</div>

<br>
<br>
<br>

<script src="resources/CustomJS/lisDrugGraph.js"></script>
<script src="resources/js/echarts.js"></script>
<script src="resources/js/My97DatePicker/WdatePicker.js"></script>
<script src="resources/js/jquery-1.10.2.js"></script>

<script>
    var drugNum = '${drugNum}';
    var height = parseInt(drugNum) * 30;
    if (height < 150) {
        height = 150;
    }
    document.getElementById("ordersGraph").style.height = height + "px";

    var graphOptionDivArr = $('#lisGraphContainers div');
    var lisGraphChart = {};
    $.each(graphOptionDivArr, function(i,n){
        var id = $(this).attr("id");
        var itemName = id.substr(10);
        var optionValue = $("input[name='"+itemName+"_optionValue']").val();
        var optionObject = eval('(' + optionValue + ')');
        var dom = document.getElementById(id);
        var myChart = echarts.init(dom);
        if (optionObject && typeof optionObject === "object") {
            myChart.setOption(optionObject, false);
        }
        lisGraphChart[itemName] = myChart;
    });

    var dom2 = document.getElementById("ordersContainer");
    var myChart2 = echarts.init(dom2);
    var option2 = ${ordersGraphOption};
    if (option2 && typeof option2 === "object") {
        newline(option2, 30, 'yAxis');
        myChart2.setOption(option2, false);
    }

    myChart2.on('click', function (params) {
        /**
         * 点击 y 轴上的药品响应事件
         */
        if(params.componentType == "yAxis") {
            var id = params.value;
            removeOneDrugData(id);
        }
    });

    function displayLisGraph(obj) {
        var name = $(obj).attr('name');
        var itemName = name.substr(0, name.indexOf("_") );
        if ($(obj).prop('checked')) {
            $("#container_"+itemName).css('display', 'block');
        } else {
            $("#container_"+itemName).css('display', 'none');
        }
    }
</script>

</body>
</html>
