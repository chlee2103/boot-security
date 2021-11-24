<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-24
  Time: 오후 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>




<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>게시일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty boardList}">
            <tr>
                <th colspan="4">등록된 게시글이 없습니다.</th>
            </tr>
        </c:if>
        <c:if test="${not empty boardList}">
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td><c:out value="${board.rnum}"/></td>
                    <td><c:out value="${board.boardTitle}"/></td>
                    <td><c:out value="${board.regDtm}"/></td>
                    <td><c:out value="${board.readCount}"/></td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
