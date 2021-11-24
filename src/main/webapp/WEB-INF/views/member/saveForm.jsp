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
                if(joins.idCheck($("#userId").val())){
                    alert('아이디는 영대소문+숫자 조합 4자 이상입니다.');
                }else if(joins.lenCheck($("#userName").val())){
                    alert("이름은 2글자 이상입니다.");
                }else if(joins.lenCheck($("#userNick").val())){
                    alert("닉네임은 2글자 이상입니다.");
                }else if(joins.passwordCheck($("#userPw").val())){
                    alert("비밀번호는 영문/숫자/특수문자 조합 10자 이상입니다.");
                }else if($("#userPw").val() != $("#pwCheck").val()){
                    alert("비밀번호와 재입력이 같아야 합니다.");
                }else if(joins.nullCheck($("#userPhone").val())) {
                    alert("전화번호를 입력해주세요.");
                }else {
                    flag = true;
                }

                if(flag){
                    $("#userPhone").val(joins.hyphenClear($("#userPhone").val()));
                    let data = {
                        userId : $("#userId").val(),
                        userName : $("#userName").val(),
                        userNick : $("#userNick").val(),
                        userPw : $("#userPw").val(),
                        userPhone : $("#userPhone").val(),
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
                        <input type="text" class="form-control input-large" name="userId" id="userId" placeholder="아이디" data-minlength="4" required>
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
                <div class="form-group">
                    <label for="userPw" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control input-large" name="userPw" id="userPw" placeholder="비밀번호" data-minlength="10" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="pwCheck" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control input-large" name="pwCheck" id="pwCheck" placeholder="비밀번호확인" data-minlength="10" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="userPhone" class="col-sm-2 control-label">휴대폰</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control input-large" name="userPhone" id="userPhone" placeholder="전화번호 예)01011111111" onkeyup="joins.phoneKeyup(this)" maxlength="13">
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
