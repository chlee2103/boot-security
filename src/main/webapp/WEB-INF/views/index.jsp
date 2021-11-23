<%--
  Created by IntelliJ IDEA.
  User: CHLee
  Date: 2021-11-22
  Time: 오후 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<html>
<head>
    <title>Title</title>
    <jsp:include page="layouts/head.jsp"/>
</head>
<body>
<jsp:include page="layouts/top.jsp"/>
<div class="container">
    <div class="navbar-header">
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
        <h1>밋미, 나를 만나보세요.</h1>
        <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        <p>
            <a class="btn btn-lg btn-info" href="/save" role="button">회원가입</a>
            <a class="btn btn-lg btn-info" href="/login" role="button">로그인</a>
            <a class="btn btn-lg btn-primary" href="/oauth2/authorization/google" role="button">Google 로그인</a>
            <a class="btn btn-lg btn-success" href="/oauth2/authorization/naver" role="button">네이버 로그인</a>
            <a class="btn btn-lg btn-warning" href="/oauth2/authorization/kakao" role="button">카카오 로그인</a>
            <a class="btn btn-lg btn-primary" href="/oauth2/authorization/facebook" role="button">Facebook 로그인</a>
        </p>
    </div>

    <div class="row marketing">
        <div class="col-lg-6">
            <h4>Subheading</h4>
            <p>Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.</p>

            <h4>Subheading</h4>
            <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum.</p>

            <h4>Subheading</h4>
            <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
        </div>

        <div class="col-lg-6">
            <h4>Subheading</h4>
            <p>Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.</p>

            <h4>Subheading</h4>
            <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum.</p>

            <h4>Subheading</h4>
            <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p>
        </div>
    </div>

    <footer class="footer">
        <p>© Company 2021</p>
    </footer>

</div> <!-- /container -->




</body>
</body>
</html>
