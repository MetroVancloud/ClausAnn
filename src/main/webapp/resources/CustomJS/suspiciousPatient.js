
/**
 * 进入患者详情页
 * @param contextPath
 * @param patientId
 */
function toPatientDetail(contextPath, patientId, ruleId, monitorDate) {
    var iWidth = 1000; //窗口宽度
    var iHeight = 700;//窗口高度
    var iTop = (window.screen.height - iHeight - 60) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;

    var url = contextPath + "/suspiciousPatient/detail.do?patientId=" + patientId + "&ruleId=" + ruleId + "&monitorDate=" + monitorDate;

    window.open(url, "suspiciousPatientDetail", "status=yes, Scrollbars=yes,Toolbar=no,Location=no,Direction=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}

/**
 * 在患者详情页选择菜单
 * @param para
 * @param obj
 */
function selectCategory(para, obj) {
    if (para == 1) {
        $('#patient_info').css("display", "block");
        $('#monitor_info').css("display", "none");
        $('#lis_info').css("display", "none");
        $('#orders_info').css("display", "none");
    } else if (para == 2) {
        $('#patient_info').css("display", "none");
        $('#monitor_info').css("display", "block");
        $('#lis_info').css("display", "none");
        $('#orders_info').css("display", "none");
    } else if (para == 3) {
        $('#patient_info').css("display", "none");
        $('#monitor_info').css("display", "none");
        $('#lis_info').css("display", "block");
        $('#orders_info').css("display", "none");

        //getDateMenu(patVisit.patient_id, patVisit.visit_id)
    } else if (para == 4) {
        $('#patient_info').css("display", "none");
        $('#monitor_info').css("display", "none");
        $('#lis_info').css("display", "none");
        $('#orders_info').css("display", "block");
    }
    $(obj).parent().find("td").removeClass('selected');
    $(obj).addClass('selected');
}

/**
 * 检验数据菜单以及数据内容部分
 * *********************************————————————开始————————————————**************************
 */

function getMenu(item, isFirstMenu) {
    if (item == '0') {
        $("#secondMenu").html("<option selected value='0'>检验项目（二级菜单）</option>");
        return;
    }

    var ptno = $('#ptno').attr("value");
    AjaxInterface.getMenu(ptno, item, function (blMessage) {
        if (blMessage.success) {
//            alert(blMessage.message);
            if (isFirstMenu == 0) {
                loadMenu(blMessage.data, "secondMenu", isFirstMenu);
            }
            else {
                loadMenu(blMessage.data, "firstMenu", isFirstMenu);
            }
        }
        else {
            alert(blMessage.message);
        }
    })
}


function loadMenu(menuList, menuId, isFirstMenu) {
    var menuString = "#" + menuId;
    $(menuString).html("");
    if (isFirstMenu == 0) {
//        $(menuString).append("<option selected value='0'>检验项目（二级菜单）</option>");
    }
    else {
        $(menuString).append("<option selected value='0'>检验项目（一级菜单）</option>");
    }

    if (menuList == null) return;
    for (var i = 0; i < menuList.length; i++) {
        var menu = menuList[i];
        if (menu != null)
            $(menuString).append("<option value='" + menu + "' >" + menu + "</option>");
    }

    $("#secondMenu").multiselect('refresh');
}

function getGph() {

    var firstMenuValue = $("#firstMenu").val();
    var secondMenuValue = $("#secondMenu").val();

    if (secondMenuValue == null || secondMenuValue.length == 0) {
        alert("请选择检验数据！");
        return;
    }

    if (secondMenuValue.length > 1) {
        alert("只能选择一项检验数据");
        return;
    }
    var ptno = $("#ptno").attr("value");

    AjaxInterface.getData(firstMenuValue, secondMenuValue, ptno, function (blMessage) {
        if (blMessage.success) {
            $("#containerLisResult").show();
            loadLisResult(blMessage.data);
            if (blMessage.data == null || blMessage.data.length == 0) {
                $("#containerLisResult").html("");
            }
            try {
                drawTestResultCharts(blMessage.data, "containerLisResult", firstMenuValue, secondMenuValue);
            } catch (e) {
                alert("所选项无法画图");
                $("#containerLisResult").html("");
            } finally {
                $("#containerLisResult").show();
                $("#lisResults").css("display", "none");
                $("#lisGraph").show();
                $("#lisTable").show();
                $("#lisGraph").html("隐藏趋势图");
                $("#lisTable").html("生成数值表");
            }
        }
        else {
            alert(blMessage.message);
        }
    })
}


function getData() {
    var firstMenuValue = $("#firstMenu").val();
    var secondMenuValue = $("#secondMenu").val();
    var ptno = $("#ptno").attr("value");

    if (secondMenuValue == null || secondMenuValue.length == 0) {
        alert("请选择检验数据！");
        return;
    }

    AjaxInterface.getData(firstMenuValue, secondMenuValue, ptno, function (blMessage) {
        if (blMessage.success) {
//            alert(blMessage.message);
            $("#containerLisResult").show();
            loadLisResult(blMessage.data);
            if (blMessage.data == null || blMessage.data.length == 0) {
                $("#containerLisResult").html("");
            }
            try {
//                drawTestResultCharts(blMessage.data,"containerLisResult",firstMenuValue,secondMenuValue);
            } catch (e) {
                alert("所选项无法画图");
                $("#containerLisResult").html("");
            } finally {
                $("#containerLisResult").css("display", "none");
                $("#lisResults").show();
                $("#lisGraph").show();
                $("#lisTable").show();
                $("#lisGraph").html("生成趋势图");
                $("#lisTable").html("隐藏数值表");
                $("#lisGraph").css("display", "none");

            }

        }
        else {
//            alert('所选项无法生成趋势图');
            alert(blMessage.message);
        }
    })
}


function getDateMenu(patientId, visitId, type) {
    if (type == undefined) type = 0;
    AjaxInterface.getTestDate(patientId, visitId, type, function (blMessage) {
        var dataList = blMessage.data;
        var $timeMenu = $("#timeMenu tbody");
        $timeMenu.html("");

        for (var i = 0; i < dataList.length; i++) {
            var date = dataList[i];
            var dataShow = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()
                + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
            ;
            $timeMenu.append("<tr onclick='chooseFirstMenu(this," + type + ")'><td>" + dataShow + "</td></tr>")
        }
    })
}

/*
 * 检验数据菜单以及数据内容部分
 * *********************************————————————结束————————————————**************************
 */


/**
 * 对监测到的患者做标记
 * @param id
 * @param state 0-待判断；1-已排除；2-不良反应；
 * @param patientId 患者号 用于查询患者信息
 * @param ruleId 监测到这个患者的主题 id
 */
function markState(id, state, patientId, ruleId, monitorDate) {
    $("input[name='suspiciousPatientId']").val(id);
    $("input[name='patientId']").val(patientId);
    $("input[name='ruleId']").val(ruleId);
    $("input[name='suspiciousPatient.state']").val(state);
    $("input[name='suspiciousPatient_monitorDate']").val(monitorDate);


    if ("0" == state) {
        //  打开标记状态的弹框

        $("#markStateModal").modal('show');
    } else if ("1" == state) {

    } else {
        if ("2" == state) {
            $("#reportButton").html("填写不良反应报告");
            $("#adviceButton").html("发起用药建议");
        } else if ("3" == state) {
            $("#reportButton").html("查看不良反应报告");
            $("#adviceButton").html("发起用药建议");
        } else if ("4" == state) {
            $("#reportButton").html("填写不良反应报告");
            $("#adviceButton").html("查看用药建议");
        } else if ("5" == state) {
            $("#reportButton").html("查看不良反应报告");
            $("#adviceButton").html("查看用药建议");
        }
        $("#chooseOperationModal").modal('show');
    }
}

/**
 * 打开生成不良反应报告
 * @param patientId
 * @param ruleId
 */
function toGenerateReportPage() {
    emptyReport();      //  清空报告页面
    var state = $("input[name='suspiciousPatient.state']").val();
    if ("2" == state || "4" == state) {
        openNewReport();
    } else {
        openSavedReportInSuspiciousPatientListPage();
    }

}

/**
 * 填写一份新的报告
 */
function openNewReport() {
    $("#generateReportModal input").removeAttr("disabled");
    $("#saveReportButton").removeClass("disabled");
    $("#modifyReportButton").css("display", "none");
    $("#uploadReportButton").css("display", "none");
    $("#addSuspiciousDrugButton").removeClass("disabled");
    $("#addCombinedDrugButton").removeClass("disabled");
    $("#exportReportButton").css("display", "none");

    var patientId = $("input[name='patientId']").val();
    var ruleId = $("input[name='ruleId']").val();
    var url = "report/toCreateOneReport.do?patientId=" + patientId + "&ruleId=" + ruleId;


    $.ajax({
        type: 'get',
        url: url,
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({suspiciousPatientId: suspiciousPatientId, state: state}),
        success: function (data) {
            if (data.success) {
                var patVisit = data.data.patVisit;
                var reportCode = data.data.reportCode;
                var rule = data.data.rule;
                $("input[name='report.patientId']").val(patVisit.patientId);
                $("input[name='report.patientName']").val(patVisit.patientName);
                $("input[name='report.sex']").val(patVisit.patientSex);
                $("input[name='report.birthday']").val(new Date(patVisit.birthday).format('yyyy-MM-dd'));
                $("input[name='report.nationality']").val(patVisit.nation);
                $("input[name='report.weight']").val(patVisit.bodyWeight);
                $("input[name='report.contact']").val(replaceNull(patVisit.nextOfKinPhone) + replaceNull(patVisit.mailingAddress));
                $("input[name='report.medicalRecordId']").val(patVisit.patientId);
                $("input[name='report.reportCode']").val(reportCode);
                $("input[name='report.patientDeptCode']").val(patVisit.deptAdmissionToCode);
                $("input[name='report.patientDeptName']").val(patVisit.deptAdmissionToName);
                $("input[name='report.monitorRuleId']").val(rule.id);
                $("input[name='report.monitorRuleName']").val(rule.ruleName);

                /**
                 * 补充默认信息
                 */
                var user = data.data.user;
                var reporterOrganizationName = data.data.reporterOrganizationName;
                var organizationContactPerson = data.data.organizationContactPerson;
                var organizationContactPhoneNum = data.data.organizationContactPhoneNum;

                //  医院名称
                $("input[name='report.hospitalName']").val(reporterOrganizationName);

                //  报告单位名称
                $("input[name='report.organizationName']").val(reporterOrganizationName);

                //  报告单位联系人
                $("input[name='report.organizationContactPerson']").val(organizationContactPerson);

                //  报告单位电话
                $("input[name='report.organizationTelephone']").val(organizationContactPhoneNum);

                //  报告人职业
                var reporterProfession = user.occupation;
                $("input[name='report.reporterProfession']").val(reporterProfession);
                $("#reporterProfessionTextarea").val(reporterProfession);
                if ("医生" == reporterProfession || "药师" == reporterProfession || "护士" == reporterProfession) {
                    $(":radio[name='reporterProfessionRadio'][value='" + reporterProfession + "']").prop("checked", "checked");
                    $("#reporterProfessionTextarea").val('');
                    $("#reporterProfessionTextarea").css('display', 'none');
                } else {
                    $(":radio[name='reporterProfessionRadio'][value='其他']").prop("checked", "checked");
                    $("#reporterProfessionTextarea").css('display', 'block');
                }

                //  报告人姓名
                $("input[name='report.reporterName']").val(user.userName);

                //  报告人科室
                $("input[name='report.reporterDeptName']").val(user.deptName);

                //  报告人联系电话
                $("input[name='report.reporterTelephone']").val(user.telephoneNumber);

                //  报告人电子邮箱
                $("input[name='report.reporterEmail']").val(user.email);

                //  报告日期
                $("input[name='report.reportDate']").val(new Date().format('yyyy-MM-dd'));

                //  不良反应/事件发生时间
                var adrDate = $("input[name='suspiciousPatient_monitorDate']").val();
                $("input[name='report.adrDate']").val(new Date(adrDate).format('yyyy-MM-dd'));

                //  不良反应/事件名称：
                $("input[name='report.adrName']").val(rule.ruleName.replace(/主题/g, "") + "相关不良反应");

                //  家族药品不良反应/事件
                $("input[type='radio'][name='familyAdrRadio'][value='不祥']").attr("checked", "checked");

                //  既往药品不良反应/事件
                $("input[type='radio'][name='previousAdrRadio'][value='不祥']").attr("checked", "checked");

                //  报告单位类别
                $("input[type='radio'][name='reportOrganizationRadio'][value='医疗机构']").prop("checked", 'true');

            } else {
                alert(data.message);
            }
        }
    });


    $("#chooseOperationModal").modal('hide');
    $("#generateReportModal").modal('show');
}

/**
 * 查看一份已保存的报告
 */
function openSavedReportInSuspiciousPatientListPage() {
    var suspiciousPatientId = $("input[name='suspiciousPatientId']").val();
    openSavedReport(suspiciousPatientId)
}

function setReport(report) {
    $("input[name='report.monitorRuleId']").val(report.monitorRuleId);
    $("input[name='report.monitorRuleName']").val(report.monitorRuleName);
    $("input[name='report.patientDeptCode']").val(report.patientDeptCode);
    $("input[name='report.patientDeptName']").val(report.patientDeptName);
    $("input[name='report.id']").val(report.id);
    $("input[name='report.reportImmediacy'][value='"+report.reportImmediacy+"']").attr("checked",true);
    $("input[name='report.reportCode']").val(report.reportCode);
    $("input[name='report.reportTypeNew'][value='"+report.reportTypeNew+"']").attr("checked",true);
    $("input[name='report.reportTypeSerious'][value='"+report.reportTypeSerious+"']").attr("checked",true);
    if ("严重" == report.reportTypeSerious) {
        $("#reportSeriousContentTextarea").parent().css('display', '');
        $("#reportSeriousContentTextarea").parent().prev().css('display', '');
        $("#reportSeriousContentTextarea").text(report.reportSeriousContent);
        $("input[name='report.reportSeriousContent']").val(report.reportSeriousContent);
    } else {
        $("#reportSeriousContentTextarea").parent().css('display', 'none');
        $("#reportSeriousContentTextarea").parent().prev().css('display', 'none');
        $("#reportSeriousContentTextarea").val("");
        $("input[name='report.reportSeriousContent']").val("");
    }


    /**
     * 设置报告单位类别
     */
    var reportOrganization = report.reportOrganization;
    $("input[name='report.reportOrganization']").val(reportOrganization);
    if ("医疗机构" == reportOrganization || "经营机构" == reportOrganization || "经营企业" == reportOrganization) {
        $(":radio[name='reportOrganizationRadio'][value='" + reportOrganization + "']").prop("checked", "checked");
        $("input[name='report.reportOrganization']").css('display', 'none');
    } else {
        $(":radio[name='reportOrganizationRadio'][value='其他']").prop("checked", "checked");
        $("input[name='report.reportOrganization']").css('display', 'block');
    }

    $("input[name='report.patientId']").val(report.patientId);
    $("input[name='report.patientName']").val(report.patientName);
    $("input[name='report.sex']").val(report.sex);
    $("input[name='report.birthday']").val(new Date(report.birthday).format('yyyy-MM-dd'));
/*
    $("input[name='report.age']").val(report.age);
*/
    $("input[name='report.nationality']").val(report.nationality);
    $("input[name='report.weight']").val(report.weight);
    $("input[name='report.contact']").val(report.contact);
    $("input[name='report.originalDisease']").val(report.originalDisease);
    $("input[name='report.hospitalName']").val(report.hospitalName);
    $("input[name='report.medicalRecordId']").val(report.medicalRecordId);

    /**
     * 设置既往药物不良反应/事件
     */
    var previousAdr = report.previousAdr;
    $("input[name='report.previousAdr']").val(previousAdr);
    $("#previousAdrTextarea").val(previousAdr);
    if ("无" == previousAdr || "不祥" == previousAdr) {
        $(":radio[name='previousAdrRadio'][value='" + previousAdr + "']").prop("checked", "checked");
        $("#previousAdrTextarea").val('');
        $("#previousAdrTextarea").css('display', 'none');
    } else {
        $(":radio[name='previousAdrRadio'][value='有']").prop("checked", "checked");
        $("#previousAdrTextarea").css('display', 'block');

    }
    /**
     * 设置家族药物不良反应/事件
     */
    var familyAdr = report.familyAdr;
    $("input[name='report.familyAdr']").val(familyAdr);
    $("#familyAdrTextarea").val(familyAdr);
    if ("无" == familyAdr || "不祥" == familyAdr) {
        $(":radio[name='familyAdrRadio'][value='" + familyAdr + "']").prop("checked", "checked");
        $("#familyAdrTextarea").val('');
        $("#familyAdrTextarea").css('display', 'none');
    } else {
        $(":radio[name='familyAdrRadio'][value='有']").prop("checked", "checked");
        $("#familyAdrTextarea").css('display', 'block');

    }

    /**
     * 设置重要信息：吸烟史、饮酒史、妊娠期、肝病史、肾病史、过敏史、其他
     * smokingHistory
     * drinkingHistory
     * pregnancyHistory
     * hepatopathyHistory
     * nephromaHistory
     * allergyHistory
     * otherHistory
     */
    var infoList = new Array('smokingHistory', 'drinkingHistory', 'pregnancyHistory', 'hepatopathyHistory', 'nephromaHistory', 'allergyHistory', 'otherHistory');
    for (var i = 0; i < infoList.length; i++) {
        var infoItem = infoList[i];
        if (i < infoList.length - 2) {
            if ('1' == report[infoItem]) {
                $("#"+infoItem+"CB").attr("checked", 'true');
                $("input[name='report."+infoItem+"']").val("1");
            } else {
                $("#"+infoItem+"CB").removeAttr("checked");
                $("input[name='report."+infoItem+"']").val("0");
            }
        } else {
            if ('0' != report[infoItem] && undefined != report[infoItem] && '' != report[infoItem] && null != report[infoItem] && 'null' != report[infoItem]) {
                $("#"+infoItem+"CB").attr("checked", 'true');
                $("input[name='report."+infoItem+"']").val(report[infoItem]);
                $("#"+infoItem+"Textarea").val(report[infoItem]);
                $("#"+infoItem+"Textarea").css("display", 'block');
            } else {
                $("#"+infoItem+"CB").removeAttr("checked");
                $("input[name='report."+infoItem+"']").val('');
                $("#"+infoItem+"Textarea").val('');
            }
        }
    }

    $("input[name='report.adrName']").val(report.adrName);
    $("input[name='report.adrDate']").val(report.adrDate);
    $("#adrDescriptionTextarea").val(report.adrDescription);
    $("input[name='report.adrDescription']").val(report.adrDescription);

    /**
     * 设置不良反应/事件结果
     */
    var adrResult = replaceNull(report.adrResult);
    var deathCause = replaceNull(report.deathCause);
    var deathDate = replaceNull(report.deathDate);
    $("input[name='report.adrResult']").val(report.adrResult);
    $("input[name='report.deathCause']").val(report.deathCause);
    $("input[name='report.deathDate']").val(report.deathDate);
    $(":radio[name='adrResultRadio'][value='"+adrResult+"']").prop("checked", "checked");

    if (adrResult == "有后遗症") {
        $("#sequelaLabel").css("display", "block");
        $("#sequelaTextarea").val(deathCause);
        $("#sequelaTextarea").css('display', 'block');
        $("#deathCauseLabel").css('display', 'none');
        $("#deathCauseTextarea").css('display', 'none');
        $("#deathCauseTextarea").val('');
        $("#deathDateLabel").css("display", "none");
        $("#deathDate").css("display", "none");
        $("#deathDate").val("");
    } else if (adrResult == "死亡"){
        $("#sequelaLabel").css("display", "none");
        $("#sequelaTextarea").val('');
        $("#sequelaTextarea").css('display', 'none');
        $("#deathCauseLabel").css('display', 'block');
        $("#deathCauseTextarea").css('display', 'block');
        $("#deathCauseTextarea").val(deathCause);
        $("#deathDateLabel").css("display", "block");
        $("#deathDate").css("display", "block");
        $("#deathDate").val(deathDate);
    } else {
        $("#sequelaLabel").css("display", "none");
        $("#sequelaTextarea").val('');
        $("#sequelaTextarea").css('display', 'none');
        $("#deathCauseLabel").css('display', 'none');
        $("#deathCauseTextarea").css('display', 'none');
        $("#deathCauseTextarea").val('');
        $("#deathDateLabel").css("display", "none");
        $("#deathDate").css("display", "none");
        $("#deathDate").val('');
    }

    $(":radio[name='disappearBetterRadio'][value='" + report.disappearBetter + "']").prop("checked", "checked");
    $("input[name='report.disappearBetter']").val(report.disappearBetter);

    $(":radio[name='appearAgainRadio'][value='" + report.appearAgain + "']").prop("checked", "checked");
    $("input[name='report.appearAgain']").val(report.appearAgain);

    $(":radio[name='originalDiseaseEffectRadio'][value='" + report.originalDiseaseEffect + "']").prop("checked", "checked");
    $("input[name='report.originalDiseaseEffect']").val(report.originalDiseaseEffect);

    $(":radio[name='relevanceEvaluation1Radio'][value='" + report.relevanceEvaluation1 + "']").prop("checked", "checked");
    $("input[name='report.relevanceEvaluation1']").val(report.relevanceEvaluation1);

    $(":radio[name='relevanceEvaluation2Radio'][value='" + report.relevanceEvaluation2 + "']").prop("checked", "checked");
    $("input[name='report.relevanceEvaluation2']").val(report.relevanceEvaluation2);

    $("input[name='report.reporterId']").val(report.reporterId);
    $("input[name='report.reporterName']").val(report.reporterName);
    $("input[name='report.reporterDeptCode']").val(report.reporterDeptCode);
    $("input[name='report.reporterDeptName']").val(report.reporterDeptName);
    $("input[name='report.reporterTelephone']").val(report.reporterTelephone);
    $("input[name='report.reporterEmail']").val(report.reporterEmail);

    var reporterProfession = report.reporterProfession;
    $("input[name='report.reporterProfession']").val(reporterProfession);
    $("#reporterProfessionTextarea").val(reporterProfession);
    if ("医生" == reporterProfession || "药师" == reporterProfession || "护士" == reporterProfession) {
        $(":radio[name='reporterProfessionRadio'][value='" + reporterProfession + "']").prop("checked", "checked");
        $("#reporterProfessionTextarea").val('');
        $("#reporterProfessionTextarea").css('display', 'none');
    } else {
        $(":radio[name='reporterProfessionRadio'][value='其他']").prop("checked", "checked");
        $("#reporterProfessionTextarea").css('display', 'block');
    }

    $("input[name='report.organizationName']").val(report.organizationName);
    $("input[name='report.organizationContactPerson']").val(report.organizationContactPerson);
    $("input[name='report.organizationTelephone']").val(report.organizationTelephone);
    $("input[name='report.reportDate']").val(report.reportDate);

    var producerInfoSource = report.producerInfoSource;
    $("input[name='report.producerInfoSource']").val(producerInfoSource);
    if ("医疗机构" == producerInfoSource || "经营企业" == producerInfoSource || "个人" == producerInfoSource
        || "文献报道" == producerInfoSource || "上市后研究" == producerInfoSource) {
        $(":radio[name='producerInfoSourceRadio'][value='" + producerInfoSource + "']").prop("checked", "checked");
        $("#producerInfoSourceTextarea").val('');
        $("#producerInfoSourceTextarea").css('display', 'none');
    } else {
        $(":radio[name='producerInfoSourceRadio'][value='其他']").prop("checked", "checked");
        $("#producerInfoSourceTextarea").css('display', 'block');
    }

    $("input[name='report.remark']").val(report.remark);
    $("#remarkTextarea").val(report.remark);


}

function setReportDrugList(reportDrugList) {
    var suspiciousDrugList = "", combinedDrugList = "";
    var suspiciousNum = 0, combinedNum = 0;
    if (null != reportDrugList && reportDrugList.length > 0) {
        for (var i = 0; i < reportDrugList.length; i++) {
            var listName;
            if ('1' == reportDrugList[i].flag) {
                listName = "suspiciousDrugList[" + suspiciousNum + "]";
            } else {
                listName = "combinedDrugList[" + combinedNum + "]";
            }
            var temp = "" +
                "<tr>" +
                "\t<td><p onclick=\"deleteOneDrug(this)\" class=\"fa fa-times deleteOneDrug\"></p></td>\n" +

                "\t<td style='display: none;'>"+reportDrugList[i].orderNo+"<input class='form-control' readonly style='display: none;' class='no_border_input' name='"+listName+".orderNo' value='"+reportDrugList[i].orderNo+"'></td>\n" +
                "\t<td>"+reportDrugList[i].licenseNo+"<input readonly style='display: none;' class='no_border_input' name='"+listName+".licenseNo' value='"+reportDrugList[i].licenseNo+"'></td>\n" +
/*
                "\t<td>"+reportDrugList[i].productName+"<input style='display: none;' class='no_border_input' name='"+listName+".productName' value='"+reportDrugList[i].productName+"'></td>\n" +
*/
                "\t<td><input style='font-size: 12px;' readonly class='no_border_input form-control' name='"+listName+".productName' value='"+reportDrugList[i].productName+"'></td>\n" +

/*
                "\t<td>"+reportDrugList[i].generalName+"<input style='display: none;' class='no_border_input' name='"+listName+".generalName' value='"+reportDrugList[i].generalName+"'></td>\n" +
*/
                "\t<td><input style='font-size: 12px;' readonly class='no_border_input form-control' name='"+listName+".generalName' value='"+reportDrugList[i].generalName+"'></td>\n" +

                "\t<td>"+reportDrugList[i].drugForm+"<input style='display: none;' class='no_border_input' name='"+listName+".drugForm' value='"+reportDrugList[i].drugForm+"'></td>\n" +
                "\t<td>"+reportDrugList[i].drugProducer+"<input style='display: none;' class='no_border_input' name='"+listName+".drugProducer' value='"+reportDrugList[i].drugProducer+"'></td>\n" +
/*
                "\t<td><input style='display: none;' class='no_border_input' name='"+listName+".batchNo' value=''></td>\n" +
*/
                "\t<td><input readonly style='width: 100px;font-size: 12px;' class='no_border_input form-control' name='"+listName+".batchNo' value='"+reportDrugList[i].batchNo+"'></td>\n" +
                "\t<td>"+reportDrugList[i].dosage+"<input style='display: none;' class='no_border_input' name='"+listName+".dosage' value='"+reportDrugList[i].dosage+"'></td>\n" +
                "\t<td>"+reportDrugList[i].dosageUnit+"<input style='display: none;' class='no_border_input' name='"+listName+".dosageUnit' value='"+reportDrugList[i].dosageUnit+"'></td>\n" +
                "\t<td>"+reportDrugList[i].administration+"<input style='display: none;' class='no_border_input' name='"+listName+".administration' value='"+reportDrugList[i].administration+"'></td>\n" +
                "\t<td>"+reportDrugList[i].freq+"<input readonly style='display: none;' class='no_border_input' name='"+listName+".freq' value='"+reportDrugList[i].freq+"'></td>\n";
            var startDate = reportDrugList[i].startDate;
            if (startDate.length > 10) {
                startDate = startDate.substr(0, 10);
            }
            var stopDate = reportDrugList[i].stopDate;
            if (stopDate.length > 10) {
                stopDate = stopDate.substr(0, 10);
            }
            temp +=
                "\t<td>"+startDate+"<input style='display: none;' class='no_border_input' name='"+listName+".startDate' value='"+startDate+"'></td>\n" +
                "\t<td>"+stopDate+"<input style='display: none;' class='no_border_input' name='"+listName+".stopDate' value='"+stopDate+"'></td>\n" +
                "\t<td><input readonly name='"+listName+".takeMedicineCause' class='form-control' value='"+reportDrugList[i].takeMedicineCause+"'></td>" +
                "</tr>";
            if ('1' == reportDrugList[i].flag) {
                suspiciousNum++;
                suspiciousDrugList += temp;
            } else {
                combinedNum++;
                combinedDrugList += temp;
            }
        } 
    }
    $("input[name='suspiciousNum']").val(suspiciousNum);
    $("input[name='conbinedNum']").val(combinedNum);
    $("#suspiciousDrugTable").html(suspiciousDrugList);
    $("#combinedDrugTable").html(combinedDrugList);

}

/**
 * 保存不良反应报告
 */
function saveReport() {
    var suspiciousPatientId = $("input[name='suspiciousPatientId']").val();
    $("input[name='report.suspiciousPatientId']").val(suspiciousPatientId);
    $("#reportForm").ajaxSubmit({
        url: "report/saveReport.do",
        type: 'post',
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        beforeSubmit: function () {},
        success: function (data) {
            if (data.success) {
                alert("保存成功");
                window.location.reload();
            } else {
                alert("保存失败")
            }
        },
        clearForm: false,//禁止清楚表单
        resetForm: false //禁止重置表单
    });
}

/**
 * 上传不良反应报告
 */
function uploadReport() {
    var suspiciousPatientId = $("input[name='suspiciousPatientId']").val();
    $("input[name='report.suspiciousPatientId']").val(suspiciousPatientId);
    enableForm();
    $("#reportForm").ajaxSubmit({
        url: "report/uploadReport.do",
        type: 'post',
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        beforeSubmit: function () {},
        success: function (data) {
            if (data.success) {
                alert(data.message);
                window.location.reload();
            } else {
                alert(data.message);
                disabledForm();
            }
        },
        clearForm: false,//禁止清楚表单
        resetForm: false //禁止重置表单
    });
}

/**
 * 打开选择医嘱的界面
 */
function openSearchOrders(flag) {
    $("input[name='flag']").val(flag);

    //  清空搜索框中的查询条件
    $("input[name='ordersNo_condition']").val("");
    $("input[name='drugName_condition']").val("");
    $("input[name='inputCode_condition']").val("");

    searchOrders();
    $("#chooseOrdersModal").modal('show');
}

/**
 * 根据查询的医嘱结果，拼接到界面上
 * @param list
 */
function setOrdersResult(list, orderNoSet) {
    $("#chooseOrdersTBody").html("");
    var html = "";
    if (null != list && list.length > 0) {
        for (var i = 0; i < list.length; i++) {
            var orderNo = list[i].orderNo;
            if ($.inArray(orderNo, orderNoSet) != -1) {
                continue;
            }
            var color = "";
            var checked = "";
            if (list[i].inDB == 1) {
                color = "color: red;";
                checked = "checked='checked'";
            }
            html += "" +
                "<tr style='"+color+"'>" +
                "<td><input type='checkbox' name='selectedOrders' "+checked+"></td>\n" +
                "<td style='display: none'>"+ list[i].licenseNo +"</td>\n" +
                "<td style='display: none'>"+ replaceNull(list[i].drugTradeName) +"</td>\n" +
                "<td style='display: none'>"+ replaceNull(list[i].drugGeneralName) +"</td>\n" +
                "<td style='display: none'>"+ replaceNull(list[i].drugForm) +"</td>\n" +
                "<td style='display: none'>"+ replaceNull(list[i].drugProducer) +"</td>\n" +
                "<td style='"+color+"'>"+list[i].orderNo+"</td>\n" +
                "<td style=\"width: 15%;"+color+"\">"+ list[i].drugName +"</td>\n" +
                "<td style=\"width: 15%;\">"+ replaceNull(list[i].manufacturer) +"</td>\n" +
                "<td>"+ new Date(list[i].startDateTime).format("yyyy-MM-dd hh:mm:ss") +"</td>\n" +
                "<td>"+ new Date(list[i].stopDateTime).format("yyyy-MM-dd hh:mm:ss") +"</td>\n" +
                "<td>"+ replaceNull(list[i].administrationName) +"</td>\n" +
                "<td>"+ replaceNull(list[i].dosage) +"</td>\n" +
                "<td>"+ replaceNull(list[i].dosageUnitsName) +"</td>\n" +
                "<td>"+ replaceNull(list[i].freqDetail) +"</td>\n" +
                "<td>"+ replaceNull(list[i].frequencyCode) +"</td>\n" +
                "<td>"+ replaceNull(list[i].orderStatusName) +"</td>" +
                "</tr>";
        }
    }
    $("#chooseOrdersTBody").html(html);
}

/**
 * 查询某一患者的医嘱数据
 */
function searchOrders(orderNoSet) {
    /**
     * 设置两个表中已经存在的医嘱
     */
    var orderNoSet = [];
    $('#suspiciousDrugTable tr').each(function(i) {                     // 遍历 tr
        var orderNo = $(this).children("td").eq(1).text();
        orderNoSet.push(orderNo);
    });
    $('#combinedDrugTable tr').each(function(i) {                       // 遍历 tr
        var orderNo = $(this).children("td").eq(1).text();
        orderNoSet.push(orderNo);
    });

    var patientId = $("input[name='patientId']").val();
    var ordersNo_condition = $("input[name='ordersNo_condition']").val();
    var drugName_condition = $("input[name='drugName_condition']").val();
    var inputCode_condition = $("input[name='inputCode_condition']").val();
    var condition = {};
    condition.patientId = patientId;
    condition.orderNo = ordersNo_condition;
    condition.drugName = drugName_condition;
    condition.inputCode = inputCode_condition;

    var ruleId = $("input[name='ruleId']").val();
    var url = "orders/searchOrders.do";
    $.ajax({
        type: 'post',
        url : url,
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        data: JSON.stringify({condition: condition, ruleId: ruleId}),
        success: function(data){
            if (data.success) {
                setOrdersResult(data.data, orderNoSet);
            } else {
                alert(data.message);
            }
        }
    });
}

/**
 * 将勾选的药品放入怀疑/并用药品表格
 */
function selectDrug2Table() {
    var newDrugTr = "";
    var index;
    var flag = $("input[name='flag']").val();       //  是增加到怀疑药品还是并用药品
    var listName = "";
    if ('1' == flag) {
        index = $("input[name='suspiciousNum']").val();
        listName = "suspiciousDrugList";
    } else {
        index = $("input[name='combinedNum']").val();
        listName = "combinedDrugList";
    }
    if ("" == index || undefined == index || null == index || 'null' == index) {
        index = 0;
    } else {
        index = parseInt(index);
    }
    $("#chooseOrdersTBody").find("tr").each(function(){
        var tdArr = $(this).children();
        var checkbox = tdArr.eq(0).find('input');
        if($(checkbox).is(':checked')) {
            /**
             * 2018-12-10
             * 对商品名进行处理，考虑到新华医院的药品名称存在 xxx/商品名的情况
             */
            var gerneralName = tdArr.eq(3).html();
            if (gerneralName.indexOf('/') != -1) {
                gerneralName = gerneralName.substr(gerneralName.indexOf('/') + 1);
            }

            newDrugTr += "" +
                "<tr>" +
                "\t<td><p style='display: block;' onclick=\"deleteOneDrug(this)\" class=\"fa fa-times deleteOneDrug\"></p></td>\n" +
                "\t<td style='display: none;'>"+tdArr.eq(6).html()+"<input style='display: none;' class='no_border_input form-control' name='"+listName+"["+index+"].orderNo' value='"+tdArr.eq(6).html()+"'></td>\n" +
                "\t<td>"+tdArr.eq(1).html()+"<input style='display: none;' class='no_border_input form-control' name='"+listName+"["+index+"].licenseNo' value='"+tdArr.eq(1).html()+"'></td>\n" +
/*
                "\t<td>"+tdArr.eq(3).html()+"<input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].productName' value='"+tdArr.eq(3).html()+"'></td>\n" +
*/
                "\t<td><input style='font-size: 12px' class='no_border_input form-control' name='"+listName+"["+index+"].productName' value='"+gerneralName+"'></td>\n" +
/*
                "\t<td>"+tdArr.eq(2).html()+"<input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].generalName' value='"+tdArr.eq(2).html()+"'></td>\n" +
*/
                "\t<td><input style='font-size: 12px' class='no_border_input form-control' name='"+listName+"["+index+"].generalName' value='"+tdArr.eq(2).html()+"'></td>\n" +
                "\t<td>"+tdArr.eq(4).html()+"<input style='display: none;' class='no_border_input form-control' name='"+listName+"["+index+"].drugForm' value='"+tdArr.eq(4).html()+"'></td>\n" +
                "\t<td>"+tdArr.eq(5).html()+"<input style='display: none;' class='no_border_input form-control' name='"+listName+"["+index+"].drugProducer' value='"+tdArr.eq(5).html()+"'></td>\n" +
/*
                "\t<td><input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].batchNo' value=''></td>\n" +
*/
                "\t<td><input style='width: 100px;font-size: 12px;' class='no_border_input form-control' name='"+listName+"["+index+"].batchNo' value=''></td>\n" +
                "\t<td>"+tdArr.eq(12).html()+"<input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].dosage' value='"+tdArr.eq(12).html()+"'></td>\n" +
                "\t<td>"+tdArr.eq(13).html()+"<input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].dosageUnit' value='"+tdArr.eq(13).html()+"'></td>\n" +
                "\t<td>"+tdArr.eq(11).html()+"<input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].administration' value='"+tdArr.eq(11).html()+"'></td>\n" +
                "\t<td>"+tdArr.eq(15).html()+"<input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].freq' value='"+tdArr.eq(15).html()+"'></td>\n";
            var startDate = tdArr.eq(9).html();
            if (startDate.length > 10) {
                startDate = startDate.substr(0, 10);
            }
            var stopDate = tdArr.eq(10).html();
            if (stopDate.length > 10) {
                stopDate = stopDate.substr(0, 10);
            }
            newDrugTr += "" +
                "\t<td>"+startDate+"<input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].startDate' value='"+startDate+"'></td>\n" +
                "\t<td>"+stopDate+"<input style='display: none;' class='no_border_input' name='"+listName+"["+index+"].stopDate' value='"+stopDate+"'></td>\n" +
                "\t<td><input style='font-size: 12px' class='no_border_input form-control' name='"+listName+"["+index+"].takeMedicineCause' class='form-control' value=''></td>" +
                "</tr>";
            index++;
        }
    });
    if ('1' == flag) {
        $("#suspiciousDrugTable").append(newDrugTr);
        $("input[name='suspiciousNum']").val(index);
    } else {
        $("#combinedDrugTable").append(newDrugTr);
        $("input[name='combinedNum']").val(index);
    }
    $("#generateReportModal").modal('show');
}

/**
 * 回到填写报告的页面
 */
function back2Report() {
    $("#generateReportModal").modal('show');
}

/**
 * 创建新的不良反应报告时，清空
 */
function emptyReport() {

    $("#generateReportModal input:text").val('');
    $("#generateReportModal textarea").val('');

    $("#suspiciousDrugTable").html("");
    $("#combinedDrugTable").html("");
}

function modifyReport() {
    enableForm();
    $("#saveReportButton").removeClass("disabled");
    $("#modifyReportButton").addClass("disabled");
    $("#uploadReportButton").addClass("disabled");
    $("#addSuspiciousDrugButton").removeClass("disabled");
    $("#addCombinedDrugButton").removeClass("disabled");
    $(".deleteOneDrug").css('display', 'block');
}

function enableForm() {
    $("#generateReportModal input").removeAttr("disabled");
    $("#generateReportModal input").removeAttr("readonly");
    $("#generateReportModal textarea").removeAttr("readonly");
}

function disabledForm() {
    $("#generateReportModal input").attr("disabled", "disabled");
    $("#generateReportModal textarea").attr('readonly', 'readonly');
}

function setTextarea2Input(obj) {
    var value = $(obj).val();
    $(obj).next().val(value);
}

/**
 * 选中重要信息checkbox的触发事件，对相关input进行赋值
 * @param obj
 */
function setImportantInfo(obj) {
    var id = $(obj).attr("id");
    id = id.substr(0, id.length - 2);
    if ("allergyHistory" == id || 'otherHistory' == id) {
        if ($(obj).is(':checked')) {
            $("input[name='report."+id+"']").val("1");
            $("#"+id+"Textarea").css("display", 'block');
        } else {
            $("input[name='report."+id+"']").val("");
            $("#"+id+"Textarea").css("display", 'none');
        }
        $("#"+id+"Textarea").val("");
    } else {
        if ($(obj).is(':checked')) {
            $("input[name='report."+id+"']").val("1");
        } else {
            $("input[name='report."+id+"']").val("0");
        }
    }
}

function setAdrResultTextarea2Input(obj) {
    var id = $(obj).attr("id");
    if ("sequelaTextarea" == id) {
        var sequela = $("#sequelaTextarea").val();
        $("input[name='report.deathCause']").val(sequela);
        $("input[name='report.adrResult']").val("后遗症");
    } else {
        var deathCause = $("#deathCauseTextarea").val();
        var deathDate = $("#deathDate").val();
        $("input[name='report.deathCause']").val(deathCause);
        $("input[name='report.deathDate']").val(deathDate);
        $("input[name='report.adrResult']").val("死亡");
    }
}

function deleteOneDrug(obj) {
    if (confirm("确认删除这个药品吗？")) {
        $(obj).parent().parent().remove();
    }
}

/**
 * 查询不良反应报告
 */
function searchReport() {
    var uri = "report/toReportList.do";
    document.getElementById("searchForm").action = uri;
    document.getElementById("searchForm").submit();
}

/**
 * 获取目前已经存储的模板
 */
function chooseAdrDescTemplate() {
    $("#chooseAdrDescriptionTemplateModal").modal('show');
    $(":radio[name='templateOrLis'][value='template']").prop("checked", "checked");

    $.ajax({
        type: 'get',
        url: 'report/getAdrDescriptionTemplate.do',
        async: false,
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        success: function(data){
            if (data.success) {
                setAdrDescriptionTemplate(data.data);
            } else {
                alert(data.message);
            }
        }
    });

    $("#adrDescriptionTemplateZone").css('display', 'block');
    $("#lisSelectingZone").css('display', 'none');

}

function setAdrDescriptionTemplate(list) {
    var content = "";
    for (var i = 0; i < list.length; i++) {
        content += "" +
            "<div class=\"form-group\">\n" +
            "\t<input type=\"radio\" name=\"adrDesTempRadio\" onchange=\"chooseOneTemplate(this)\">" +
            "\t<label>"+list[i].templateName+"</label>\n" +
            "\t<div>" +
            "\t\t<textarea disabled='disabled' class=\"form-control\" rows=\"4\">"+list[i].templateContent+"</textarea>\n" +
            "\t\t<button onclick=\"editOrSaveTemplateDescription(this)\" type=\"button\" class=\"btn btn-success\">编辑</button>" +
            "\t\t<button onclick=\"deleteTemplateDescription(this)\" type=\"button\" class=\"btn btn-success\">删除</button>" +
            "\t</div>" +
            "</div>";
    }
    $("#adrDescriptionTemplateZone").html(content);
}

function chooseOneTemplate(obj) {
    var chosenDescription = $(obj).next().next().children().first().html();
    $("#chosenDescription").html(chosenDescription);
}

/**
 * 编辑或保存一条模板
 * @param obj
 */
function editOrSaveTemplateDescription (obj) {
    var functionName = $(obj).html();
    if ('编辑' == functionName) {
        $(obj).prev().removeAttr("disabled");
        $(obj).html('保存');
    } else {
        var templateName = $(obj).parent().prev().html();
        var templateContent = $(obj).prev().val();
        $.ajax({
            type: 'post',
            url : 'report/updateAdrDescriptionTemplate.do',
            dataType: 'json',                               //  表示返回值的数据类型
            contentType: 'application/json;charset=UTF-8',  //  内容类型
            traditional: true, //使json格式的字符串不会被转码
            data: JSON.stringify({templateName: templateName, templateContent: templateContent}),
            success: function(data){
                if (data.success) {
                    alert("保存成功");
                    $(obj).prev().attr("disabled", "disabled");
                } else {
                    alert(data.message);
                }
            }
        });
        $(obj).html('编辑');
    }
}

/**
 * 删除一条模板
 * @param obj
 */
function deleteTemplateDescription(obj) {
    if (confirm("确认删除这条模板吗？")) {
        var templateName = $(obj).parent().prev().html();
        $.ajax({
            type: 'post',
            url : 'report/deleteAdrDescriptionTemplate.do',
            dataType: 'json',                               //  表示返回值的数据类型
            contentType: 'application/json;charset=UTF-8',  //  内容类型
            traditional: true, //使json格式的字符串不会被转码
            data: JSON.stringify({templateName: templateName}),
            success: function(data){
                if (data.success) {
                    alert("删除成功");
                    $(obj).parent().parent().remove();
                } else {
                    alert(data.message);
                }
            }
        });
    }
}

/**
 * 通过上方的 radio button 来选择复制 lis 还是选择模板
 * @param obj
 */
function chooseTemplateOrLis(obj)    {
    var param = $(obj).val();
    if ("lis" == param) {
        $("#adrDescriptionTemplateZone").css('display', 'none');
        $("#lisSelectingZone").css('display', 'block');

        $("input[name='lisStartDate']").val("");
        $("input[name='lisStopDate']").val("");

        $("#chooseLisTableBody").html("")

    } else {
        $("#adrDescriptionTemplateZone").css('display', 'block');
        $("#lisSelectingZone").css('display', 'none');
    }
}


/**
 * 查询可疑患者列表
 */
function searchSuspiciousPatientList() {
    var uri = "suspiciousPatient/search.do";
    document.getElementById("searchForm").action = uri;
    document.getElementById("searchForm").submit();
}

/**
 * 2018-12-10
 * 将填好的不良反应描述填充到不良反应报告表格中
 */
function selectADRDescription2Table() {
    var chosenADRDescription = $("#chosenDescription").val();
    $("#adrDescriptionTextarea").val(chosenADRDescription)
    $("input[name='report.adrDescription']").val(chosenADRDescription);

    $("#generateReportModal").modal('show');
}

/***
 * 2018-12-14
 * 选中所有医嘱/取消所有选中医嘱
 */
function selectAllOrders(obj) {
    if ($(obj).is(':checked')) {
        $("input[name='selectedOrders']").prop('checked', 'true');
    } else {
        $("input[name='selectedOrders']").removeAttr('checked');
    }
}


function openSavedReportInReportList(patientId, suspiciousPatientId) {
    $("input[name='patientId']").val(patientId);
    openSavedReport(suspiciousPatientId);
}


/**
 * 2019-01-15
 * 在不良反应报告列表页面
 * 查看一份已保存的报告
 */
function openSavedReport(suspiciousPatientId) {
    $("input[name='suspiciousPatientId']").val(suspiciousPatientId);
    setButtonStateWhenOpenReport();
    var url = "report/toGetOneSavedReport.do?suspiciousPatientId=" + suspiciousPatientId;
    $.ajax({
        type: 'get',
        url : url,
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        //data: JSON.stringify({suspiciousPatientId: suspiciousPatientId, state: state}),
        success: function(data){
            if (data.success) {
                var report = data.data.report;
                setReport(report);
                var reportDrugList = data.data.reportDrugList;
                setReportDrugList(reportDrugList);

            } else {
                alert(data.message);
            }
        }
    });
    $("#generateReportModal input").attr("disabled", "disabled");
    $("#generateReportModal textarea").attr('readonly', 'readonly');

    //$("#previousAdrTextarea").attr('readonly', 'readonly');
    $("#chooseOperationModal").modal('hide');
    $("#generateReportModal").modal('show');
}

function setButtonStateWhenOpenReport() {
    $("#modifyReportButton").removeClass("disabled");
    $("#uploadReportButton").removeClass("disabled");
    $("#modifyReportButton").css("display", "block");
    $("#uploadReportButton").css("display", "block");
    $("#saveReportButton").addClass("disabled");
    $("#addSuspiciousDrugButton").addClass("disabled");
    $("#addCombinedDrugButton").addClass("disabled");
    $("#exportReportButton").css("display", "block");
    $("#exportReportButton").removeClass("disabled");
    $("#chooseAdrDescriptionTemplate").addClass("disabled");
}

function selectRelatedOrdersInDisplay() {
    var condition_drugName = $("input[name='relatedOrders.drugName']").val();
    var condition_startDate = $("input[name='minDate']").val();
    var condition_endDate = $("input[name='maxDate']").val();

    var count = 0;
    $("#relatedOrdersTable tr").each(function(i){                   // 遍历 tr
        var drugName = $(this).children().eq(2).html();
        var orderStartTime = $(this).children().eq(5).html().substr(0, 10);
        var orderEndTime = $(this).children().eq(6).html().substr(0, 10);

        var true1 = (drugName.indexOf(condition_drugName) != -1);
        var true2;
        if ("" != condition_startDate && condition_startDate > orderEndTime) {
            true2 = false;
        } else {
            true2 = true;
        }

        var true3;
        if ("" != condition_endDate && condition_endDate < orderStartTime) {
            true3 = false;
        } else {
            true3 = true;
        }

        if (true1 && true2 && true3 ) {
            $(this).children().eq(0).html(++count);
            $(this).css("display", "table-row");
        } else {
            $(this).css("display", "none");
        }
    });
}

function selectOrdersInDisplay() {
    var condition_drugName = $("input[name='orders.drugName']").val();
    var condition_startDate = $("input[name='orders.minDate']").val();
    var condition_endDate = $("input[name='orders.maxDate']").val();

    var count = 0;
    $("#ordersTable tr").each(function(i){                   // 遍历 tr
        var drugName = $(this).children().eq(2).html();
        var orderStartTime = $(this).children().eq(5).html().substr(0, 10);
        var orderEndTime = $(this).children().eq(6).html().substr(0, 10);

        var true1 = (drugName.indexOf(condition_drugName) != -1);
        var true2;
        if ("" != condition_startDate && condition_startDate > orderEndTime) {
            true2 = false;
        } else {
            true2 = true;
        }

        var true3;
        if ("" != condition_endDate && condition_endDate < orderStartTime) {
            true3 = false;
        } else {
            true3 = true;
        }

        if (true1 && true2 && true3 ) {
            $(this).children().eq(0).html(++count);
            $(this).css("display", "table-row");
        } else {
            $(this).css("display", "none");
        }
    });
}

function selectLisInDisplay() {
    var condition_itemName = $("input[name='lis.itemName']").val();
    var condition_startDate = $("input[name='lis.minDate']").val();
    var condition_endDate = $("input[name='lis.maxDate']").val();

    var count = 0;
    $("#lisTable tr").each(function(i){                   // 遍历 tr
        var drugName = $(this).children().eq(2).html();
        var lisTime = $(this).children().eq(7).html().substr(0, 10);

        var true1 = (drugName.indexOf(condition_itemName) != -1);
        var true2;
        if ("" != condition_startDate && condition_startDate > lisTime) {
            true2 = false;
        } else {
            true2 = true;
        }

        var true3;
        if ("" != condition_endDate && condition_endDate < lisTime) {
            true3 = false;
        } else {
            true3 = true;
        }

        if (true1 && true2 && true3 ) {
            $(this).children().eq(0).html(++count);
            $(this).css("display", "table-row");
        } else {
            $(this).css("display", "none");
        }
    });
}