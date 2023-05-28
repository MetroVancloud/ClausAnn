/**
 * 保存区间型指标
 */
function saveRuleItem () {
    var rule = {};
    rule.id = $("input[name='id']").val();
    rule.ruleName = $("input[name='ruleName']").val();
    rule.indi = 1;

    var ruleItemRangeTrList = $("#ruleItemRangeTable").children("tr");
    var ruleItemRangeList = [];
    for (var i = 0; i < ruleItemRangeTrList.length; i++) {
        var tdArr = ruleItemRangeTrList.eq(i).find("td");
        var ruleItem = {};
        ruleItem.ruleId = rule.id;
        ruleItem.indi = 1;
        ruleItem.itemCode = tdArr.eq(2).find('input').val();
        ruleItem.itemName = tdArr.eq(3).find('input').val();
        ruleItem.minValue = tdArr.eq(4).find('input').val();
        ruleItem.maxValue = tdArr.eq(5).find('input').val();
        ruleItem.itemUnit = tdArr.eq(6).find('input').val();

        ruleItemRangeList.push(ruleItem);
    }
    $.ajax({
        type: 'post',
        url : 'rule/saveRuleItem.do',
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({rule: rule, ruleItemList: ruleItemRangeList}),
        success: function(data){
            if (data.success) {
                alert("保存成功");
            } else {
                alert(data.message);
            }
        }
    });
}

/**
 * 保存区间型指标
 */
function saveRuleItemDiff () {
    var rule = {};
    rule.id = $("input[name='id']").val();
    rule.ruleName = $("input[name='ruleName']").val();
    rule.indi = 1;

    var ruleItemDiffTrList = $("#ruleItemDiffTable").children("tr");
    var ruleItemDiffList = [];
    for (var i = 0; i < ruleItemDiffTrList.length; i++) {
        var tdArr = ruleItemDiffTrList.eq(i).find("td");
        var ruleItem = {};
        ruleItem.ruleId = rule.id;
        ruleItem.indi = 1;
        ruleItem.itemCode = tdArr.eq(2).find('input').val();
        ruleItem.itemName = tdArr.eq(3).find('input').val();
        ruleItem.minValue = tdArr.eq(4).find('input').val();
        ruleItem.maxValue = tdArr.eq(5).find('input').val();
        ruleItem.itemUnit = tdArr.eq(6).find('input').val();

        ruleItemDiffList.push(ruleItem);
    }
    $.ajax({
        type: 'post',
        url : 'rule/saveRuleItemDiff.do',
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({rule: rule, ruleItemDiffList: ruleItemDiffList}),
        success: function(data){
            if (data.success) {
                alert("保存成功");
            } else {
                alert(data.message);
            }
        }
    });
}

/**
 * 保存体征型指标
 */
function saveRuleBodySign () {
    var rule = {};
    rule.id = $("input[name='id']").val();
    rule.ruleName = $("input[name='ruleName']").val();
    rule.indi = 1;

    var ruleBodySignTrList = $("#ruleBodySignTable").children("tr");
    var ruleBodySignList = [];
    for (var i = 0; i < ruleBodySignTrList.length; i++) {
        var tdArr = ruleBodySignTrList.eq(i).find("td");
        var ruleItem = {};
        ruleItem.ruleId = rule.id;
        ruleItem.indi = 1;
        ruleItem.signName = tdArr.eq(2).find('input').val();
        ruleItem.minValue = tdArr.eq(3).find('input').val();
        ruleItem.maxValue = tdArr.eq(4).find('input').val();
        ruleItem.signUnit = tdArr.eq(5).find('input').val();

        ruleBodySignList.push(ruleItem);
    }
    $.ajax({
        type: 'post',
        url : 'rule/saveRuleBodySign.do',
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({rule: rule, ruleBodySignList: ruleBodySignList}),
        success: function(data){
            if (data.success) {
                alert("保存成功");
            } else {
                alert(data.message);
            }
        }
    });
}

function addItem() {
    var ruleItemRangeTrList = $("#ruleItemRangeTable").children("tr")
    var newIndex = ruleItemRangeTrList.length + 1;
    var content = "" +
        "<tr>" +
        "   <td>"+newIndex+"</td>" +
        "	<td style='display: none;'></td>" +
        "	<td><input type='text' name='itemCode' value=''></td>" +
        "	<td><input type='text' name='itemName' value=''></td>" +
        "	<td><input type='number' name='minValue' value=''></td>" +
        "	<td><input type='number' name='maxValue' value=''></td>" +
        "	<td><input type='text' name='itemUnit' value=''></td>" +
        "	<td class='operateTd'><a href='javascript:void(0)' onclick='deleteItem(this)'>删除</a></td>" +
        "</tr>";
    $("#ruleItemRangeTable").append(content);
}

function deleteItem(obj, countId) {
    if (confirm("确认删除此指标吗？")) {
        $(obj).parent().parent().remove();

        var count = $("#"+countId).html()
        var n_count = (parseInt(count) - 1) >= 0 ? parseInt(count) - 1 : 0;

        $("#"+countId).html(n_count);
    }
}

function addDrug(obj) {
    $(obj).parent().next().css("display", "block");
    $("#drugSelectModal").modal('show');
}

function deleteDrug(obj) {
    if (confirm("确认删除此药品吗？")) {
        var ruleId = $("input[name='id']").val();
        var drug = {};
        drug.drugCode = $(obj).parent().prev().prev().prev().prev().html();
        drug.drugName = $(obj).parent().prev().prev().prev().html();
        drug.drugSpec = $(obj).parent().prev().prev().html();
        drug.drugProducer = $(obj).parent().prev().html();

        $.ajax({
            type: 'post',
            url : 'rule/deleteDrug.do',
            dataType: 'json',                               //  表示返回值的数据类型
            contentType: 'application/json;charset=UTF-8',  //  内容类型
            traditional: true, //使json格式的字符串不会被转码
            data: JSON.stringify({drug: drug, ruleId: ruleId}),
            success: function(data){
                if (data.success) {
                    alert("删除成功");
                    $(obj).parent().parent().remove();
                    var drugCount = $("#drugCount").html();
                    var n_drugCount = parseInt(drugCount);
                    $("#drugCount").html(n_drugCount - 1);
                } else {
                    alert(data.message);
                }
            }
        });
    }
}

function addDrugToTable(drug) {
    var ruleId = $("input[name='id']").val();
    drug.drugName = drug.drugGeneralName;
    drug.drugProducer = drug.firmName;
    $.ajax({
        type: 'post',
        url : 'rule/addDrug.do',
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({drug: drug, ruleId: ruleId}),
        success: function(data){
            if (data.success) {
                alert("保存成功");
                var newDrugTr = "<tr>" +
                    "<td>"+drug.drugCode+"</td>" +
                    "<td>"+drug.drugName+"</td>" +
                    "<td>"+drug.drugSpec+"</td>" +
                    "<td>"+drug.drugProducer+"</td>" +
                    "<td class='operateTd'><a href='javascript:void(0)' onclick='deleteDrug(this)'>删除</a></td>" +
                    "</tr>";
                $("#ruleDrugTable").prepend(newDrugTr);
                var drugCount = $("#drugCount").html();
                var n_drugCount = parseInt(drugCount);
                $("#drugCount").html(n_drugCount + 1);
            } else {
                alert(data.message);
            }
        }
    });

}

function displaySwitch (obj) {
    if ($(obj).html() == "展开") {
        $(obj).html("收起");
        $(obj).parent().next().css("display", "block");
    } else {
        $(obj).html("展开");
        $(obj).parent().next().css("display", "none");
    }
}

/**
 * 点击编辑按钮
 * 1. input使能
 * 2. 把“编辑”变成“锁定”
 * @param obj
 */
function editItem(obj) {
    var operation = $(obj).html();
    //var unFold = $(obj).prev().prev().prev();
    if ("编辑" == operation) {
        $(obj).html("锁定");
        var table = $(obj).parent().next();
        $(table).find("input[name='minValue']").attr("readonly", false);
        $(table).find("input[name='maxValue']").attr("readonly", false);
        $(table).find("input[name='minValue']").css("border", "0.5px solid rgb(206, 206, 206)");
        $(table).find("input[name='maxValue']").css("border", "0.5px solid rgb(206, 206, 206)");
    } else {
        $(obj).html("编辑");
        var table = $(obj).parent().next();
        $(table).find("input[name='minValue']").attr("readonly", true);
        $(table).find("input[name='maxValue']").attr("readonly", true);
        $(table).find("input[name='minValue']").css("border", "none");
        $(table).find("input[name='maxValue']").css("border", "none");
    }
}

/**
 * 返回选择指标类型
 */
function returnChooseType() {
    $("#itemModal").modal('hide');
    $("#ruleTypeChooseModal").modal('show');
}

/**
 * 打开这个 Modal
 */
function openRuleTypeChoose() {
    $("#ruleTypeChooseModal").modal('show');

}

/**
 *
 * @param type
 */
function chooseRuleType(type) {

    var url = "";
    if ("1" == type || "2" == type) {
        url = "lisItemDict/selectEnabled.do";
    } else if ("3" == type) {
        url = "bodySignDict/selectAll.do";
    } else {
        return;
    }
    $.ajax({
        type: 'post',
        url : url,
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        //data: JSON.stringify({suspiciousPatientId: suspiciousPatientId, state: state}),
        success: function(data){
            if (data.success) {
                var content = "";
                var list = data.data;
                if (list.length == 0) {
                    content = "<b>该类别下没有指标，请录入指标进数据库！</b>";
                } else {
                    for (var i = 0; i < list.length; i++) {
                        var entry = JSON.stringify(list[i]);    
                        if ("1" == type) {
                            content += "<button type='button' onclick='addToRuleItemTable("+entry+", "+type+")' class='btn btn-outline btn-success'>"+list[i].itemName+"</button>&nbsp;";
                        } else if ("2" == type) {
                            content += "<button type='button' onclick='addToRuleItemTable("+entry+", "+type+")' class='btn btn-outline btn-info'>"+list[i].itemName+"</button>&nbsp;";
                        } else if ("3" == type) {
                            content += "<button type='button' onclick='addToRuleItemTable("+entry+", "+type+")' class='btn btn-outline btn-warning'>"+list[i].signName+"</button>&nbsp;";
                        } else {
                            return;
                        }
                    }
                }

                $("#modalContentId").html(content);
                $("#itemModal").modal('show');
                $("#ruleTypeChooseModal").modal('hide');
            } else {
                alert(data.message);
            }
        }
    });
}

/**
 * 将指标添加到表格中
 * @param entry
 * @param type
 */
function addToRuleItemTable(entry, type) {
    $("#itemModal").modal('hide');
    if ("1" == type) {
        var ruleItemRangeTrList = $("#ruleItemRangeTable").children("tr")
        var newIndex = ruleItemRangeTrList.length + 1;
        $("#ruleItemCount").html(newIndex);
        var content = "" +
            "<tr>" +
            "   <td>"+newIndex+"</td>" +
            "	<td style='display: none;'></td>" +
            "	<td><input style='border: none;background: #f9f9f9;' type='text' name='itemCode' value='"+ replaceNull(entry.itemCode) +"' readonly></td>" +
            "	<td><input style='border: none;background: #f9f9f9;' type='text' name='itemName' value='"+entry.itemName+"' readonly></td>" +
            "	<td><input style='border: 0.5px solid rgb(206, 206, 206);background: #f9f9f9;' type='number' name='minValue' value=''></td>" +
            "	<td><input style='border: 0.5px solid rgb(206, 206, 206);background: #f9f9f9;' type='number' name='maxValue' value=''></td>" +
            "	<td><input style='border: none;background: #f9f9f9;' type='text' name='itemUnit' value='"+entry.itemUnit+"' readonly></td>" +
            "	<td class='operateTd'><a href='javascript:void(0)' onclick='deleteItem(this)'>删除</a></td>" +
            "</tr>";
        $("#ruleItemRangeTable").append(content);
    } else if ("2" == type) {
        var ruleItemDiffTrList = $("#ruleItemDiffTable").children("tr")
        var newIndex = ruleItemDiffTrList.length + 1;
        $("#ruleItem").html(newIndex);
        var content = "" +
            "<tr>" +
            "   <td>"+newIndex+"</td>" +
            "	<td style='display: none;'></td>" +
            "	<td><input style='border: none;background: #f9f9f9;' type='text' name='itemCode' value='"+entry.itemCode+"' readonly></td>" +
            "	<td><input style='border: none;background: #f9f9f9;' type='text' name='itemName' value='"+entry.itemName+"' readonly></td>" +
            "	<td><input style='border: 0.5px solid rgb(206, 206, 206);background: #f9f9f9;' type='number' name='minValue' value=''></td>" +
            "	<td><input style='border: 0.5px solid rgb(206, 206, 206);background: #f9f9f9;' type='number' name='maxValue' value=''></td>" +
            "	<td><input style='border: none;background: #f9f9f9;' type='text' name='itemUnit' value='"+entry.itemUnit+"' readonly></td>" +
            "	<td class='operateTd'><a href='javascript:void(0)' onclick='deleteItem(this)'>删除</a></td>" +
            "</tr>";
        $("#ruleItemDiffTable").append(content);
    } else if ("3" == type) {
        var ruleItemDiffTrList = $("#ruleBodySignTable").children("tr")
        var newIndex = ruleItemDiffTrList.length + 1;
        $("#ruleBodySignCount").html(newIndex);
        var content = "" +
            "<tr>" +
            "   <td>"+newIndex+"</td>" +
            "	<td style='display: none;'></td>" +
            "	<td><input style='border: none;background: #f9f9f9;' type='text' name='itemName' value='"+entry.signName+"' readonly></td>" +
            "	<td><input style='border: 0.5px solid rgb(206, 206, 206);background: #f9f9f9;' type='number' name='minValue' value=''></td>" +
            "	<td><input style='border: 0.5px solid rgb(206, 206, 206);background: #f9f9f9;' type='number' name='maxValue' value=''></td>" +
            "	<td><input style='border: none;background: #f9f9f9;' type='text' name='itemUnit' value='"+entry.signUnit+"' readonly></td>" +
            "	<td class='operateTd'><a href='javascript:void(0)' onclick='deleteItem(this)'>删除</a></td>" +
            "</tr>";
        $("#ruleBodySignTable").append(content);
    } else {
        return;
    }
}

function deleteRule(id) {
    if (confirm("确认删除这个监测主题吗？")){
        var url = "lisItemDict/selectAll.do?id=" + id;
        $.ajax({
            type: 'post',
            url : url,
            dataType: 'json',                               //  表示返回值的数据类型
            contentType: 'application/json;charset=UTF-8',  //  内容类型
            traditional: true, //使json格式的字符串不会被转码
            //data: JSON.stringify({suspiciousPatientId: suspiciousPatientId, state: state}),
            success: function(data){
                if (data.success) {
                    alert("删除成功")
                } else {
                    alert(data.message);
                }
            }
        });
    }
}

/**
 * 2018-09-08
 * 增加一个过滤不显示药品的关键字输入框
 */
function addLisDrugFilter(obj) {
    var flag = true;
    $("#lisDrugFilterZone").find("input[name='lisDrugFilter']").each(function(){
        if ("" == $(this).val()) {
            flag = false;
            alert("请将空的输入框补充完整，才能增加新的输入框");
        }
    });
    if (flag) {
        $("input[name='lisDrugFilter']").removeAttr("readonly");
        $("#lisDrugFilterZone").append("<input name=\"lisDrugFilter\" class=\"form-control lisDrugFilterInput\" value=\"\" >" +
            "<p onclick=\"deleteLisDrugFilterInput(this)\" class=\"fa fa-times lisDrugFilterInputDelete\"></p>")
        $(".lisDrugFilterInputDelete").css("display", "block");
        $(obj).next().html("锁定");
        var countStr = $("#lisDrugFilterCount").html();
        var count = parseInt(countStr) + 1;
        $("#lisDrugFilterCount").html(count);
    }
}

/**
 * 2018-09-08
 * 编辑/锁定过滤不显示药品的关键字输入框
 */
function editLisDrugFilter(obj) {
    var operation = $(obj).html();
    if ("编辑" == operation) {
        $(obj).html("锁定");
        $("input[name='lisDrugFilter']").removeAttr("readonly");
        $(".lisDrugFilterInputDelete").css("display", "block");
    } else {
        $(obj).html("编辑");
        $("input[name='lisDrugFilter']").attr("readonly", true);
        $(".lisDrugFilterInputDelete").css("display", "none");
    }
}

/**
 * 2018-09-08
 * 删除一个过滤不显示药品的关键字输入框
 * @param obj
 */
function deleteLisDrugFilterInput(obj) {
    if (confirm("确认删除此关键字吗？")) {
        $(obj).prev().remove();
        $(obj).remove();
    }
}

/**
 * 2018-09-08
 * 保存过滤不显示药品的关键字输入框
 */
function saveLisDrugFilter() {
    /**
     * 规则信息
     */
    var rule = {};
    rule.id = $("input[name='id']").val();
    rule.ruleName = $("input[name='ruleName']").val();
    rule.indi = 1;

    /**
     * 关键字列表
     */
    var set = new Set();
    $("#lisDrugFilterZone").find("input[name='lisDrugFilter']").each(function(){
        if ("" != $(this).val()) {
            set.add($(this).val());
        }
    });
    var content = "";
    var lisDrugFilterSet = [];
    set.forEach(function (element, sameElement, set) {
        content += "<input name=\"lisDrugFilter\" class=\"form-control lisDrugFilterInput\" value=\""+element+"\" readonly>" +
            "<p onclick=\"deleteLisDrugFilterInput(this)\" class=\"fa fa-times lisDrugFilterInputDelete\"></p>";
        lisDrugFilterSet.push(element);
    });
    $.ajax({
        type: 'post',
        url : 'rule/saveLisDrugFilter.do',
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({rule: rule, lisDrugFilterSet: lisDrugFilterSet}),
        success: function(data){
            if (data.success) {

                $("#lisDrugFilterZone").html(content);
                $("#lisDrugFilterCount").html(lisDrugFilterSet.length);
                alert("保存成功");
            } else {
                alert(data.message);
            }
        }
    });

}