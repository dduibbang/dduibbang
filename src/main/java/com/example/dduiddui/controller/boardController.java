package com.example.dduiddui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class boardController {
    @GetMapping("/write")
    public String toWritePage() {  //회원가입 페이지
        return "board_write";
    }
}
