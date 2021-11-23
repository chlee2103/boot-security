package com.ex.boot.user.service;

import com.ex.boot.user.mapper.UserMapper;
import com.ex.boot.user.model.UserDetail;
import com.ex.boot.user.model.UserInfo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {

    UserMapper userMapper;
    PasswordEncoder passwordEncoder;

    public UserService(UserMapper userMapper, PasswordEncoder passwordEncoder) {
        this.userMapper = userMapper;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetail userDetail = userMapper.findByUser(username);

        return userDetail;
    }

    public Integer saveByUser(UserInfo userInfo){

        userInfo.setUserPw(passwordEncoder.encode(userInfo.getUserPw()));
        userInfo.setAuthorize("ROLE_USER");

        return userMapper.saveByUser(userInfo);
    }
}
