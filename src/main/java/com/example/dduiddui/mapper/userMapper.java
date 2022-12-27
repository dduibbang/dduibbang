package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface userMapper {
    userVO getUserById(String mbr_id);
    void insertUser(userVO userVo); // 회원가입

}
