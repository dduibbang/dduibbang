package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.bossVO;
import com.example.dduiddui.vo.menuVO;
import com.example.dduiddui.vo.userVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface bossMapper {


    userVO getBossById(String mbr_id);
    List<bossVO> getStoreById(int mbr_sn);
    menuVO getMenuBySn(int str_sn);

    List<menuVO> getMenuListBySn(int str_sn);
    void insertStore(bossVO bossVo);

    void insertMenu(menuVO menuVo);

}