package com.example.dduiddui.service;

import com.example.dduiddui.mapper.boardMapper;
import com.example.dduiddui.mapper.selectMapper;
import com.example.dduiddui.vo.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class boardService {

    @Autowired
    private boardMapper boardMapper;

    @Autowired
    private com.example.dduiddui.mapper.selectMapper selectMapper;

    public List<selectVO> getStrByNBrdSn(){

        List<selectVO> res =new ArrayList<>();
        List<boardVO> brdList = boardMapper.getNBoardList();

        for (int i=0;i<brdList.size();i++){
            res.add(selectMapper.getBoardStr(brdList.get(i).getBrd_sn()));
        }

        return res;
    }
    public List<selectVO> getStrByYBrdSn(){

        List<selectVO> res =new ArrayList<>();
        List<boardVO> brdList = boardMapper.getYBoardList();

        for (int i=0;i<brdList.size();i++){
            res.add(selectMapper.getBoardStr(brdList.get(i).getBrd_sn()));
        }

        return res;
    }
    public List<boardVO> getNBoardList(){return boardMapper.getNBoardList();}

    public List<boardVO> getYBoardList(){return boardMapper.getYBoardList();}

    public void boardWrite(boardVO boardVo) {

        boardVo.setRgtr_dt(LocalDateTime.now());
        boardMapper.insertBoard(boardVo);
    }

    public boardVO getBrd(Integer brd_sn) {
        return  boardMapper.getBrd(brd_sn);
    }

    // 검색 결과 게시물
    public List<boardVO> getSearchList(Character safe_yn,Integer searchCnd,String searchWrd){

        System.out.println("getSearchList " + boardMapper.getSearchList(safe_yn,searchCnd,searchWrd));
        System.out.println("getSearchList size" + boardMapper.getSearchList(safe_yn,searchCnd,searchWrd).size());
        return boardMapper.getSearchList(safe_yn,searchCnd,searchWrd);
    }

    // 검색 결과 게시물에 필요한 str_nm,str_img 겟
    public List<selectVO> getSearchListStr(Character safe_yn,Integer searchCnd,String searchWrd){

        List<selectVO> res =new ArrayList<>();
        List<boardVO> brdList = boardMapper.getSearchList(safe_yn,searchCnd,searchWrd);

        for (int i=0;i<brdList.size();i++){
            res.add(selectMapper.getBoardStr(brdList.get(i).getBrd_sn()));
        }
        return res;
    }

}
