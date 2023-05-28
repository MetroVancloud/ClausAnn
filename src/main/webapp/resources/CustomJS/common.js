Date.prototype.format = function(format) {
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours(),   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
            RegExp.$1.length==1 ? o[k] :
                ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}

function replaceNull(str) {
    if (null == str || 'null' == str || undefined == str) {
        return "";
    } else {
        return str;
    }
}


/**************************************时间格式化处理************************************/
function dateFtt(fmt,date)
{ //author: meizz
    var o = {
        "M+" : date.getMonth()+1,                 //月份
        "d+" : date.getDate(),                    //日
        "h+" : date.getHours(),                   //小时
        "m+" : date.getMinutes(),                 //分
        "s+" : date.getSeconds(),                 //秒
        "q+" : Math.floor((date.getMonth()+3)/3), //季度
        "S"  : date.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}

function setLeftMenuBar(firstLevelMenuId, secondLevelMenuId) {
    $("#side-menu").addClass('in');
    $("#"+firstLevelMenuId).addClass('in');
    //var obj = $("#"+firstLevelMenuId).prev().find("span .fa.arrow:before");
    //$(obj).css('content', '\f107');
    $("#"+secondLevelMenuId).addClass('active');
}


/************************************************
 * 2019-02-27
 * 详情表单中公用的
 */
function emptyForm() {
    $("#submitForm input[type='text']").val("");
    $("#submitForm input[type='checkbox']").attr("checked", false);
}

function createDetail() {
    emptyForm();
    $("#modifyButton").css("display", "none");
    $("#saveButton").removeClass("disabled");
    $("#detailModal").modal('show');
}

function modifyDetail() {
    $("#submitForm input").removeAttr("disabled");
    $("#submitForm textarea").removeAttr("readonly");
    $("#saveButton").removeClass("disabled");
    $("#modifyButton").addClass("disabled");
}


function openSavedCommon() {
    $("#submitForm input").attr("disabled", "disabled");
    $("#submitForm textarea").attr('disabled', 'disabled');
    $("#modifyButton").removeClass("disabled");
    $("#saveButton").addClass("disabled");

    $("#detailModal").modal('show');
}