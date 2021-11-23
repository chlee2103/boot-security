<%--
  Created by IntelliJ IDEA.
  User: CHLee
  Date: 2021-11-22
  Time: 오후 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="layouts/head.jsp"/>
    <title>Title</title>
    <script type="text/javascript">
        $(document).ready(function (){
            let msg = "${errorMessage}";
            if(msg && msg.length){
                alert(msg);
            }
        });

    </script>
</head>
<body>
<jsp:include page="layouts/top.jsp"/>

<div class="container text-center">
    <div class="login-form d-flex justify-content-center">
        <div class="col-sm-5">
            <div class="panel">
                <p>아이디와 비밀번호를 입력해주세요</p>
            </div>

            <form name="login" action="/loginProc" method="post">
                <!--            <form name="frm" id="frm" action="#" method="post" onsubmit="return false" class="form-signin">-->
                <!--                <input th:type="hidden" th:value="secret" name="secret_key">-->
                <div class="form-group">
                    <input type="text" class="form-control" name="userId" placeholder="아이디" required="required"
                           autofocus="autofocus">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="userPw" placeholder="비밀번호" required="required">
                </div>

                <div class="form-group">
                    <input type="checkbox" name="remember-me" /> Remember Me
                </div>
                <button type="submit" class="btn btn-lg btn-primary btn-block">로그인</button>
                <!--                <button type="submit" onclick="formLogin()" id="formbtn" class="btn btn-lg btn-primary btn-block">로그인</button>-->
            </form>
        </div>
    </div>
</div>
</body>
</html>
