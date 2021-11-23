package com.ex.boot.user.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserInfo {
    private long seq;
    private String userId;
    private String userPw;
    private String userNick;
    private String userName;
    private String authorize; // ROLE_USER, ROLE_ADMIN, ROLE_DBA
    private String userPhone;
    private String isOff;
    private String isAdm;
    private String dltYm;
    private String description;
    private Date regDtm;
    private Date udtDtm;
}
