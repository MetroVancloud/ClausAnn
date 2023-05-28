<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/6/14
  Time: 下午 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="resources/js/jquery.js"></script>
    <%--<style type="text/css">
        .searchInput{
            height:30px;
            margin-bottom:5px;
            padding: 5px;
            width: 120px;
        }
        .selectedDrugInput{
            height:30px;
            margin-bottom:5px;
            padding: 5px;
            width: 150px;
            border: none;
            border-bottom: solid 1px black;
        }
        #drugList tbody {
            display:block;
            height:500px;
            overflow-y:scroll;
        }

        #drugList thead, tbody tr {
            display:table;
            width:100%;
            table-layout:fixed;
        }

        #drugList thead {
            width: calc( 100% - 1em );
            color: white;
            background: #337ab7;
            border-radius: 8px;
        }
    </style>--%>

    <script>

        //	将以下值作为全局变量
        var needSpec = '${condition.needSpec}';
        var needForm = '${condition.needForm}';
        var needProducer = '${condition.needProducer}';
        var needPkgUnit = '${condition.needPkgUnit}';
        var needDoseUnits = '${condition.needDoseUnits}';

        //	根据初始条件中的，判断是否需要显示一些药品字段的筛选
        $(document).ready(function(){
            if (needSpec == '1') {
                $("#specInput").css("display", "block");
                //$("#specSelected").css("display", "block");
                $("#specTH").css("display", "table-cell");
                $("input[name='specCB']").attr("checked", "true");
            }
            if (needForm == '1') {
                $("#formInput").css("display", "block");
                //$("#formSelected").css("display", "block");
                $("#formTH").css("display", "table-cell");
                $("input[name='formCB']").attr("checked", "true");
            }
            if (needProducer == '1') {
                $("#producerInput").css("display", "block");
                //$("#producerSelected").css("display", "block");
                $("#producerTH").css("display", "table-cell");
                $("input[name='producerCB']").attr("checked", "true");
            }
            if (needPkgUnit == '1') {
                $("#pkgUnitInput").css("display", "block");
                //$("#pkgUnitSelected").css("display", "block");
                $("#pkgUnitTH").css("display", "table-cell");
                $("input[name='pkgUnitCB']").attr("checked", "true");
            }
            if (needDoseUnits == '1') {
                $("#doseUnitsInput").css("display", "block");
                //$("#doseUnitsSelected").css("display", "block");
                $("#doseUnitsTH").css("display", "table-cell");
                $("input[name='doseUnitsCB']").attr("checked", "true");
            }
        });

        function displayMoreCondition(conditionName) {
            var state = $("input[name='"+conditionName+"CB']").prop("checked");
            if (state) {
                $("#"+conditionName+"Input").css("display", "block");
                //$("#"+conditionName+"Selected").css("display", "block");
                $("#"+conditionName+"TH").css("display", "table-cell");
                if ("spec" == conditionName) {
                    needSpec = '1';
                    $("input[name='needSpec']").val('1');
                } else if ("form" == conditionName) {
                    needForm = '1';
                    $("input[name='needForm']").val('1');
                } else if ("producer" == conditionName) {
                    needProducer = '1';
                    $("input[name='needProducer']").val('1');
                } else if ("pkgUnit" == conditionName) {
                    needPkgUnit = '1';
                    $("input[name='needPkgUnit']").val('1');
                } else if ("doseUnits" == conditionName) {
                    needDoseUnits = '1';
                    $("input[name='needDoseUnits']").val('1');
                }
            } else {
                $("#"+conditionName+"Input").css("display", "none");
                //$("#"+conditionName+"Selected").css("display", "none");
                $("#"+conditionName+"TH").css("display", "none");
                if ("spec" == conditionName) {
                    needSpec = '0';
                    $("input[name='needSpec']").val('0');
                } else if ("form" == conditionName) {
                    needForm = '0';
                    $("input[name='needForm']").val('0');
                } else if ("producer" == conditionName) {
                    needProducer = '0';
                    $("input[name='needProducer']").val('0');
                } else if ("pkgUnit" == conditionName) {
                    needPkgUnit = '0';
                    $("input[name='needPkgUnit']").val('0');
                } else if ("doseUnits" == conditionName) {
                    needDoseUnits = '0';
                    $("input[name='needDoseUnits']").val('0');
                }
            }
        }

        var drugList = [];			//	查询结果
        var isChosen = false;;		//	是否选中了一个药品
        var seletedDrug = {};       //  选中的药品

        function searchDrug() {

            var condition = {};
            condition.drugCode = $("#drugCode").val();
            condition.drugName = $("#drugName").val();
            condition.inputCode = $("#inputCode").val();

            if (needSpec == '1')
                condition.drugSpec = $("#drugSpec").val();
            if (needForm == '1')
                condition.drugForm = $("#drugForm").val();
            if (needPkgUnit == '1')
                condition.pkgUnit = $("#pkgUnit").val();
            if (needDoseUnits == '1')
                condition.doseUnits = $("#doseUnits").val();
            if (needProducer == '1')
                condition.drugProducer = $("#drugProducer").val();

            condition.needSpec = needSpec;
            condition.needForm = needForm;
            condition.needProducer = needProducer;
            condition.needPkgUnit = needPkgUnit;
            condition.needDoseUnits = needDoseUnits;

            $.ajax({
                type: 'post',
                url : "drug/drug_search.do",
                async: false,
                dataType: 'json',                               //  表示返回值的数据类型
                contentType: 'application/json;charset=UTF-8',  //  内容类型
                traditional: true, //使json格式的字符串不会被转码
                data: JSON.stringify({condition: condition}),
                success: function(message){
                    $("#drugListTable").html("");
                    drugList = message.data;
                    var html = "";
                    if (message.data.length == 0){
                        html =
                            "<tr style='height: 35px'> \n" +
                            "<td style='text-align:center;font-weight:bold;' colspan='8'>该药品不存在，请重新查询</td>" +
                            "</tr>";
                    }
                    else {
                        for (var i = 0; i < message.data.length; i++) {
                            html +=
                                '<tr style="cursor:pointer;" onclick="chooseDrug(this,'+i+')">' +
                                '<td onclick="chooseDrug(this,'+i+')" style="width:55px;text-align:center;"> ' +
                                '<input style="width:17px; height:17px;" name="drug" type="radio" value="'+ i +'"></td>' +
                                '<td style="width:120px;">'+ message.data[i].drugCode +'</td>' +
                                '<td>'+ message.data[i].drugGeneralName +'</td>';

                            if (needSpec == '1')
                                html +=
                                    '<td style="width:80px;">'+ message.data[i].drugSpec +'</td>';
                            if (needForm == '1')
                                html +=
                                    '<td style="width:80px;">'+ message.data[i].drugForm +'</td>';
                            if (needPkgUnit == '1')
                                html +=
                                    '<td style="width:100px;">'+ message.data[i].units +'</td>';
                            if (needDoseUnits == '1')
                                html +=
                                    '<td style="width:100px;">'+ message.data[i].doseUnits +'</td>';
                            if (needProducer == '1')
                                html +=
                                    '<td style="width:100px;">'+ message.data[i].firmName +'</td>';

                            html +=
                                '</tr>';
                        }
                        $("#drugListTable").append(html);
                    }
                }
            });
        }

        //	选中一个药品
        function chooseDrug(chosenDrug,i){
            $("input[name='drug']").get(i).checked=true;
            seletedDrug = drugList[i];

            $("input[name='drugCode']").val(seletedDrug.drugCode);
            $("input[name='drugName']").val(seletedDrug.drugName);

            if ('1' == needSpec)
                $("input[name='drugSpec']").val(seletedDrug.drugSpec);
            if ('1' == needForm)
                $("input[name='drugForm']").val(seletedDrug.drugForm);
            if ('1' == needProducer)
                $("input[name='drugProducer']").val(seletedDrug.drugProducer);
            if ('1' == needPkgUnit)
                $("input[name='pkgUnit']").val(seletedDrug.pkgUnit);
            if ('1' == needDoseUnits)
                $("input[name='doseUnits']").val(seletedDrug.doseUnits);

            isChosen = true;
        }

        //	确定选取一个药品
        function confirmDrug(){
            if (isChosen) {
                $("#drugSelectModal").modal('hide');
                //isChosen = false;	//	回到初始状态
                addDrugToTable(seletedDrug);

            } else {
                alert("请选择一个药品！");
            }
        }

    </script>
</head>

<body>

<!-- Modal -->
<div class="modal" id="drugSelectModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>搜索药品</b></h4>
            </div>

            <div class="modal-body">
                <form id="drugSearchForm" action="" target="nm_iframe">

                    <div class="searchZone">
                        <label class="search">药品细化：</label>
                        &nbsp;

                        <c:if test="${'1' eq condition.displaySpec}">
                            <input type="checkbox" name="specCB" onchange="displayMoreCondition('spec')">
                            <label class="search">规格</label>
                            &nbsp;
                        </c:if>

                        <c:if test="${'1' eq condition.displayForm}">
                            <input type="checkbox" name="formCB" onchange="displayMoreCondition('form')">
                            <label class="search">剂型</label>
                            &nbsp;
                        </c:if>

                        <c:if test="${'1' eq condition.displayProducer}">
                            <input type="checkbox" name="producerCB" onchange="displayMoreCondition('producer')">
                            <label class="search">厂家</label>
                            &nbsp;
                        </c:if>

                        <c:if test="${'1' eq condition.displayPkgUnit}">
                            <input type="checkbox" name="pkgUnitCB" onchange="displayMoreCondition('pkgUnit')">
                            <label class="search">包装单位</label>
                            &nbsp;
                        </c:if>

                        <c:if test="${'1' eq condition.displayDoseUnits}">
                            <input type="checkbox" name="doseUnitsCB" onchange="displayMoreCondition('doseUnits')">
                            <label class="search">剂量单位</label>
                            &nbsp;
                        </c:if>

                    </div>

                    <div class="searchZone">
		        	<span style="float: left;">
			        	<label class="search">代码</label>
						<input type="text" id="drugCode" class="searchInput" />
						&nbsp;
					</span>
                        <span style="float: left;">
						<label class="search">名称</label>
						<input type="text" id="drugName" class="searchInput" />
						&nbsp;
					</span>
                        <span style="float: left;">
						<label class="search">输入码</label>
						<input type="text" id="inputCode" class="searchInput" />
						&nbsp;
					</span>
                        <span id="specInput" style="display: none; float: left;">
						<label class="search">规格</label>
						<input type="text" id="drugSpec" class="searchInput" />
						&nbsp;
					</span>
                        <span id="formInput" style="display: none; float: left;">
						<label class="search">剂型</label>
						<input type="text" id="drugForm" class="searchInput" />
						&nbsp;
					</span>
                        <span id="producerInput" style="display: none; float: left;">
						<label class="search">厂家</label>
						<input type="text" id="drugProducer" class="searchInput" />
						&nbsp;
					</span>
                        <span id="pkgUnitInput" style="display: none; float: left;">
						<label class="search">包装单位</label>
						<input type="text" id="pkgUnit" class="searchInput" />
						&nbsp;
					</span>
                        <span id="doseUnitsInput" style="display: none; float: left;">
						<label class="search">剂量单位</label>
						<input type="text" id="doseUnits" class="searchInput" />
						&nbsp;
					</span>
                        <input style="float: right; margin-right: 14px;" type="button" value="搜索" type="button" onclick="searchDrug()" class="btn btn-primary" />
                    </div>
                </form>
            </div>


            <div class="resusltZone">
                <div class="row">

                    <div class="col-lg-12" style="margin-top: 10px">
                        <table class="table table-bordered" id="drugList">
                            <thead>
                            <tr>
                                <th style="width:55px;"></th>
                                <th style="width:120px;">代码</th>
                                <th>名称</th>
                                <th id="specTH" style="width:80px;display: none;">规格</th>
                                <th id="formTH" style="width:80px;display: none;">剂型</th>
                                <th id="pkgUnitTH" style="width:100px;display: none;">包装单位</th>
                                <th id="doseUnitsTH" style="width:100px;display: none;">剂量单位</th>
                                <th id="producerTH" style="width:100px; display: none;">厂家</th>
                            </tr>
                            </thead>
                            <tbody id="drugListTable">
                            </tbody>
                        </table>
                    </div>

                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" onclick="confirmDrug()" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>

</body>
</html>

