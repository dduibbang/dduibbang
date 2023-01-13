package com.example.dduiddui.service;

import com.example.dduiddui.vo.menuVO;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.dduiddui.mapper.menuMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class menuService {

    @Autowired
    private menuMapper menuMapper;

    public List<menuVO> getMenuByStrSn(Integer str_sn){
        return menuMapper.getMenuByStrSn(str_sn);
    }

}
