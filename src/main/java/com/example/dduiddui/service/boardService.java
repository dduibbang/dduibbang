package com.example.dduiddui.service;

import com.example.dduiddui.mapper.boardMapper;
import com.example.dduiddui.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class boardService {

    @Autowired
    private boardMapper boardMapper;



    public List<boardVO> getBoardList(){return boardMapper.getBoardList();}

    public void boardWrite(boardVO boardVo) {

        boardMapper.insertBoard(boardVo);

    }

}
