<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-23
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<header>
    <nav class="navbar navbar-dark sticky-top bg-dark ">
        <div class="container">
            <a class="text-light" href="/"><h4>Meet Me</h4></a>
            <ul class="nav justify-content-end">
                <sec:authorize access="isAnonymous()">
                <li class="nav-item"><a class="nav-link text-light" href="/login">로그인</a></li>
                <li class="nav-item" sec:authorize="isAnonymous()"><a class="nav-link text-light" href="/save">회원가입</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                <li class="nav-item" sec:authorize="isAuthenticated()"><a class="nav-link text-light" href="/logout">로그아웃</a></li>
                </sec:authorize>
               <%-- <li class="nav-item" sec:authorize="hasAuthority('ROLE_ADMIN')"><a class="nav-link text-light" href="/admin">관리자</a></li>--%>
                <li class="nav-item" ><a class="nav-link text-light" href="/">HOME</a></li>
            </ul>
        </div>
    </nav>
</header>
</html>
