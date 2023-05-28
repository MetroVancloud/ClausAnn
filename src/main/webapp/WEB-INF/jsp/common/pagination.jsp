<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/4/20
  Time: 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
    <link rel="stylesheet" href="resources/bootstrap-paginator/pagination.css">
    <script src="resources/bootstrap-paginator/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="resources/bootstrap-paginator/bootstrapv3.js" type="text/javascript"></script>
    <script src="resources/bootstrap-paginator/bootstrap-paginator.js"></script>


    <style>
        .pagination li {
            cursor: pointer!important;
        }
    </style>

    <script>

        var totalPageNum = ${pageUtil.totalPageNum};
        var pageNum = ${pageUtil.pageNum};
        var limit = ${pageUtil.limit};
        var url = '${pageUtil.url}';

        var options = {
            currentPage: pageNum,                   //  当前的请求页面。
            totalPages: totalPageNum,               //  一共多少页。
            size: "normal",                         //  应该是页眉的大小。
            bootstrapMajorVersion: 3,               //  bootstrap的版本要求。
            alignment: "right",
            numberOfPages: 5,                       //  一页列出多少数据。
            itemTexts: function (type, page, current) {//如下的代码是将页眉显示的中文显示我们自定义的中文。
                switch (type) {
                    case "first": return "首页";
                    case "prev": return "上一页";
                    case "next": return "下一页";
                    case "last": return "末页";
                    case "page": return page;
                }
            },
            onPageClicked: function (event, originalEvent, type, page){//给每个页眉绑定一个事件，其实就是ajax请求，其中page变量为当前点击的页上的数字。
                if (pageNum == page) {
                    return false;
                }
                $("input[name='pageUtil.pageNum']").val(page);
                pageNum = page;
                $("#searchForm").ajaxSubmit({
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    contentType: "application/x-www-form-urlencoded",
                    beforeSubmit: function () {},
                    success: function (data) {
                        if (data.success) {
                            fillTable(data.data.list, data.data.pageUtil);                          //  每个列表页需重写此方法
                            $('#last_page').text(data.data.pageUtil.totalPageNum);
                            $("input[name='pageUtil.pageNum']").val(data.data.pageUtil.pageNum);    //  当前页码
                            var numberOfPages = data.data.pageUtil.numberOfPages;
                            options.numberOfPages = numberOfPages;
                            if (pageNum > data.data.pageUtil.totalPageNum) {
                                pageNum = data.data.pageUtil.totalPageNum;
                            }
                            $("input[name='pageUtil.pageNum']").val(pageNum);
                            options.currentPage = pageNum;
                            options.numberOfPages = numberOfPages;
                            $('.pagination').bootstrapPaginator(options);
                            totalPageNum = data.data.pageUtil.totalPageNum;
                            $("#totalEntryNum").html(data.data.pageUtil.totalEntryNum);
                        } else {
                            alert("查询异常");
                        }
                    },
                    clearForm: false,//禁止清楚表单
                    resetForm: false //禁止重置表单
                });
            }
        };
        $(function(){
            $('.pagination').bootstrapPaginator(options);
        });
    </script>
</head>
<body>
    <div id="content_title" style="/*width: 700px;margin: 0 auto*/">
    <span style="float: left;margin-top: 24px;padding: 4px;margin-right: 10px;">
        <font style="float:left;">查询到</font>
        <span style="float:left;" id="totalEntryNum">${pageUtil.totalEntryNum}</span>
        <font style="float:left;">条记录&nbsp;&nbsp;&nbsp;&nbsp;每页显示</font>
        <input style="width: 60px;float:left;margin-top: -8px;" class="form-control" type="number" name="pageUtil.limit" value="${pageUtil.limit}">
        <font style="float:left;">条</font>
    </span>
    <ul class="pagination" style="float: left;"></ul>
    <input type="hidden" name="pageUtil.url" value="${pageUtil.url}" />
    <input type="hidden" name="pageUtil.pageNum" value="${pageUtil.pageNum}" />
</div>
</body>
</html>





