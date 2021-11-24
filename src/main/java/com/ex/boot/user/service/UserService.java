package com.ex.boot.user.service;

import com.ex.boot.user.mapper.UserMapper;
import com.ex.boot.user.model.UserDetail;
import com.ex.boot.user.model.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Slf4j
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

    public Map<String, String> saveByUser(UserInfo userInfo){
        Map<String, String> resultMap = new HashMap<>();

        int count = userMapper.findByUserCount(userInfo.getUserId());
        log.info("count ::: {}", count);
        if(count > 0){
            resultMap.put("code", "100");
        } else {
            userInfo.setUserPw(passwordEncoder.encode(userInfo.getUserPw()));
            userInfo.setAuthorize("ROLE_USER");

            log.info("saveByUser service {} ", userInfo);

            userMapper.saveByUser(userInfo);
            resultMap.put("code", "200");
        }
        return resultMap;
    }

    public String findById(UserInfo userInfo){
        return userMapper.findById(userInfo);
    }


    public int findByPwCount(UserInfo userInfo){
        return userMapper.findByPwCount(userInfo);
    }

    public Map<String,String> updateByPw(UserInfo userInfo){
        userInfo.setUserPw(passwordEncoder.encode(userInfo.getUserPw()));
        int count = userMapper.updateByPw(userInfo);
        Map<String,String> resultMap = new HashMap<>();
        if(count == 0){
            resultMap.put("code", "100");
            resultMap.put("message", "비밀번호 변경이 실패했습니다.");
            return resultMap;
        }
        resultMap.put("code", "200");
        resultMap.put("message", "비밀번호가 변경되었습니다.");
        return resultMap;
    }


}
