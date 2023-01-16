package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.boardVO;
import com.example.dduiddui.vo.storeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface boardMapper {


    List<boardVO> getNBoardList();

    List<boardVO> getYBoardList();

    void insertBoard(boardVO boardVo);

    boardVO getBrd(Integer brd_sn);

    List<boardVO> getSearchList(Character safe_yn,Integer searchCnd,String searchWrd);

    List<storeVO> getStoreList();
    storeVO getStr(Integer str_sn);

    List<boardVO> getMywriteList(String mbr_id);
}
