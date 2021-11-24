package com.ex.boot.board.service;

import com.ex.boot.board.mapper.BoardMapper;
import com.ex.boot.board.model.BoardInfo;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    BoardMapper boardMapper;

    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public List<BoardInfo> getBoardList(){ return boardMapper.getBoardList(); }

    public Map<String, String> saveByBoard(BoardInfo boardInfo) {
        Map<String, String> resultMap = new HashMap<>();
        int count = boardMapper.saveByBoard(boardInfo);
        if(count == 0){
            resultMap.put("code", "100");
            resultMap.put("message", "글작성이 실패되었습니다.");

        }else {
            resultMap.put("code", "200");
            resultMap.put("message", "글작성이 완료되었습니다.");
        }
        return resultMap;
    }
}
