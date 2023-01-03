package com.example.dduiddui.controller;

import com.example.dduiddui.service.selectService;
import com.example.dduiddui.vo.boardVO;
import com.example.dduiddui.vo.selectVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class selectController {
    @Autowired
    private selectService selectService;

    @GetMapping("/select")
    public String toSelectPage(Model model){

        List<selectVO> selectList = selectService.getSelectList();
        model.addAttribute("selectList", selectList);

        return "select";
    }


}
