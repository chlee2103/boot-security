<%--
  Created by IntelliJ IDEA.
  User: CHLee
  Date: 2021-11-22
  Time: 오후 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.0/dist/js.cookie.min.js"></script>
<html>
<head>
    <jsp:include page="layouts/head.jsp"/>
    <title>Title</title>
    <script type="text/javascript">
        $(document).ready(function (){
            fn_err();
            fn_remember();

            $("[name=btnFindId]").click(function (){
               location.href="/findId";
            });
            $("[name=btnFindPw]").click(function (){
                location.href="/findPw";
            });
        });

        function fn_err(){
            let msg = "${errorMessage}";
            if(msg && msg.length){
                alert(msg);
            }
        }

        function fn_remember(){
            if(Cookies.get("USER_ID")){
                $("input[name=remember]").prop("checked", true);
                $("input[name=userId]").val(Cookies.get("USER_ID"));
            }

            $("input[name=remember]").click(function (){
               if($("input[name=remember]").is(':checked')){
                   if(joins.nullCheck($("input[name=userId]").val().trim())){
                       alert('아이디를 입력해주세요.');
                       $("input[name=remember]").prop("checked", false);
                   }else {
                       Cookies.set("USER_ID", $("input[name=userId]").val().trim(), {expires : 7 });
                       console.log(Cookies.get("USER_ID"));
                   }
               }else if(!$("input[name=remember]").is(':checked')){
                   Cookies.remove("USER_ID");
               }
            });
        }



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
                    <input type="checkbox" name="remember" /> Remember Me
                </div>
                <button type="submit" class="btn btn-lg btn-primary btn-block">로그인</button>
                <!--                <button type="submit" onclick="formLogin()" id="formbtn" class="btn btn-lg btn-primary btn-block">로그인</button>-->
            </form>

            <div class="panel">
                <button type="button" name="btnFindId" class="btn  btn-warning">아이디찾기</button>
                <button type="button" name="btnFindPw" class="btn  btn-danger">비밀번호찾기</button>
            </div>


        </div>
    </div>
</div>
</body>
</html>
