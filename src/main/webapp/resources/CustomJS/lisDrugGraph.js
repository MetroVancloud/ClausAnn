


function showNewItem() {
    selectRelatedOrdersInDisplay();
    for (var itemName in lisGraphChart) {
        lisGraphChart[itemName].showLoading();
    }
    myChart2.showLoading();
    var patientId = $("input[name='patientId']").val();
    var minDate = $("input[name='minDate']").val();
    var maxDate = $("input[name='maxDate']").val();
    var ruleId = $("input[name='ruleId']").val();
    $.ajax({
        type: 'post',
        url : 'suspiciousPatient/showNewItemGraph.do',
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({patientId: patientId, ruleId: ruleId, minDate: minDate, maxDate: maxDate}),
        success: function(data){
            if (data.success) {
                var drugNum = data.data.drugNum;
                var height = drugNum * 30;
                document.getElementById("ordersGraph").style.height = height + "px";

                for (var itemName in lisGraphChart) {
                    lisGraphChart[itemName].hideLoading();
                }
                myChart2.hideLoading();


                var optionMap = data.data.optionMap;
                //lisGraphChart.clear();
                for (var itemName in optionMap) {
                    lisGraphChart[itemName].clear();
                    //$("#container_"+itemName).html("");
                    var optionObject = eval('(' + optionMap[itemName] + ')');
                    //var dom = document.getElementById("container_"+itemName);
                    //lisGraphChart[itemName] = echarts.init(dom);
                    if (optionObject && typeof optionObject === "object") {
                        lisGraphChart[itemName].setOption(optionObject, false);
                    }
                }

                myChart2.clear();
                option2 = eval("("+data.data.ordersOption+")");
                newline(option2, 30, 'yAxis');
                myChart2.setOption(option2, false);
                myChart2.resize();
            } else {
                alert(data.message);
                for (var itemName in lisGraphChart) {
                    lisGraphChart[itemName].hideLoading();
                }
                myChart2.hideLoading();
            }
        }
    });
}

/** * Created by HanSon on 2016/1/24. */
function newline(option, number, axis){
    /* 此处注意你的json是数组还是对象 */
    option[axis]['axisLabel']={
        interval: 0,
        formatter: function(params){
            var newParamsName = "";
            var paramsNameNumber = params.length;
            var provideNumber = number;
            var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
            if (paramsNameNumber > provideNumber) {
                for (var p = 0; p < rowNumber; p++) {
                    var tempStr = "";
                    var start = p * provideNumber;
                    var end = start + provideNumber;
                    if (p == rowNumber - 1) {
                        tempStr = params.substring(start, paramsNameNumber);
                    } else {
                        tempStr = params.substring(start, end) + "\n";
                    }
                    newParamsName += tempStr;
                }
            } else {
                newParamsName = params;
            }
            return newParamsName
        }
    }
    return option;
}

/** * Created by HanSon on 2016/1/24. */
function fill(option, number, axis){
    /* 此处注意你的json是数组还是对象 */
    option[axis]['axisLabel']={
        interval: 0,
        formatter: function(params){
            var paramStr = params.toString();
            var newParamsName = "";
            var paramsNameNumber = paramStr.length;

            var spaces = "";
            for (var i = 0; i < number - paramsNameNumber; i++) {
                spaces += " ";
            }
            newParamsName = spaces + paramStr;
            return newParamsName;
        }
    }
    return option;
}

function removeOneDrugData(id) {
    var height = document.getElementById("ordersGraph").style.height;
    var newHeight = parseInt(height.substr(0, height.indexOf("p"))) - 30;
    document.getElementById("ordersGraph").style.height = newHeight + "px";
    var series = option2.series;
    var yAxisData = option2.yAxis.data;
    for (var i = 0; i < series.length; i++) {
        var temp = series[i].id;
        if (id == temp) {
            series.splice(i, 1);
            yAxisData.splice(i, 1);
            break;
        }
    }
    myChart2.clear();
    myChart2.setOption(option2, false);
    myChart2.resize();
}
