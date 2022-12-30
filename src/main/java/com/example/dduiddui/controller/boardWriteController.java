package com.example.dduiddui.controller;

import com.example.dduiddui.service.boardWriteService;
import com.example.dduiddui.vo.*;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class boardWriteController {
    @GetMapping("/write")
    public String toWritePage() {  //회원가입 페이지
        return "board_write";
    }


    @PostMapping("/write")
    public String write(boardWriteVO boardWriteVo){
        try {
            boardWriteService.write(boardWriteVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/boardWrite?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/boardWrite?error_code=-99";
        }
        return "redirect:/home";
    }

}
