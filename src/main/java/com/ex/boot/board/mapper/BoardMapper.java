package com.ex.boot.board.mapper;

import com.ex.boot.board.model.BoardInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardInfo> getBoardList(BoardInfo boardInfo);
    int getBoardTotalCount(BoardInfo boardInfo);
    int saveByBoard(BoardInfo boardInfo);
    int updateReadCount(int boardSeq);
    BoardInfo getBoard(int boardSeq);
}
