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

        if(payVO.getPay_yn() == null)
            payVO.setPay_yn('N');
        if(payVO.getOdr_yn() == null)
            payVO.setOdr_yn('N');
        if(payVO.getDiv_yn() == null)
            payVO.setDiv_yn('N');

        payMapper.insertPay(payVO);
    }

    public List<payVO> getPayListBybrdSn(Integer brd_sn){
        return payMapper.getPayListBybrdSn(brd_sn);
    }

    public void updatePay(payVO payVO){

        if(payVO.getPay_yn() == null)
            payVO.setPay_yn('N');
        if(payVO.getOdr_yn() == null)
            payVO.setOdr_yn('N');
        if(payVO.getDiv_yn() == null)
            payVO.setDiv_yn('N');

        if(payVO.getPay_yn() == 'Y')
            payVO.setPay_yn('Y');
        if(payVO.getOdr_yn() == 'Y')
            payVO.setOdr_yn('Y');
        if(payVO.getDiv_yn() == 'Y')
            payVO.setDiv_yn('Y');

        payMapper.updatePay(payVO);
    }

    public void updatePayYn(Integer mbr_sn){

        payMapper.updatePayYn(mbr_sn);
    }


}
