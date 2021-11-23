package com.ex.boot.user.controller;

import com.ex.boot.user.model.UserInfo;
import com.ex.boot.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Slf4j
@Controller
public class UserController {

    UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/save", method = {RequestMethod.GET, RequestMethod.POST})
    public String userSave(HttpServletRequest request, UserInfo userInfo){
        if(StringUtils.equalsIgnoreCase("POST", request.getMethod())){
            if(userInfo != null){
                log.info("{}", userInfo);
                userService.saveByUser(userInfo);
                return "redirect:/";
            }else{
                return "/error";
            }
        }else{
            return "/saveForm";
        }
    }

    @PostMapping("/login")
    public ModelAndView userLogin(HttpServletRequest request, Principal principal){
 //       String errorMessage = (String) request.getAttribute("errorMessage");
        ModelAndView mav = new ModelAndView("/login");
        log.info("Principal  {}", principal);
 //       log.info("{}", errorMessage);
 //       mav.addObject("errorMessage", errorMessage);
        if(principal != null){
            mav.setViewName("/");
        }
        return mav;
    }
}
