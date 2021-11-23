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

    </div>

    <footer class="footer">
        <p>© Company 2021</p>
    </footer>

</div> <!-- /container -->




</body>
</body>
</html>
