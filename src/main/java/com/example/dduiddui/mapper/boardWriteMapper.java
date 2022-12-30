package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.boardWriteVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface boardWriteMapper {
    void insertBoard(boardWriteVO boardWriteVo);
}
