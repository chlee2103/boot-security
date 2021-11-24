package com.ex.boot.user.controller;

import com.ex.boot.user.model.UserInfo;
import com.ex.boot.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Map;

@Slf4j
@Controller
public class UserController {

    UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * 회원가입
     * @return
     */
    @GetMapping("/save")
    public ModelAndView userSave(){
        ModelAndView mav = new ModelAndView("/member/saveForm");
        return mav;
    }

    /**
     * 회원가입, 아이디중복확인
     * @param userInfo
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/saveAf", method = RequestMethod.POST)
    public Map<String, String> userSaveAf(@RequestBody UserInfo userInfo) throws Exception{
        log.info("saveByUser controller {} ", userInfo);
        return userService.saveByUser(userInfo);
    }

    /**
     * 로그인
     * @param request
     * @param principal
     * @return
     */
    @PostMapping("/login")
    public ModelAndView userLogin(HttpServletRequest request, Principal principal){
        ModelAndView mav = new ModelAndView("/login");
        log.info("Principal  {}", principal);
        if(principal != null){
            mav.setViewName("/");
        }
        return mav;
    }


    @GetMapping( "/findId")
    public String findId(){
        return "/member/findId";
    }

    @ResponseBody
    @PostMapping("/findIdAf")
    public String findIdAf(@RequestBody UserInfo userInfo){
        log.info("{}", userInfo);
        String id = userService.findById(userInfo);
        log.info(id);
        return id;
    }

    @GetMapping( "/findPw")
    public String findPw(){
        return "/member/findPw";
    }

    @ResponseBody
    @PostMapping("/findPwAf")
    public int findPwAf(@RequestBody UserInfo userInfo){
        log.info("{}", userInfo);
        return userService.findByPwCount(userInfo);
    }


    @ResponseBody
    @PostMapping("/pwReset")
    public Map<String, String> findPwAf1(@RequestBody UserInfo userInfo){
        log.info("{}", userInfo);
        return userService.updateByPw(userInfo);
    }

}
