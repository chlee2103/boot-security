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
<script>
    function fn_movePage(page){
        $("#pageNo").val(page);
        fn_content();
    }
</script>



<div class="container">
    총게시글 수 : <c:out value="${page.totalCount}"/>
    <table class="table">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>게시일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty boardList}">
            <tr>
                <th colspan="5">등록된 게시글이 없습니다.</th>
            </tr>
        </c:if>
        <c:if test="${not empty boardList}">
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td><c:out value="${board.rnum}"/></td>
                    <td><a href="/board/boardDetail?boardSeq=${board.boardSeq}"><c:out value="${board.boardTitle}"/></a></td>
                    <td><c:out value="${board.regId}"/></td>
                    <td><c:out value="${board.regDtm}"/></td>
                    <td><c:out value="${board.readCount}"/></td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
    <div class="text-center">
        <ul class="pagination">
            <c:if test="${page.pageNo > 1}">
                <li class="page-item"><a class="page-link" href="javascript:fn_movePage(${page.prevPageNo})">Previous</a></li>
            </c:if>
            <c:forEach begin="${page.startPageNo}" end="${page.endPageNo}" step="1" var="i">
                <c:choose>
                    <c:when test="${i eq page.pageNo}">
                        <li class="page page_num"><a href="javascript:;" class="btn_paging"><strong>${i}</strong></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page page_num"><a href="javascript:fn_movePage(${i})" class="btn_paging">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${page.pageNo < page.lastPageNo}">
                <li class="page-item"><a class="page-link" href="javascript:fn_movePage(${page.nextPageNo})">Next</a></li>
            </c:if>
        </ul>
    </div>
</div>
