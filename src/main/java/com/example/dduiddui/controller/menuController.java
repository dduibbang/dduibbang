package com.example.dduiddui.controller;

import com.example.dduiddui.service.boardService;
import com.example.dduiddui.service.menuService;
import com.example.dduiddui.vo.boardVO;
import com.example.dduiddui.vo.menuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class menuController {

    @Autowired
    private menuService menuService;

    @Autowired
    private boardService boardService;

    @GetMapping("/menu")
    public String toMenuPage(HttpSession session, Model model){


        Integer boardSn = (Integer) session.getAttribute("boardSn");
        System.out.println("boardSn : " + boardSn);

        boardVO brdVO = boardService.getBrd(boardSn);
        model.addAttribute("brdVO", brdVO);

        Integer strSn = brdVO.getStr_sn();

        List<menuVO> menuVOList = menuService.getMenuByStrSn(strSn);
        model.addAttribute("menuVOList", menuVOList);

        return "menu";
    }
}
