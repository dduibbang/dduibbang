package com.example.dduiddui.service;


import com.example.dduiddui.mapper.userMapper;
import com.example.dduiddui.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class userService {
    @Autowired
    private userMapper userMapper;

    public userVO getUserById(String mbrId) {
        return userMapper.getUserById(mbrId);
    }
    public Integer getMbrSn(String mbr_id, String password) {
        userVO userVo = userMapper.getUserById(mbr_id);
        userVO loginMember = userMapper.getUserByVO(userVo);
        LoginResponse loginResponse = new LoginResponse();

        //userMapper.updateUser(loginMember);
        loginResponse.setLoginMember(loginMember);
        loginResponse.setSuccess(true);

        if (false == loginResponse.isSuccess()) {
            return 0;
        }
        return userVo.getMbr_sn();
    }

//    public userVO getAddress(Integer mbrSn) {
//        System.out.println("test:"+userMapper.getAddress(mbrSn));
//        return userMapper.getAddress(mbrSn);
//    }

    public userVO getUserBySn(Integer mbr_sn) {
        return userMapper.getUserBySn(mbr_sn);
    }
    public void signup(userVO userVo) {
        userMapper.insertUser(userVo);
    }




}
