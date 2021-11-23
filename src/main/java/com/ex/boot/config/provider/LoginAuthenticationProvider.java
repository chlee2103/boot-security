package com.ex.boot.config.provider;

import com.ex.boot.user.model.UserDetail;
import com.ex.boot.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

@Slf4j
public class LoginAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String userId = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        UserDetail userDetail = null;
        List<GrantedAuthority> authorities = null;

        userDetail = (UserDetail) userService.loadUserByUsername(userId);
        authorities = (List<GrantedAuthority>) userDetail.getAuthorities();
        String auth = authorities.get(0).getAuthority();
        log.info("auth {}", authorities.get(0).getAuthority());
        log.info("???? {}", !"ROLE_USER".equals(auth));
        if(userDetail == null) throw new BadCredentialsException("아이디와 패스워드를 확인해주세요.");
        if(!passwordEncoder.matches(password, userDetail.getPassword())) throw new BadCredentialsException("비밀번호가 불일치 합니다.");
        if(!"ROLE_USER".equals(auth)){
            throw new BadCredentialsException("권한이 없습니다.");
        }
        else authorities = (List<GrantedAuthority>) userDetail.getAuthorities();


        return new UsernamePasswordAuthenticationToken(userId, password, authorities);
    }


}
