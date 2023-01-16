package com.example.dduiddui.controller;

import com.example.dduiddui.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import com.example.dduiddui.service.authService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class authController {

    @Autowired
    private authService authService;

//    // 배달비 빵 결제이력 추가
//    @PostMapping("/insertAuth")
//    public String insertAuth(authVO authVO){
//
//            System.out.println(authVO);
//            authService.insertAuth(authVO);
//
//        return "redirect:/map";
//    }


}
