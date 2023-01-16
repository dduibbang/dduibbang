package com.example.dduiddui.service;

import com.example.dduiddui.vo.addressVO;
import com.example.dduiddui.vo.authVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.dduiddui.mapper.authMapper;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class authService {

    @Autowired
    private authMapper authMapper;

    public void insertAuth(Integer mbr_sn,Integer brd_sn) {

        authMapper.insertAuth(mbr_sn,brd_sn);
    }

    public authVO getAuth(Integer mbrSn) {

        authVO authVO = authMapper.getAuth(mbrSn);

        return authVO;
    }

    public List<authVO> getAuthList(Integer brdSn) {

        List<authVO> authVOList = authMapper.getAuthList(brdSn);

        return authVOList;
    }
}
