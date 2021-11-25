<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-24
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../layouts/head.jsp"/>
    <script>
        $(function (){
            fn_content();
            $("#btnWrite").click(function (){
                fn_boardDetail("");
            });
        });

        function fn_content(){
            let data = {
                pageSize : $("#pageSize").val(),
                pageNo : $("#pageNo").val()
            }
            $.ajax({
                url:"/board/boardContent",
                type:"POST",
                data: data,
                dataType:"html",
                success:function (data){
                    $("#boardContentArea").html(data);
                },
                error: function (){
                    console.log("error");
                }
            })
        }

        function fn_boardDetail(seq){
            location.href = "/board/boardDetail?boardSeq="+seq;
        }

    </script>
</head>
<body>
<jsp:include page="../layouts/top.jsp"/>
<div class="container">
    <jsp:include page="../layouts/navi.jsp"/>


    <div id="boardContentArea"></div>
    <input type="hidden" id="pageNo" value="1">
    <input type="hidden" id="pageSize" value="10">
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-13">
            <button type="button" class="btn btn-lg btn-success float-right" id="btnWrite">글쓰기</button>
        </div>
    </div>
</div>
</body>
</html>
