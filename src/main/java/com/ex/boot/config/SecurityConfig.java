package com.ex.boot.config;

import com.ex.boot.config.handler.LoginFailureHandler;
import com.ex.boot.config.handler.LoginSuccessHandler;
import com.ex.boot.config.provider.LoginAuthenticationProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public AuthenticationProvider authenticationProvider(){return new LoginAuthenticationProvider();}

    @Bean
    public AuthenticationSuccessHandler successHandlerHandler() {
        return new LoginSuccessHandler();
    }

    @Bean
    public AuthenticationFailureHandler failureHandlerHandler() {
        return new LoginFailureHandler();
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/js/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/", "/error*", "/login", "/loginProc").permitAll()
                .and()
                .formLogin()
                .loginPage("/") // 로그인 페이지 링크
                .loginProcessingUrl("/loginProc")
                .usernameParameter("userId")
                .passwordParameter("userPw")
                .successHandler(successHandlerHandler())
                .failureHandler(failureHandlerHandler())
                .permitAll()
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/") // 로그아웃 성공시 리다이렉트 주소
                .invalidateHttpSession(true) // 세션 날리기
                .and()
                .exceptionHandling();
    }




}
