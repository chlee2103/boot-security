package com.ex.boot.config.handler;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String userId = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        List<GrantedAuthority> authorities = (List<GrantedAuthority>) authentication.getAuthorities();

        log.info("userID :{}", userId);
        log.info("userPW :{}", password);
        log.info("authorities :{}", authorities.get(0).getAuthority());
        String url = "/";

        response.sendRedirect(url);
    }
}
