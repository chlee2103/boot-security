package com.ex.boot.board.controller;

import com.ex.boot.board.model.BoardInfo;
import com.ex.boot.board.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;
import java.util.Map;

@RequestMapping(value = "/board")
@Controller
@Slf4j
public class BoardController {

    BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    /**
     * 게시판 이동
     * @return
     */
    @GetMapping("/boardList")
    public String boardList(){
        return "/board/boardList";
    }

    /**
     * 글목록 가져오기
     * @param model
     * @return
     */
    @PostMapping("/boardContent")
    public String boardContent(Model model, BoardInfo boardInfo){
        int totalCount = boardService.getBoardTotalCount(boardInfo);
        boardInfo.setTotalCount(totalCount);

        List<BoardInfo> boardList = boardService.getBoardList(boardInfo);

        model.addAttribute("page", boardInfo);
        model.addAttribute("boardList", boardList);
        return "/board/boardContent";
    }

    @GetMapping("/boardDetail")
    public ModelAndView boardDetail(Principal principal, Integer boardSeq){
        ModelAndView mav = new ModelAndView("/board/boardDetail");
        if(boardSeq != null && (!boardSeq.equals(""))){
            BoardInfo boardInfo = boardService.getBoard(boardSeq);
            mav.addObject("boardInfo", boardInfo);
        }
        mav.addObject("principal", principal);
        return mav;
    }

    @ResponseBody
    @PostMapping("/boardWrite")
    public Map<String, String> boardWrite(@RequestBody BoardInfo boardInfo){
        return boardService.saveByBoard(boardInfo);
    }
}
