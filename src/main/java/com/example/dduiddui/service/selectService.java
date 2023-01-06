package com.example.dduiddui.service;

import com.example.dduiddui.mapper.selectMapper;
import com.example.dduiddui.vo.boardVO;
import com.example.dduiddui.vo.selectVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class selectService {
    @Autowired
    private selectMapper selectMapper;

    public List<selectVO> getSelectList(){
        return selectMapper.getSelectList();
    }

    public selectVO getStrBySn(Integer str_sn) {
        return  selectMapper.getStrBySn(str_sn);
    }
}
