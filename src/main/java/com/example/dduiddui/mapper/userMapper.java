package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface userMapper {
    userVO getUserById(String mbrId);
    //userVO getUserByVO(userVO userVo);    // 회원 정보 가져오기(mbr_sn 받기 위해 필요)

    userVO getUserBySn(Integer mbrSn);
    void insertUser(userVO userVo); // 회원가입
    userVO updatePW(userVO userVo);

    void updateUser(userVO userVo);
    void updatePoint(userVO userVo);
}
