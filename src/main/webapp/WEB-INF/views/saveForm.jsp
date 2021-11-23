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
    <jsp:include page="layouts/head.jsp"/>
</head>
<body>
<jsp:include page="layouts/top.jsp"/>
<div class="container">
    <div class="header">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation" class="active"><a href="/member">Member</a></li>
                <li role="presentation"><a href="/community">커뮤니티</a></li>
                <li role="presentation"><a href="/myroom">마이룸</a></li>
            </ul>
        </nav>
        <h3 class="text-muted"><a href="/">MeetMe</a></h3>
    </div>

    <div class="jumbotron">
        <div class="tbl_wrp">
            <form class="form-horizontal" action="/save" method="post">
                <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">아이디</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control input-large" name="userId" id="userId" placeholder="아이디" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="userNick" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control input-large" name="userNick" id="userNick" placeholder="아이디" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="userName" class="col-sm-2 control-label">닉네임</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control input-large" name="userName" id="userName" placeholder="아이디" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="userPw" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control input-large" name="userPw" id="userPw" placeholder="비밀번호" data-minlength="6" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="pwCheck" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control input-large" name="pwCheck" id="pwCheck" placeholder="비밀번호확인" data-minlength="6" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="userPhone" class="col-sm-2 control-label">휴대폰</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control input-large" name="userPhone" id="userPhone" placeholder="아이디" required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10">
                        <button type="Submit" class="btn btn-lg btn-success">가입하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
