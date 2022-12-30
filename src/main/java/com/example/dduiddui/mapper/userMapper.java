package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface userMapper {
    userVO getUserById(String mbrId);
    userVO getUserByVO(userVO userVo);    // 회원 정보 가져오기
    void updateUser(userVO userVo); // 회원 정보 수정
    void insertUser(userVO userVo); // 회원가입

}
