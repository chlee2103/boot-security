<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-24
  Time: 오전 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../layouts/head.jsp"/>
    <script type="text/javascript">
        $(function (){
            fn_findId();
            fn_findPw();
        });

        function fn_findId(){
            $("#btnSubmit").click(function (){
                if(joins.lenCheck($("#userName").val())){
                    alert("이름은 2글자 이상입니다.");
                    return;
                }else if(joins.lenCheck($("#userNick").val())){
                    alert("닉네임은 2글자 이상입니다.");
                    return;
                }

                let data = {
                    userName : $("#userName").val(),
                    userNick : $("#userNick").val()
                };
                commons.ajaxCall("/findIdAf", data, "POST", ()=>{
                }, (response) =>{
                    $("#userId").text('당신의 아이디는 ' + response + '입니다.');
                    $("#btnFindPw").prop("type", "button");
                }, (jqXhr) =>{
                    console.log(jqXhr);
                });
            });
        }
        function fn_findPw(){
            $("#btnFindPw").click(function (){
                location.href="/findPw";
            });
        }
    </script>
</head>
<body>
<jsp:include page="../layouts/top.jsp"/>
<div class="container">
    <div class="form-group">
        <label for="userName" class="col-sm-2 control-label">이름</label>
        <div class="col-sm-10">
            <input type="text" class="form-control input-large" name="userName" id="userName" placeholder="이름" data-minlength="2" required>
        </div>
    </div>
    <div class="form-group">
        <label for="userNick" class="col-sm-2 control-label">닉네임</label>
        <div class="col-sm-10">
            <input type="text" class="form-control input-large" name="userNick" id="userNick" placeholder="닉네임" data-minlength="2" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-10 mt-4  mb-4">
            <button type="button" class="btn btn-lg btn-success" id="btnSubmit">아이디찾기</button>
        </div>
    </div>

    <div class="form-group user-id">
        <div class="col-sm-offset-1 col-sm-10 mt-4  mb-4">
        <h4 id="userId"></h4>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-10 mt-4  mb-4">
            <input type="hidden" class="btn btn-lg  btn-success" value="비밀번호찾기" id="btnFindPw">
        </div>
    </div>
</div>
</body>
</html>
