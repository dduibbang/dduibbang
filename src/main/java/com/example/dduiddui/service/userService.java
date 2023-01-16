package com.example.dduiddui.service;


import com.example.dduiddui.mapper.userMapper;
import com.example.dduiddui.vo.*;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class userService {
    @Autowired
    private userMapper userMapper;

    public userVO getUserById(String mbrId) {
        return userMapper.getUserById(mbrId);
    }

    public Integer getMbrSn(String mbr_id) {
        userVO userVo = userMapper.getUserById(mbr_id);
        return userVo.getMbr_sn();
    }
//    public Integer getMbrSn(String mbr_id) {
//        userVO userVo = userMapper.getUserById(mbr_id);
//
//        userVO loginMember = userMapper.getUserByVO(userVo);
//        LoginResponse loginResponse = new LoginResponse();

//        loginResponse.setLoginMember(userVo);
//        loginResponse.setSuccess(true);
//
//        if (false == loginResponse.isSuccess()) {
//            return 0;
//        }
//        return userVo.getMbr_sn();
//    }

    public userVO getUserBySn(Integer mbr_sn) {
        return userMapper.getUserBySn(mbr_sn);
    }

    public userVO getUserID(Integer mbrSn){ return userMapper.getUserID(mbrSn);}
    public void signup(userVO userVo) {
        userMapper.insertUser(userVo);
    }

    public void updateInfo(userVO userVo) {

        userMapper.updateUser(userVo);
    }

    public void updatePoint(userVO userVo, int select_money ){
        System.out.println("충전한 포인트 : " + select_money);
        System.out.println("select_money vo wkf 들어갔니" + userVo.getSelect_money());
        System.out.println("그지같은 포인트 : " + userVo.getMbr_pt());
        userMapper.updatePoint(userVo);
    }
    public void payPoint(userVO userVo, int money){
        System.out.println("남은 포인트 : " + money);
        //System.out.println("select_money vo wkf 들어갔니" + userVo.getSelect_money());
        System.out.println("id : " + userVo.getMbr_id());
        userVo.setMbr_pt(String.valueOf(money));
        userMapper.payPoint(userVo);
    }
    //@Override
    public void updatePW(userVO userVo) throws Exception{
        System.out.println("암호화 전 비번 : " + userVo.getMbr_pwd());

        //새로운 비번 저장
        userVo.setMbr_pwd(userVo.getMbr_pwd());
        userMapper.updatePW(userVo);
        System.out.println("암호화 후 비번 : " + userVo.getMbr_pwd());
    }


}
