package com.example.dduiddui.service;

import com.example.dduiddui.mapper.userMapper;
import com.example.dduiddui.vo.addressVO;
import com.example.dduiddui.vo.userVO;
import jdk.vm.ci.meta.Local;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.dduiddui.mapper.addressMapper;

import java.time.LocalDateTime;
import java.util.List;


@Service
public class addressService {
    @Autowired
    private addressMapper addressMapper;

    public List<addressVO> getAddressList(Integer mbrSn) {
        return addressMapper.getAddressList(mbrSn);
    }

    public void uploadLike(addressVO addressVO) {
        addressVO.setRgtr_dt(LocalDateTime.now());
//        if(addressVO.getAdr_st().equals("상세주소를 입력해주세요."))
//            addressVO.setAdr_st(null);

        addressMapper.insertAddr(addressVO);
    }
    public String getAddress(Integer mbrSn) {
        String address = "";

        address = addressMapper.getAddress(mbrSn).getAdr_cn() + " " + addressMapper.getAddress(mbrSn).getAdr_st();
        System.out.println("address" + address);

        return address;
    }
}