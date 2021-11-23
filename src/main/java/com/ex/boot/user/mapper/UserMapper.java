package com.ex.boot.user.mapper;

import com.ex.boot.user.model.UserDetail;
import com.ex.boot.user.model.UserInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    UserDetail findByUser(String userId);
    int saveByUser(UserInfo userInfo);
    int findByUserCount(String userId);
}
