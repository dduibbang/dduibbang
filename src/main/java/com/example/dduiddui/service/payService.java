package com.example.dduiddui.service;

import com.example.dduiddui.mapper.*;
import com.example.dduiddui.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class payService {

    @Autowired
    private payMapper payMapper;

    public void insertPay(payVO payVO) {
        payMapper.insertPay(payVO);
    }

    public List<payVO> getPayListBybrdSn(Integer brd_sn){
        return payMapper.getPayListBybrdSn(brd_sn);
    }
}
