package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.boardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface boardMapper {


    List<boardVO> getNBoardList();

    List<boardVO> getYBoardList();

    void insertBoard(boardVO boardVo);

    boardVO getBrd(Integer brd_sn);

    List<boardVO> getSearchList();

}
