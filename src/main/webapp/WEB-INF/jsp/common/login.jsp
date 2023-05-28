<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MetroVancloud
  Date: 2018/7/5
  Time: 上午 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in ClauseAnnotator</title>
    <%--<script>
        $(document).ready(function () {
           var message = '${message}';
           if (message != null && message != 'null' && message != "") {
               alert(message);
           }
        });
    </script>--%>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please sign in ClauseAnnotator</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="login/verify.do" method="post">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="User Name" name="userName" type="text" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password" value="">
                            </div>
                            <%--<div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                </label>
                            </div>--%>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type="submit" class="btn btn-lg btn-success btn-block" value="登录" />
                            <c:if test="${not empty message}">
                                <label style="color: red;margin-top: 10px;">${message}</label>
                            </c:if>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
