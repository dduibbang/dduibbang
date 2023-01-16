package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.addressVO;
import com.example.dduiddui.vo.authVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface authMapper {

    void insertAuth(Integer mbr_sn,Integer brd_sn);

    authVO getAuth(Integer mbrSn);

    List<authVO> getOrderList(Integer mbrSn);

    List<authVO> getAuthList(Integer brdSn);
}
