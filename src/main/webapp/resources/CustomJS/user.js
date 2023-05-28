/**
 * 查询用户列表
 */
function searchUser() {
    var uri = "user/toUserList.do";
    document.getElementById("searchForm").action = uri;
    document.getElementById("searchForm").submit();
}



/**
 * 保存用户信息
 */
function saveDetail() {
    var userName = $("input[name='users.userName']").val();
    var userId = $("input[name='users.userId']").val();
    var password = $("input[name='users.password']").val();
    var roleId = $("input[name='users.roleId']").val();
    if ("" == userName || "" == userId || "" == password || "" == roleId) {
        alert("姓名/ID/密码/角色不可不填");
        return;
    }
    var occupation = $("input[name='occupation']:checked").val();
    if ("" == occupation) {
        var otherOccupation = $("input[name='occupationStr']").val();
        $("input[name='users.occupation']").val(otherOccupation);
    } else {
        $("input[name='users.occupation']").val(occupation);
    }

    $("#submitForm").ajaxSubmit({
        url: "user/saveUser.do",
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
 * 查看一份已保存的实体详情
 */
function openSavedDetail(userId) {
    emptyForm();
    var url = "user/getUserDetail.do?userId=" + userId;
    $.ajax({
        type: 'get',
        url : url,
        dataType: 'json',                               //  表示返回值的数据类型
        contentType: 'application/json;charset=UTF-8',  //  内容类型
        traditional: true, //使json格式的字符串不会被转码
        success: function(data){
            if (data.success) {
                var users  = data.data.users;
                setUser(users);
                openSavedCommon();
            } else {
                alert(data.message);
            }
        }
    });
}

function setUser(users) {
    $("input[name='users.seqId']").val(users.seqId);
    $("input[name='users.userId']").val(users.userId);
    $("input[name='users.userName']").val(users.userName);
    $("input[name='users.deptCode']").val(users.deptCode);
    $("input[name='users.deptName']").val(users.deptName);
    $("input[name='users.password']").val(users.password);
    $("input[name='users.roleId'][value='"+users.roleId+"']").prop("checked",true);

    if ("医生" != users.occupation
        && "药师" != users.occupation
        && "护士" != users.occupation) {
        $("input[name='occupation'][value='']").prop("checked",true);
        $("input[name='occupationStr']").css("display", "block");
        $("input[name='occupationStr']").val(users.occupation);
    } else {
        $("input[name='occupation'][value='"+users.occupation+"']").prop("checked",true);
    }
    $("input[name='users.occupation']").val(users.occupation);

    $("input[name='users.telephoneNumber']").val(users.telephoneNumber);
    $("input[name='users.email']").val(users.email);

}