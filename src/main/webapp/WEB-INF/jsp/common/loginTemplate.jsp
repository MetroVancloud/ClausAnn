<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/4/20
  Time: 1:13
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
<tiles:insertAttribute name="commonCSS" />
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="footer" />
<tiles:insertAttribute name="commonJS" />
</body>
</html>
