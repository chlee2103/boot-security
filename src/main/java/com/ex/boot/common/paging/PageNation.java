package com.ex.boot.common.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

/*

 ROW_NUMBER 사용시 QUERY
 <!-- 페이징 Top -->
    <sql id="pagingTop">
        SELECT B.*
          FROM (SELECT A.*, ROW_NUMBER() OVER(ORDER BY A.DNUM DESC) AS RNUM
                  FROM (
    </sql>

    <!-- 페이징 Bottom -->
    <sql id="pagingBtm">
                    ) A
                ) B
         WHERE B.RNUM BETWEEN (#{pageSize}*(#{pageNo}-1))+1 AND #{pageSize}*#{pageNo}
    </sql>

    LIMIT 사용시 QUERY
    LIMIT #{pageSize}  -- 데이터갯수
    OFFSET (#{pageNo}-1) * #{pageSize}  -- 몇번째부터 조회


paging JSP

<script type="text/javascript">
    function fn_movePage(val){
        $("input[name=pageNo]").val(val);
        fn_paging();
    }
</script>
<ul class="paging">
    <c:if test="${pageVO.pageNo != 0}">
        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
            <li class="page"><a href="javascript:fn_movePage(${pageVO.firstPageNo})" class="btn_paging btn_first"><span>처음</span></a></li>
        </c:if>
        <c:if test="${pageVO.pageNo > 10}">
            <li class="page"><a href="javascript:fn_movePage(${pageVO.startPageNo - 1})" class="btn_paging btn_prev"><span>이전</span></a></li>
        </c:if>
<%--        <li class="page">
        <div class="input_box">
        <label for="pageCount">--%>
        <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq pageVO.pageNo}">
                    <li class="page page_num"><a href="javascript:;" class="btn_paging"><strong>${i}</strong></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page page_num"><a href="javascript:fn_movePage(${i})" class="btn_paging">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
<%--        </label>
        </div>
        </li>--%>
        <c:if test="${pageVO.finalPageNo > pageVO.endPageNo and pageVO.pageNo != pageVO.finalPageNo }">
            <li class="page"><a href="javascript:fn_movePage(${pageVO.endPageNo + 1})" class="btn_paging btn_next"><span>다음</span></a></li>
        </c:if>
        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
            <li class="page"><a href="javascript:fn_movePage(${pageVO.finalPageNo})" class="btn_paging btn_last"><span>마지막</span></a></li>
        </c:if>
    </c:if>
</ul>

input paging jsp

<script type="text/javascript">
    function chagePage(obj, currPage){
        let finalPage = $('input[name=finalPageNo]').val();
        let pageNumber = parseInt(obj.value);

        if(pageNumber && pageNumber > 0 && pageNumber <= finalPage){
            $("input[name=pageNo]").val(pageNumber);
            fn_paging();
            return;
        }
        alert('이동이 불가능한 페이지입니다. \n이동 가능한 페이지 번호를 입력해주세요.');
        obj.value = currPage;
    }
    function fn_movePage(val){
        $("input[name=pageNo]").val(val);
        fn_paging();
    }
</script>

<ul class="paging">
    <c:if test="${pageVO.pageNo != 0}">
        <input type="hidden" name="finalPageNo" value="${pageVO.finalPageNo}">
        <c:if test="${pageVO.pageNo > 1 }">
            <li class="page"><a href="javascript:fn_movePage(${pageVO.firstPageNo})" class="btn_paging btn_first"><span>첫페이지</span></a></li>
            <li class="page"><a href="javascript:fn_movePage(${pageVO.pageNo - 1})" class="btn_paging btn_prev"><span>이전페이지</span></a></li>
        </c:if>
        <li class="page">
            <div class="input_box">
                <label for="pageCount">
                    <input type="tel" id="pageCount" class="input_txt" value="${pageVO.pageNo}" onchange="chagePage(this, '${pageVO.pageNo}')">
                </label>
                <span>/ ${pageVO.finalPageNo}</span>
            </div>
        </li>
        <c:if test="${pageVO.pageNo < pageVO.finalPageNo }">
            <li class="page"><a href="javascript:fn_movePage(${pageVO.pageNo + 1})" class="btn_paging btn_next"><span>다음페이지</span></a></li>
            <li class="page"><a href="javascript:fn_movePage(${pageVO.finalPageNo})" class="btn_paging btn_last"><span>마지막페이지</span></a>
        </c:if>
        </li>
    </c:if>
</ul>

-----------------------------------------

 // 페이징 검색
        function fn_paging() {
            let data = null;
            let search = sessionStorage.getItem("search_MANAGER");
            if (search != null) {
                data = JSON.parse(search);
                data.pageNo = $("input[name=pageNo]").val();
                data.pageSize = $("input[name=pageSize]").val();
                sessionStorage.setItem("search_MANAGER", JSON.stringify(data));
            } else {
                data = {
                    pageNo: $("input[name=pageNo]").val(),
                    pageSize: $("input[name=pageSize]").val()
                };
            }
            fn_select(data);
        }


Model에 extends PageNation
Controller에서 Model 짐싸기서 view로 가야함

 */

@Slf4j
@ToString
@Getter
@Setter
public class PageNation implements Serializable {

    private int pageSize;   // 한 페이지에 보여줄 게시글 수
    private int pageBlock;  // 페이징 네비[블록] 사이즈 ex) << < 1 2 3 4 5 6 7 8 9 10 > >>
    private int pageNo;     // 페이지 번호

    private int startNo;

    private int firstPageNo;// 첫 페이지 번호
    private int lastPageNo; // 마지막 페이지 번호
    private int prevPageNo; // 이전 페이지 번호
    private int nextPageNo; // 다음 페이지 번호
    private int startPageNo;// 시작 페이지 (페이징 네비 기준) ex) << < 1 2 3 4 5 6 7 8 9 10 > >> 이면 1 / << < 11 12 13 14 15 16 17 18 19 20 > >> 이면 11
    private int endPageNo;  // 마지막 페이지 (페이징 네비 기준)
    private int totalCount; // 게시글 전체 수


    // 필요에 따라 search 변수 등록

    // @Setter를 했어도 오버라이딩 가능
    public void setTotalCount(int totalCount){
        this.totalCount = totalCount;
        this.makePaging();
    }


    private void makePaging(){
        log.info("pageNo : {}", this.pageNo);
        // 기본값 설정 (들어오는 값이 없을 경우)
        if (this.totalCount == 0) return;

        if (this.pageNo == 1) {
            this.startNo = 0;
        }
        else {
            this.startNo = (this.pageNo - 1) * 10;
        }

        // [첫 페이지], [마지막 페이지] 계산
        int finalPage = this.totalCount / this.pageSize;
        finalPage = (this.totalCount % this.pageSize) == 0 ? finalPage : finalPage + 1;
        this.firstPageNo = 1;
        this.lastPageNo = finalPage;

        // [이전], [다음]
        this.prevPageNo = ((this.pageNo - 1) < 1 ? 1 : (this.pageNo - 1)); // pageNo - 1가 0일 경우 1이고 아니면 pageNo - 1

        if(this.pageNo == finalPage){ // 페이지넘버가 마지막페이지와 같은경우
            this.nextPageNo = this.firstPageNo; // > 는 1이 되라
        }else{
            this.nextPageNo = (this.pageNo + 1) > finalPage ? this.firstPageNo : (this.pageNo + 1); // pageNo + 1가 finalPage보다 크면 ...
        }


        if (this.pageBlock == 0) this.pageBlock = 3; // 기본 페이지 네비[블록] 사이즈

        // 페이징 네비[블록] 계산
        int startPage = ((this.pageNo -1) / this.pageBlock) * this.pageBlock + 1; // 시작 페이지 (페이징 네비 기준)
        int endPage = startPage + this.pageBlock - 1;

        // 페이징 네비가 만약 [20-30]인데 마지막 페이지가 28인 경우
        // [29, 30]은 미노출 해야한다.
        if(endPage > finalPage){
           endPage = finalPage;
        }
        this.startPageNo = startPage; // 시작 페이지 (페이징 네비 기준)
        this.endPageNo = endPage;     // 끝 페이지 (페이징 네비 기준)




    }
}
