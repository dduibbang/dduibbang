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

    public void signup(userVO userVo) {
        userMapper.insertUser(userVo);
    }


}
