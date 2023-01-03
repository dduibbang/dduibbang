package com.example.dduiddui.service;


import com.example.dduiddui.mapper.bossMapper;
import com.example.dduiddui.vo.bossVO;
import com.example.dduiddui.vo.menuVO;
import com.example.dduiddui.vo.userVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class bossService {

    @Autowired
    private bossMapper bossMapper;


    public userVO getBossById(String mbr_id){
        return bossMapper.getBossById(mbr_id);
    }

    public List<bossVO> getStoreById(int mbr_sn) {
        return bossMapper.getStoreById(mbr_sn);
    }

    public List<menuVO> getMenuBySn(int str_sn){


        return bossMapper.getMenuBySn(str_sn);
    }


}
