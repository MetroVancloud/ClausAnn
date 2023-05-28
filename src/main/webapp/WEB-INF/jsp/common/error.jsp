<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/4/20
  Time: 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
    <title></title>

</head>
<body>
    <div id="page-wrapper">
        <p>请求存在错误！错误信息如下，请联系管理员：</p>
        <p>${errorMessage}</p>
    </div>
</body>
<%@include file="commonJS.jsp"%>
</html>
