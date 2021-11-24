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
            fn_findPw();
            fn_pwReset();
        });

        function fn_findPw(){
            $("#btnSubmit").click(function (){
                if(joins.idCheck($("#userId").val())){
                    alert('아이디는 영대소문+숫자 조합 4자 이상입니다.');
                }
                if(joins.lenCheck($("#userName").val())){
                    alert("이름은 2글자 이상입니다.");
                    return;
                }else if(joins.lenCheck($("#userNick").val())){
                    alert("닉네임은 2글자 이상입니다.");
                    return;
                }

                let data = {
                    userId : $("#userId").val(),
                    userName : $("#userName").val(),
                    userNick : $("#userNick").val()
                };

                commons.ajaxCall("/findPwAf", data, "POST", ()=>{

                }, (response) =>{
                    if(response){
                        $("#userPw").prop('type', 'password');
                        $("#pwCheck").prop('type', 'password');
                        $("#btnFindPw").prop("type", "button");
                        $("[for=userPw]").text('비밀번호');
                        $("[for=pwCheck]").text('비밀번호재확인');
                        $(".div-confirm").hide();
                    }else {
                        alert('아이디, 이름, 닉네임이 존재하지 않습니다.');
                        return;
                    }
                }, (jqXhr) =>{
                    console.log(jqXhr);
                });
            });
        }

        function fn_pwReset(){
            $("#btnFindPw").click(function (){
                if(joins.passwordCheck($("#userPw").val())){
                    alert("비밀번호는 영문/숫자/특수문자 조합 10자 이상입니다.");
                    return;
                }else if($("#userPw").val() != $("#pwCheck").val()){
                    alert("비밀번호와 재입력이 같아야 합니다.");
                    return;
                }
                let data = {
                    userId : $("#userId").val(),
                    userName : $("#userName").val(),
                    userNick : $("#userNick").val(),
                    userPw : $("#userPw").val(),
                };

                commons.ajaxCall("pwReset", data, "POST", ()=>{},
                    (response)=>{
                        alert(response.message);
                        if(response.code == 100){
                            return;
                        }else {
                            location.href="/";
                        }
                    },
                    (jqXHR)=>{
                        console.log(jqXHR);
                    }
                );
            });
        }
    </script>
</head>
<body>
<jsp:include page="../layouts/top.jsp"/>
<div class="container div-confirm">
    <div class="form-group">
        <label for="userId" class="col-sm-2 control-label">아이디</label>
        <div class="col-sm-10">
            <input type="text" class="form-control input-large" name="userId" id="userId" placeholder="아이디" data-minlength="2" required>
        </div>
    </div>
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
    <div class="form-group ">
        <div class="col-sm-offset-1 col-sm-10 mt-4  mb-4">
            <button type="button" class="btn btn-lg btn-success" id="btnSubmit">확인</button>
        </div>
    </div>
</div>
<div class="container">
    <div class="form-group">
        <label for="userPw" class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <input type="hidden" class="form-control input-large" name="userPw" id="userPw" placeholder="비밀번호" data-minlength="10" required>
        </div>
    </div>
    <div class="form-group">
        <label for="pwCheck" class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <input type="hidden" class="form-control input-large" name="pwCheck" id="pwCheck" placeholder="비밀번호확인" data-minlength="10" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-10 mt-4  mb-4">
            <input type="hidden" class="btn btn-lg  btn-success" value="비밀번호재설정" id="btnFindPw">
        </div>
    </div>
</div>
</body>
</html>
