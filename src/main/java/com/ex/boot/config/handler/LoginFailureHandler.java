package com.ex.boot.config.handler;

import com.ex.boot.common.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        /**
         * 에러생성 후 로그인 실패처리
         */
        String message = exception.getMessage();

        log.info("{}", message);
        request.setAttribute("errorMessage", message); // view 에서 바로 꺼낼 수 있다.
        request.getRequestDispatcher("/login?error=true").forward(request, response);

    }

}
