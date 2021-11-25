<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-23
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../layouts/head.jsp"/>
    <script type="text/javascript">
        $(function (){
           $("#btnSubmit").click(function (){
               let flag = false;

               if (joins.emailCheck($("#userId").val().trim())
                   || joins.lenCheck($("#userName").val().trim())
                   || joins.lenCheck($("#userNick").val().trim())
                   || joins.passwordCheck($("#userPw").val().trim())
                   || joins.pwConfirmCheck($("#userPw").val().trim(), $("#pwCheck").val().trim())
                   || joins.phoneCheck($("#userPhone").val())){

                   alert('입력사항을 확인하여 주십시오.');
               } else {
                   flag = true;
               }

                if(flag){
                    $("#userPhone").val(joins.hyphenClear($("#userPhone").val()));
                    let data = {
                        userId : $("#userId").val().trim(),
                        userName : $("#userName").val().trim(),
                        userNick : $("#userNick").val().trim(),
                        userPw : $("#userPw").val().trim(),
                        userPhone : $("#userPhone").val().trim(),
                    }
                    commons.ajaxCall('/saveAf', data, 'POST', ()=> {
                    }, (response)=> {
                        if(response.code == "100"){
                            alert("이미 가입된 아이디입니다.");
                            return
                        }else if(response.code == "200"){
                            location.href="/";
                        }
                    }, (jqXhr)=> {
                        console.log(jqXhr);
                    });
                }
           });
        });

        // input
        // false : form-control is-invalid
        // true : form-control is-valid
        // 기존 : form-control
        // text :
        // 기존 : 없음
        // false : invalid-feedback

        //패스워드는 6 ~ 20자 이내 영문 대,소문자, 숫자, 특수문자 혼합 입력

        function onChangeConfirm(obj, join, text) {
            if(join($(obj).val().trim())) {
                $(obj).siblings().text(text);
                confirmFail(obj);
                return true;
            }else{
                confirmSuccess(obj);
                return false;
            }
        }
        function onChagePwCfm(obj){
            if(joins.pwConfirmCheck($(obj).val().trim() , $("#userPw").val().trim())){
                $(obj).siblings().text('비밀번호 재입력 항목은 비밀번호 항목과 동일하게 입력해 주세요.');
                confirmFail(obj);
                return true;
            }else {
                confirmSuccess(obj);
            }
        }

        function confirmFail(obj){
            $(obj).addClass('is-invalid');
            $(obj).siblings().addClass('invalid-feedback');
            $(obj).focus();
        }

        function confirmSuccess(obj){
            $(obj).removeClass('is-invalid');
            $(obj).addClass('is-valid');
        }

    </script>
</head>
<body>
<jsp:include page="../layouts/top.jsp"/>
<div class="container">
    <jsp:include page="../layouts/navi.jsp"/>

    <div class="jumbotron">
        <div class="tbl_wrp">
            <form class="form-horizontal" method="post">
                <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">아이디</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디" data-minlength="4" required
                               onchange="onChangeConfirm(this, joins.emailCheck, '이메일형식으로 입력해 주세요.')">
                        <div class="float-right"></div>
                    </div>

                </div>
                <div class="form-group">
                    <label for="userName" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userName" id="userName" placeholder="이름" data-minlength="2" required
                               onchange="onChangeConfirm(this, joins.lenCheck, '이름은 두글자 이상 입력해 주세요.' )">
                        <div></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="userNick" class="col-sm-2 control-label">닉네임</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userNick" id="userNick" placeholder="닉네임" data-minlength="2" required
                               onchange="onChangeConfirm(this, joins.lenCheck, '닉네임은 두글자 이상 입력해 주세요.' )">
                        <div></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="userPw" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control input-large" name="userPw" id="userPw" placeholder="비밀번호" data-minlength="6" required
                               onchange="onChangeConfirm(this, joins.passwordCheck, '비밀번호는 6 ~ 20자 이내 영문 대,소문자, 숫자, 특수문자 혼합 입력해주세요.')">
                        <div></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="pwCheck" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control input-large" name="pwCheck" id="pwCheck" placeholder="비밀번호확인" data-minlength="10" required
                               onchange="onChagePwCfm(this)">
                        <div></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="userPhone" class="col-sm-2 control-label">휴대폰</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control input-large" name="userPhone" id="userPhone" placeholder="전화번호 예)01011111111" onkeyup="joins.phoneKeyup(this)"
                               onchange="onChangeConfirm(this, joins.phoneCheck, '휴대폰 형식으로 입력해 주세요.')" maxlength="11">
                        <div></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10">
                        <button type="button" class="btn btn-lg btn-success" id="btnSubmit">가입하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
