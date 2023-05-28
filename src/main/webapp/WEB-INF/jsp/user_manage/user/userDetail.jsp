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

    <script>


    </script>
</head>

<body>

<!-- Modal -->
<div class="modal fade" style="width: 600px;height: 500px;margin: 0 auto" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog_scroll" style="width: 100%">
        <div class="modal-content modal-content_scroll">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>编辑用户信息</b></h4>
            </div>

            <div class="modal-body modal-body_scroll" id="" style="overflow-y: scroll; ">
                <div style="margin-bottom: 20px; text-align: right">
                    <form id="submitForm" action="" method="post">
                        <table class="table table-condensed reportTable">
                            <input type="hidden" name="users.seqId" value="">

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">用户ID：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" style="width: 200px" class="form-control" name="users.userId" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">用户姓名：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" style="width: 200px" class="form-control" name="users.userName" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">科室代码：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" style="width: 200px" class="form-control" name="users.deptCode" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">科室名称：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" style="width: 200px" class="form-control" name="users.deptName" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">登陆密码：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" style="width: 200px" class="form-control" name="users.password" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">职业：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="radio" name="occupation" value="药师">药师
                                    <input type="radio" name="occupation" value="医生">医生
                                    <input type="radio" name="occupation" value="护士">护士
                                    <input type="radio" name="occupation" value="">其他
                                    <input type="text" style="display: none;width: 200px" class="form-control" name="occupationStr" value="" />

                                    <input type="hidden" name="users.occupation" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">电话：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" style="width: 200px" class="form-control" name="users.telephoneNumber" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">邮箱：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <input type="text" style="width: 200px" class="form-control" name="users.email" value="" />
                                </td>
                            </tr>

                            <tr>
                                <th style="vertical-align: middle;height: 44px;text-align: right;width: 150px;">角色：</th>
                                <td style="vertical-align: middle;height: 44px;text-align: left;">
                                    <c:forEach items="${roleList}" var="entry">
                                        <input type="radio" name="users.roleId" value="${entry.id}">
                                        ${entry.roleName}
                                    </c:forEach>
                                </td>
                            </tr>
                        </table>


                    </form>
                </div>
            </div>



            <div class="modal-footer modal-footer_scroll">
                <button style="float: right;margin-left: 10px;" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button style="float: right;margin-left: 10px;" type="button" id="saveButton" class="btn btn-success" onclick="saveDetail()" >保存</button>
                <button style="float: right;margin-left: 10px;" type="button" id="modifyButton" class="btn btn-primary" onclick="modifyDetail()">修改</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("input[type='radio'][name='occupation']").click(function(){
            var value = $(this).val();
            if ("" == value) {
                $("input[name='occupationStr']").css("display", "block");
                $("input[name='occupationStr']").val("");
            } else {
                $("input[name='occupationStr']").css("display", "none");
                $("input[name='occupationStr']").val("");
            }
        });


    });
</script>


<!-- 防止表单提交自动刷新页面 -->
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
</body>
</html>



