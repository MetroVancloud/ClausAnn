/**
 * 查询用户列表
 */
function searchRole() {
    var uri = "role/toRoleList.do";
    document.getElementById("searchForm").action = uri;
    document.getElementById("searchForm").submit();
}


/**
 * 保存角色
 */
function saveDetail() {
    var roleName = $("input[name='role.roleName']").val();
    var rightList = $("input[name='role.rightList']").val();
    if ("" == roleName || "" ==rightList) {
        alert("角色名和模块权限不可为空");
        return;
    }

    $("#submitForm").ajaxSubmit({
        url: "role/saveRole.do",
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
 * 2019-02-27
 * 在列表页面
 * 查看一份已保存的尸体详情
 */
function openSavedDetail(roleId) {
    emptyForm();
    var url = "role/getRoleDetail.do?roleId=" + roleId;
    $.ajax({
        type: 'get',
        url : url,
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        success: function(data){
            if (data.success) {
                var role = data.data.role;
                setRole(role);
                openSavedCommon();
            } else {
                alert(data.message);
            }
        }
    });
}

function setRole(role) {
    $("input[name='role.id']").val(role.id);
    $("input[name='role.roleName']").val(role.roleName);
    var rightList = replaceNull(role.rightList).split(",");
    if (rightList.length > 0) {
        for (var i = 0; i < rightList.length; i++) {
            $("input[type='checkbox'][name='role.rightList'][value='"+rightList[i]+"']").prop("checked", true);
        }
    }
}