/**
 * 查询列表
 */
function searchLisItemDict () {
    var uri = "lisItemDict/toLisItemDictList.do";
    document.getElementById("searchForm").action = uri;
    document.getElementById("searchForm").submit();
}


/**
 * 保存角色
 */
function updateEnableState (obj, itemName) {
    var entry = {};
    entry.itemName = itemName;
    if ($(obj).prop("checked")) {
        entry.enable = "1";
    } else {
        entry.enable = "0";
    }

    $.ajax({
        type: 'post',
        url: 'lisItemDict/updateEnableState.do',
        async: false,
        dataType: 'json',                               //  表示返回值的数据类型
        data: JSON.stringify({entry: entry}),
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        success: function(data){
            if (data.success) {
                alert(data.message);
            } else {
                if (entry.enable == "1") {
                    $(obj).prop("checked", false);
                } else {
                    $(obj).prop("checked", true);
                }
                alert(data.message);
            }
        }
    });
}