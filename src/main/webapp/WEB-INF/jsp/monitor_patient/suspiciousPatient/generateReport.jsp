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
    <script src="resources/js/My97DatePicker/WdatePicker.js"></script>

<%--<script src="resources/js/jquery.js"></script>--%>
    <style>
        .reportTable {
            font-size: 14px;margin-bottom:0;border-bottom: 1px solid #ddd;width: 100%;
        }
        .deleteOneDrug {
            color: #d9534f;
            font-size: 16px;
            /*margin-top: 9px;
            margin-right: 20px;*/
            cursor: pointer;
            display: none;
        }
        #combinedDrugTable th {
            vertical-align: middle;
        }
        #combinedDrugTable td {
            vertical-align: middle;
        }
        #suspiciousDrugTable th {
            vertical-align: middle;
        }
        #suspiciousDrugTable td {
            vertical-align: middle;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("input[type='radio'][name='reportOrganizationRadio']").change(function() {
                if (this.value == '其他') {
                    $("input[name='report.reportOrganization']").css('display', 'block');
                    $("input[name='report.reportOrganization']").val("");
                } else {
                    $("input[name='report.reportOrganization']").val(this.value);
                    $("input[name='report.reportOrganization']").css('display', 'none');
                }
            });

            $("input[type='radio'][name='previousAdrRadio']").change(function() {
                if (this.value == '有') {
                    $("#previousAdrTextarea").css('display', 'block');
                    $("#previousAdrTextarea").val('');
                    $("input[name='report.previousAdr']").val("");
                } else {
                    $("input[name='report.previousAdr']").val(this.value);
                    $("input[name='report.previousAdr']").css('display', 'none');
                    $("#previousAdrTextarea").css('display', 'none');
                    $("#previousAdrTextarea").val('');
                }
            });


            $("input[type='radio'][name='familyAdrRadio']").change(function() {
                if (this.value == '有') {
                    $("#familyAdrTextarea").css('display', 'block');
                    $("#familyAdrTextarea").val('');
                    $("input[name='report.familyAdr']").val("");
                } else {
                    $("input[name='report.familyAdr']").val(this.value);
                    $("input[name='report.familyAdr']").css('display', 'none');
                    $("#familyAdrTextarea").css('display', 'none');
                    $("#familyAdrTextarea").val('');
                }
            });

            $("input[type='radio'][name='adrResultRadio']").change(function() {
                if (this.value == '有后遗症') {
                    $("#sequelaLabel").css("display", "block");
                    $("#sequelaTextarea").css('display', 'block');
                    $("#sequelaTextarea").val('');
                    $("#deathCauseLabel").css('display', 'none');
                    $("#deathCauseTextarea").css('display', 'none');
                    $("#deathCauseTextarea").val('');
                    $("#deathDateLabel").css('display', 'none');
                    $("#deathDate").css("display", "none");
                    $("#deathDate").val("");

                    $("input[name='report.adrResult']").val("有后遗症：");
                } else if (this.value == '死亡') {
                    $("#sequelaLabel").css("display", "none");
                    $("#sequelaTextarea").css('display', 'none');
                    $("#sequelaTextarea").val('');
                    $("#deathCauseLabel").css('display', 'block');
                    $("#deathCauseTextarea").css('display', 'block');
                    $("#deathCauseTextarea").val('');
                    $("#deathDateLabel").css('display', 'block');
                    $("#deathDate").css("display", "block");
                    $("#deathDate").val("");

                    $("input[name='report.adrResult']").val("死亡：");
                } else {
                    $("#sequelaLabel").css("display", "none");
                    $("#sequelaTextarea").css('display', 'none');
                    $("#sequelaTextarea").val('');
                    $("#deathCauseLabel").css('display', 'none');
                    $("#deathCauseTextarea").css('display', 'none');
                    $("#deathCauseTextarea").val('');
                    $("#deathDateLabel").css('display', 'none');
                    $("#deathDate").css("display", "none");
                    $("#deathDate").val("");

                    $("input[name='report.adrResult']").val(this.value);
                }
            });

            $("input[type='radio'][name='disappearBetterRadio']").change(function() {
                $("input[name='report.disappearBetter']").val(this.value);
            });

            $("input[type='radio'][name='appearAgainRadio']").change(function() {
                $("input[name='report.appearAgain']").val(this.value);
            });

            $("input[type='radio'][name='originalDiseaseEffectRadio']").change(function() {
                $("input[name='report.originalDiseaseEffect']").val(this.value);
            });

            $("input[type='radio'][name='relevanceEvaluation1Radio']").change(function() {
                $("input[name='report.relevanceEvaluation1']").val(this.value);
            });

            $("input[type='radio'][name='relevanceEvaluation2Radio']").change(function() {
                $("input[name='report.relevanceEvaluation2']").val(this.value);
            });

            $("input[type='radio'][name='reporterProfessionRadio']").change(function() {
                if (this.value == '其他') {
                    $("#reporterProfessionTextarea").css('display', 'block');
                    $("#reporterProfessionTextarea").val('');
                    $("input[name='report.reporterProfession']").val("");
                } else {
                    $("input[name='report.reporterProfession']").val(this.value);
                    $("input[name='report.reporterProfession']").css('display', 'none');
                    $("#reporterProfessionTextarea").css('display', 'none');
                    $("#reporterProfessionTextarea").val('');
                }
            });

            $("input[type='radio'][name='producerInfoSourceRadio']").change(function() {
                if (this.value == '其他') {
                    $("#producerInfoSourceTextarea").css('display', 'block');
                    $("#producerInfoSourceTextarea").val('');
                    $("input[name='report.producerInfoSource']").val("");
                } else {
                    $("input[name='report.producerInfoSource']").val(this.value);
                    $("input[name='report.producerInfoSource']").css('display', 'none');
                    $("#producerInfoSourceTextarea").css('display', 'none');
                    $("#producerInfoSourceTextarea").val('');
                }
            });

            //  严重程度及其描述
            $("input[type='radio'][name='report.reportTypeSerious']").change(function() {
                if (this.value == '严重') {
                    $("#reportSeriousContentTextarea").parent().css('display', '');
                    $("#reportSeriousContentTextarea").parent().prev().css('display', '');
                } else {
                    $("#reportSeriousContentTextarea").parent().css('display', 'none');
                    $("#reportSeriousContentTextarea").parent().prev().css('display', 'none');
                }
                $("#reportSeriousContentTextarea").val("");
                $("input[name='report.reportSeriousContent']").val("");
            });


        });

    </script>
</head>

<body>

<!-- Modal -->
<div class="modal fade" style="width: 1200px;margin: 0 auto" id="generateReportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog_scroll" style="width: 100%">
        <div class="modal-content modal-content_scroll">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>填写药物不良反应/事件报告</b></h4>
            </div>

            <div class="modal-body modal-body_scroll" id="" style="overflow-y: scroll; ">
                <div style="margin-bottom: 20px; text-align: right">
                    <form id="reportForm" action="" method="post">
                        <table class="table table-condensed reportTable">
                            <input type="hidden" name="report.monitorRuleId" value="">
                            <input type="hidden" name="report.monitorRuleName" value="">
                            <input type="hidden" name="report.patientDeptCode" value="">
                            <input type="hidden" name="report.patientDeptName" value="">
                            <input type="hidden" name="report.id" value="">
                            <input type="hidden" name="report.suspiciousPatientId" value="">
                            <input type="hidden" name="suspiciousPatient.state" value="">
                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">是否首次：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="report.reportImmediacy" value="1" checked="checked">
                                    首次报告
                                    <input type="radio" name="report.reportImmediacy" value="2">
                                    跟踪报告
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">编码：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.reportCode" value="" readonly>
                                </td>
                            </tr>


                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">严重程度：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="report.reportTypeSerious" value="一般" checked="checked">
                                    一般
                                    <input type="radio" name="report.reportTypeSerious" value="严重">
                                    严重
                                </td>

                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">严重情况描述：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <textarea class="form-control" onblur="setTextarea2Input(this)" id="reportSeriousContentTextarea" style="width: 400px;resize: vertical;" rows="1"></textarea>
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.reportSeriousContent" value="" />
                                </td>

                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告类型：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="report.reportTypeNew" value="新的" checked="checked">
                                    新的
                                    <input type="radio" name="report.reportTypeNew" value="已知">
                                    已知
                                </td>

                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告单位类别：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="reportOrganizationRadio" value="医疗机构" checked="checked">
                                    医疗机构
                                    <input type="radio" name="reportOrganizationRadio" value="经营机构">
                                    经营机构
                                    <input type="radio" name="reportOrganizationRadio" value="经营企业">
                                    经营企业
                                    <input type="radio" name="reportOrganizationRadio" value="其他">
                                    其他
                                    <input style="display: none;width: 400px;" class="form-control" name="report.reportOrganization" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">患者姓名：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="hidden" name="report.patientId" value="" readonly>
                                    <input style="width: 200px;" class="form-control" type="text" name="report.patientName" value="蔡佩华" readonly>
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">性别：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.sex" value="女" readonly>
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">出生日期：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.birthday" value="1955年10月2日" readonly>
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">民族：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.nationality" value="汉族" >
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">体重：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input style="width: 100px;float: left;" class="form-control" type="number" name="report.weight" value="" >
                                    <%--<input style="width: 80px;" class="form-control" type="text" value="千克" >--%>

                                    <span style="margin-top: 8px;width: 80px;margin-left: 10px;float: left;">千克</span>
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">联系方式：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input style="width: 400px;" class="form-control" type="text" name="report.contact" value="" >
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">原患疾病（多个疾病用“|”分隔）：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input style="width: 400px;" class="form-control" type="text" name="report.originalDisease" value="" >
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">医院名称：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.hospitalName" value="" >
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">病历号/门诊号：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.medicalRecordId" value="" >
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">既往药品不良反应/事件：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="previousAdrRadio" value="有" />
                                    有
                                    <textarea style="display: none;resize: vertical;width: 400px;" class="form-control" onblur="setTextarea2Input(this)" id="previousAdrTextarea" style="width: 200px" rows="1"></textarea>
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.previousAdr" value="" />

                                    <input type="radio" name="previousAdrRadio" value="无" />
                                    无
                                    <input type="radio" name="previousAdrRadio" value="不详" checked="checked" />
                                    不详
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">家族药品不良反应/事件：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input type="radio" name="familyAdrRadio" value="有" />
                                    有
                                    <textarea style="display: none;resize: vertical;width: 400px;" class="form-control" onblur="setTextarea2Input(this)" id="familyAdrTextarea" style="width: 200px" rows="1"></textarea>
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.familyAdr" value="" />

                                    <input type="radio" name="familyAdrRadio" value="无"/>
                                    无
                                    <input type="radio" name="familyAdrRadio" value="不详" checked="checked" />
                                    不详
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">相关重要信息：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="checkbox" id="smokingHistoryCB" onclick="setImportantInfo(this)" value="吸烟史">
                                    <input type="hidden" name="report.smokingHistory" value="">
                                    吸烟史
                                    <input type="checkbox" id="drinkingHistoryCB" onclick="setImportantInfo(this)" value="饮酒史" >
                                    <input type="hidden" name="report.drinkingHistory" value="">
                                    饮酒史
                                    <input type="checkbox" id="pregnancyHistoryCB" onclick="setImportantInfo(this)" value="妊娠期" >
                                    <input type="hidden" name="report.pregnancyHistory" value="">
                                    妊娠期
                                    <input type="checkbox" id="hepatopathyHistoryCB" onclick="setImportantInfo(this)" value="肝病史" >
                                    <input type="hidden" name="report.hepatopathyHistory" value="">
                                    肝病史
                                    <input type="checkbox" id="nephromaHistoryCB" onclick="setImportantInfo(this)" value="肾病史" >
                                    <input type="hidden" name="report.nephromaHistory" value="">
                                    肾病史
                                    <input type="checkbox" id="allergyHistoryCB" onclick="setImportantInfo(this)" value="过敏史">
                                    过敏史
                                    <textarea style="width: 400px;display: none;" onblur="setTextarea2Input(this)" class="form-control" id="allergyHistoryTextarea" rows="3"></textarea>
                                    <input type="hidden" name="report.allergyHistory" value="">
                                    <input type="checkbox" id="otherHistoryCB" onclick="setImportantInfo(this)" value="其他">
                                    其他
                                    <textarea style="width: 400px;display: none;" onblur="setTextarea2Input(this)" class="form-control" id="otherHistoryTextarea" rows="3"></textarea>
                                    <input type="hidden" name="report.otherHistory" value="">
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">可疑药品：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="hidden" name="suspiciousNum" value="0" />
                                    <button id="addSuspiciousDrugButton" onclick="openSearchOrders('1')" type="button" class="btn btn-success" data-dismiss="modal">增加</button>
                                </td>
                            </tr>
                        </table>

                        <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="deleteTH"></th>
                                    <th>批准文号</th>
                                    <th>商品名称</th>
                                    <th>通用名称</th>
                                    <th style="width: 40px;">剂型</th>
                                    <th>生产厂家</th>
                                    <th style="width:70px;">生产批号</th>
                                    <th>剂量</th>
                                    <th style="width: 40px;">单位</th>
                                    <th style="width: 40px;">途径</th>
                                    <th style="width: 40px;">频次</th>
                                    <th>开始日期</th>
                                    <th>结束日期</th>
                                    <th style="width: 62px;">用药原因</th>
                                </tr>
                            </thead>
                            <tbody id="suspiciousDrugTable">
                            </tbody>
                        </table>

                        <table class="table table-condensed reportTable">
                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">并用药品：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="hidden" name="combinedNum" value="0" />
                                    <button id="addCombinedDrugButton" onclick="openSearchOrders('2')" type="button" class="btn btn-success" data-dismiss="modal">增加</button>
                                </td>
                            </tr>
                        </table>

                        <table width="100%;" style="font-size: 12px" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="deleteTH"></th>
                                <th>批准文号</th>
                                <th>商品名称</th>
                                <th>通用名称</th>
                                <th style="width: 40px;">剂型</th>
                                <th>生产厂家</th>
                                <th style="width:70px;">生产批号</th>
                                <th>剂量</th>
                                <th style="width: 40px;">单位</th>
                                <th style="width: 40px;">途径</th>
                                <th style="width: 40px;">频次</th>
                                <th>开始日期</th>
                                <th>结束日期</th>
                                <th style="width: 62px;">用药原因</th>
                            </tr>
                            </thead>
                            <tbody id="combinedDrugTable">
                            </tbody>
                        </table>

                        <table class="table table-condensed reportTable">
                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">不良反应/事件名称：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.adrName" value="" >
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">不良反应/事件发生时间：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" name="report.adrDate" readonly="readonly"
                                           class="notFocus Wdate inTime longInput-in-radio-row endDate"
                                           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                           style="cursor: pointer;border-radius: 3px;width:187px;height: 34px;margin-top: 0px;padding-left: 5px;"
                                           >
                                </td>
                            </tr>
                            <tr>
                                <th colspan="4" style="vertical-align: middle;height: 44px;text-align: left;">
                                    不良反应/事件过程描述（包括症状、体征、临床检验等）及处理情况：
                                    <button id="chooseAdrDescriptionTemplate" onclick="chooseAdrDescTemplate()" type="button" class="btn btn-success" data-dismiss="modal">使用模板构建描述</button>
                                </th>

                            </tr>
                            <tr>
                                <td style="vertical-align: middle;height: 44px;" colspan="4">
                                    <textarea style="width: 100%;resize: vertical;" onblur="setTextarea2Input(this)" class="form-control" id="adrDescriptionTextarea" rows="3"></textarea>
                                    <input name="report.adrDescription" value="" type="hidden">
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">不良反应/事件的结果：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="adrResultRadio" value="痊愈">
                                    痊愈
                                    <input type="radio" name="adrResultRadio" value="好转">
                                    好转
                                    <input type="radio" name="adrResultRadio" value="未好转">
                                    未好转
                                    <input type="radio" name="adrResultRadio" value="不详">
                                    不详
                                    <input type="radio" name="adrResultRadio" value="有后遗症">
                                    有后遗症
                                    <span id="sequelaLabel" style="display: none;">表现：</span>
                                    <textarea style="display: none;" class="form-control" onblur="setAdrResultTextarea2Input(this)" id="sequelaTextarea" style="width: 200px" rows="2"></textarea>
                                    <input type="radio" name="adrResultRadio" value="死亡">
                                    死亡
                                    <span id="deathCauseLabel" style="display: none;">直接死因：</span>
                                    <textarea style="display: none;" class="form-control" onblur="setAdrResultTextarea2Input(this)" id="deathCauseTextarea" style="width: 200px" rows="2"></textarea>
                                    <span id="deathDateLabel" style="display: none;">死亡时间：</span>
                                    <input type="text" id="deathDate" readonly="readonly"
                                           class="notFocus Wdate inTime longInput-in-radio-row endDate"
                                           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                           style="display: none;cursor: pointer;border-radius: 3px;width:187px;height: 34px;margin-top: 0px;padding-left: 5px;"
                                           onblur="setAdrResultTextarea2Input(this)"
                                           >
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.adrResult" value="" />
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.deathDate" value="" />
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.deathCause" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">停药或减量后，反应/事件是否消失或减轻？</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="disappearBetterRadio" value="是">
                                    是
                                    <input type="radio" name="disappearBetterRadio" value="否">
                                    否
                                    <input type="radio" name="disappearBetterRadio" value="不明">
                                    不明
                                    <input type="radio" name="disappearBetterRadio" value="未停药或未减量">
                                    未停药或未减量
                                    <input type="hidden" name="report.disappearBetter" value="">
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">再次使用可疑药品后是否再次出现同样反应/事件？</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="appearAgainRadio" value="是">
                                    是
                                    <input type="radio" name="appearAgainRadio" value="否">
                                    否
                                    <input type="radio" name="appearAgainRadio" value="不明">
                                    不明
                                    <input type="radio" name="appearAgainRadio" value="未停药或未减量">
                                    未停药或未减量
                                    <input type="hidden" name="report.appearAgain" value="">
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">对原患疾病的影响：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="originalDiseaseEffectRadio" value="不明显">
                                    不明显
                                    <input type="radio" name="originalDiseaseEffectRadio" value="病程延长">
                                    病程延长
                                    <input type="radio" name="originalDiseaseEffectRadio" value="病情加重">
                                    病情加重
                                    <input type="radio" name="originalDiseaseEffectRadio" value="导致后遗症">
                                    导致后遗症
                                    <input type="radio" name="originalDiseaseEffectRadio" value="导致死亡">
                                    导致死亡
                                    <input type="hidden" name="report.originalDiseaseEffect" value="">
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">关联性评价-报告人评价：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="relevanceEvaluation1Radio" value="肯定">
                                    肯定
                                    <input type="radio" name="relevanceEvaluation1Radio" value="很可能">
                                    很可能
                                    <input type="radio" name="relevanceEvaluation1Radio" value="可能">
                                    可能
                                    <input type="radio" name="relevanceEvaluation1Radio" value="可能无关">
                                    可能无关
                                    <input type="radio" name="relevanceEvaluation1Radio" value="待评价">
                                    待评价
                                    <input type="radio" name="relevanceEvaluation1Radio" value="无法评价">
                                    无法评价
                                    <input type="hidden" name="report.relevanceEvaluation1" value="">
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">关联性评价-报告单位评价：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="relevanceEvaluation2Radio" value="肯定">
                                    肯定
                                    <input type="radio" name="relevanceEvaluation2Radio" value="很可能">
                                    很可能
                                    <input type="radio" name="relevanceEvaluation2Radio" value="可能">
                                    可能
                                    <input type="radio" name="relevanceEvaluation2Radio" value="可能无关">
                                    可能无关
                                    <input type="radio" name="relevanceEvaluation2Radio" value="待评价">
                                    待评价
                                    <input type="radio" name="relevanceEvaluation2Radio" value="无法评价">
                                    无法评价
                                    <input type="hidden" name="report.relevanceEvaluation2" value="">
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告人姓名：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input class="form-control" type="hidden" name="report.reporterId" value="" >
                                    <input style="width: 200px;" class="form-control" type="text" name="report.reporterName" value="" >
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告人科室：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input class="form-control" type="hidden" name="report.reporterDeptCode" value="" >
                                    <input style="width: 200px;" class="form-control" type="text" name="report.reporterDeptName" value="" >
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告人联系电话：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.reporterTelephone" value="" >
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告人电子邮箱：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.reporterEmail" value="" >
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告人职业：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="reporterProfessionRadio" value="医生">
                                    医生
                                    <input type="radio" name="reporterProfessionRadio" value="药师">
                                    药师
                                    <input type="radio" name="reporterProfessionRadio" value="护士">
                                    护士
                                    <input type="radio" name="reporterProfessionRadio" value="其他">
                                    其他
                                    <textarea style="display: none;" class="form-control" onblur="setTextarea2Input(this)" id="reporterProfessionTextarea" style="width: 200px" rows="3"></textarea>
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.reporterProfession" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告单位名称：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.organizationName" value="" >
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告单位联系人：</th>
                                <td style="vertical-align: middle;height: 44px;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.organizationContactPerson" value="" >
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告单位电话：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input style="width: 200px;" class="form-control" type="text" name="report.organizationTelephone" value="" >
                                </td>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">报告日期：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" name="report.reportDate" readonly="readonly"
                                           class="notFocus Wdate inTime longInput-in-radio-row endDate"
                                           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                           style="cursor: pointer;border-radius: 3px;width:200px;height: 34px;margin-top: 0px;padding-left: 5px;"
                                    >
                                </td>
                            </tr>

                            <!--
                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">生产企业请填写信息来源：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="producerInfoSourceRadio" value="医疗机构">
                                    医疗机构
                                    <input type="radio" name="producerInfoSourceRadio" value="经营企业">
                                    经营企业
                                    <input type="radio" name="producerInfoSourceRadio" value="个人">
                                    个人
                                    <input type="radio" name="producerInfoSourceRadio" value="文献报道">
                                    文献报道
                                    <input type="radio" name="producerInfoSourceRadio" value="上市后研究">
                                    上市后研究
                                    <input type="radio" name="producerInfoSourceRadio" value="其他">
                                    其他
                                    <textarea style="display: none;width: 100%;resize: vertical;" class="form-control" onblur="setTextarea2Input(this)" id="producerInfoSourceTextarea" style="width: 200px" rows="3"></textarea>
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.producerInfoSource" value="" />
                                </td>
                            </tr>
                            -->

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 200px;">备注：</th>
                                <td colspan="3" style="vertical-align: middle;height: 44px;text-align: left;">
                                    <textarea style="width: 100%;resize: vertical;" class="form-control" onblur="setTextarea2Input(this)" id="remarkTextarea" style="width: 200px" rows="3"></textarea>
                                    <input style="display: none;" type="text" style="width: 200px" class="form-control" name="report.remark" value="" />
                                </td>
                            </tr>

                        </table>


                    </form>
                </div>
            </div>



            <div class="modal-footer modal-footer_scroll">
                <button style="float: right;margin-left: 10px;" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button style="float: right;margin-left: 10px;" type="button" id="saveReportButton" class="btn btn-success" onclick="saveReport()" >保存</button>
                <button style="float: right;margin-left: 10px;" type="button" id="modifyReportButton" class="btn btn-primary" onclick="modifyReport()">修改</button>
                <%--<button style="float: right;margin-left: 10px;" type="button" id="exportReportButton" class="btn btn-warning" onclick="modifyReport()">导出</button>--%>
                <button style="float: right;margin-left: 10px;" type="button" id="uploadReportButton" class="btn btn-danger" onclick="uploadReport()" >上传</button>
            </div>
        </div>
    </div>
</div>

<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
</body>
</html>

