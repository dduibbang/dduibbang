package com.example.dduiddui.service;

import com.example.dduiddui.mapper.boardWriteMapper;
import com.example.dduiddui.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class boardWriteService {

    @Autowired
    private static boardWriteMapper boardWriteMapper;

    public static void write(boardWriteVO boardWriteVo) {
        boardWriteMapper.insertBoard(boardWriteVo);
    }

}
