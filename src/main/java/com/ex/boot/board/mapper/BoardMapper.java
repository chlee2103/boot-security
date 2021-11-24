package com.ex.boot.board.mapper;

import com.ex.boot.board.model.BoardInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardInfo> getBoardList();

    int saveByBoard(BoardInfo boardInfo);
}
