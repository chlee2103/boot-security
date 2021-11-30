<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-24
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <jsp:include page="../layouts/head.jsp"/>
    <script>
        $(function() {
            fn_summernote();
            $("#btnWrite").click(function (){

                fn_boardWrite();
            });
        });

        function fn_summernote(){
            $('.summernote').summernote({
                tabsize: 2
                , height: 200
            });
        }
        function fn_boardWrite(){
            let data = {
                regId : $("#regId").val(),
                boardTitle : $("#boardTitle").val(),
                boardContent : $("#boardContent").val()
            }
            commons.ajaxCall("/board/boardWrite", data, "POST", ()=>{}
                            , (response)=>{
                    alert(response.message);
                    if(response.code = 200){
                        location.href="/board/boardList";
                    }else{
                        return;
                    }
                },
                (jqXHR)=>{
                console.log(jqXHR);
                }
            )
        }
    </script>
    <style>
        .form-group {
            overflow: hidden;
        }
    </style>
</head>
<body>
<jsp:include page="../layouts/top.jsp"/>
<div class="container">
    <jsp:include page="../layouts/navi.jsp"/>
        <c:if test="${empty boardInfo}">

        <div class="container mb-4">
            <div class="form-group">
                <label for="regId" class="col-sm-2 control-label">아이디</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control input-large" name="regId" id="regId" value="${principal.name}" readonly>
                </div>
            </div>
            <div class="form-group">
                <label for="boardTitle" class="col-sm-2 control-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control input-large" name="boardTitle" id="boardTitle" data-minlength="2" required>
                </div>
            </div>
            <div class="form-group">
                <textarea class="summernote" id="boardContent"></textarea>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-lg btn-success float-right" id="btnWrite">글쓰기</button>
            </div>
        </div>
        </c:if>

        <c:if test="${not empty boardInfo}">
            <div class="container mb-4">
                <div class="row-cols-lg-6 form-group">
                    <div class="col-lg-2">
                        <label for="regId" class="control-label">아이디</label>
                    </div>
                    <div class="col-lg-10">
                        <input type="text" class="form-control input-large" name="regId" value="${boardInfo.regId}" readonly>
                    </div>
                </div>
                <div class="form-group mb-3">
                    <label for="boardTitle" class="col-sm-2 control-label">제목</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control input-large" name="boardTitle" value="${boardInfo.boardTitle}" data-minlength="2" required>
                    </div>
                </div>
                <div class="form-group mt-3 border">
                    <p><c:out value="${boardInfo.boardTitle}"/></p>
                </div>
                <c:if test="${principal.name eq boardInfo.regId}">
                    <div class="form-group">
                        <button type="button" class="btn btn-lg btn-success float-right" id="btnUpdate">수정</button>
                        <button type="button" class="btn btn-lg btn-dark float-right  mr-2" id="btnDelete">삭제</button>
                    </div>
                </c:if>
        </c:if>
</div>
</body>
</html>
