package com.ex.boot.board.model;

import com.ex.boot.common.paging.PageNation;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardInfo extends PageNation {

    private int   boardSeq;
    private String boardTitle;
    private String regId;
    private String boardContent;
    private String filePath;        // 첨부파일
    private String regDtm;
    private String lastUptDtm;      // 마지막수정일시시
    private String dltYn;           // 삭제여부 : default N, 삭제시 Y
    private int    readCount;

    private int rnum;

}
