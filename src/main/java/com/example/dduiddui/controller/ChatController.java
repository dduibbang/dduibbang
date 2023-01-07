package com.example.dduiddui.controller;

import com.example.dduiddui.service.boardService;
import com.example.dduiddui.service.userService;
import com.example.dduiddui.vo.boardVO;
import com.example.dduiddui.vo.userVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class ChatController {

    @Autowired
    private userService userService;
    @Autowired
    private boardService boardService;

    @RequestMapping("/chat")
    public ModelAndView chat(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        int boardSn = (int) session.getAttribute("boardSn");
        System.out.println(id);
        model.addAttribute("id",id);  //채팅창에 id 자동으로 설정하기 위함

        boardVO brd = boardService.getBrd(boardSn);
        System.out.println(boardSn);
        model.addAttribute("brd", brd);// 채팅창에 게싯글 제목을 받기 위함



        ModelAndView mv = new ModelAndView();
        mv.setViewName("chat");
        return mv;
    }



}


