<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2022/4/7
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
    <title><tiles:getAsString name="title"/></title>
</head>
<body>
<tiles:insertAttribute name="bodyPage" />
</body>
</html>
