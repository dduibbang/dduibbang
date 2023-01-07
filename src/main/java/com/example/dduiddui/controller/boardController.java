package com.example.dduiddui.controller;

import com.example.dduiddui.service.boardService;
import com.example.dduiddui.service.selectService;
import com.example.dduiddui.service.userService;
import com.example.dduiddui.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class boardController {

    @Autowired
    private userService userService;
    @Autowired
    private boardService boardService;

    @Autowired
    private selectService selectService;


    @GetMapping("/board")
    public String toWritePage(HttpSession session,  Model model) {
        // 헤더에 필요
        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        return "board";
    }


    @PostMapping("/board")
    public String write(HttpSession session,  boardVO boardVo){
        try {
            String id = (String) session.getAttribute("id");
            boardService.boardWrite(boardVo);


        } catch (DuplicateKeyException e) {
            return "redirect:/boardWrite?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/boardWrite?error_code=-99";
        }

        return "redirect:/home";
    }

    // 클릭한 게시글로
    @GetMapping("/board/{sn}")
    public String toBrdPage(@PathVariable String sn, HttpSession session, Model model) {
        int boardSn = Integer.parseInt(sn);
        session.setAttribute("boardSn", boardSn);

        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        boardVO brd = boardService.getBrd(boardSn);
        model.addAttribute("brd", brd);

        Integer strSn = brd.getStr_sn();
        selectVO selectVO = selectService.getStrBySn(strSn);
        model.addAttribute("strImg", selectVO.getStr_img());
        model.addAttribute("strNm", selectVO.getStr_nm());

//        System.out.println("boardPageboardPage");
//        System.out.println("strSn: " + strSn);
//        System.out.println("selectVO: " + selectVO);

        return "boardPage";
    }

}
