package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.boardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface boardMapper {


    List<boardVO> getBoardList();

    void insertBoard(boardVO boardVo);



}
