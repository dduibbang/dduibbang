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

        address = addressMapper.getAddress(mbrSn).getAdr_cn() +
                " " + addressMapper.getAddress(mbrSn).getAdr_st();
        System.out.println("address" + address);

        return address;
    }

    public void updateAdr(Integer mbrSn){

        addressMapper.updateAdr(mbrSn); // 이미 기존의 기본주소가 있다면 체크해제
        System.out.println("update");
    }

    public void updateMainAdr(Integer adrSn){

        addressMapper.updateMainAdr(adrSn); // 해당adrSn을 기본주소로 변경
        System.out.println("updateMain");
    }


    // 사용자의 기본주소 등록하기 + 즐찾목록에 추가
//    public void uploadAdr(addressVO addressVO) {
//
//        addressVO.setRgtr_dt(LocalDateTime.now());
//        String getTime = String.valueOf(LocalDateTime.now());
//
//        addressVO.setDft_yn('Y');
//        addressVO.setAdr_ttl(getTime.substring(0,10) + "의 주소 이력");
//        addressMapper.insertAddr(addressVO);
//        System.out.println("insert : " + addressVO.getDft_yn());
//
//    }


    // 즐찾이름으로 adrVO 받기
    public addressVO getAdrByTtl(String adrTtl) {
        return addressMapper.getAdrByTtl(adrTtl);
    }

    // 즐찾이름으로 adr_sn받기
    public Integer getAdrSn(String adrTtl) {

        addressVO addressVO = addressMapper.getAdrByTtl(adrTtl);

        return addressVO.getAdr_sn();
    }
}