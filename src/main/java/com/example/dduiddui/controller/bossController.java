package com.example.dduiddui.controller;


import com.example.dduiddui.service.bossService;
import com.example.dduiddui.service.userService;
import com.example.dduiddui.vo.bossVO;
import com.example.dduiddui.vo.menuVO;
import com.example.dduiddui.vo.selectVO;
import com.example.dduiddui.vo.userVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class bossController {

    @Autowired
    private bossService bossService;

    @GetMapping("/boss")
    public String getBoss(Model model,HttpSession session,RedirectAttributes redirect){

        Integer sn = (Integer) session.getAttribute("mbr_sn");
        System.out.println("user sn: " + sn);



        return "boss/boss";
    }

    @GetMapping("/bosslogin")
    public String toLoginPage(Model model, HttpSession session, RedirectAttributes redirect) { // 로그인 페이지
        String id = (String) session.getAttribute("id");
        if (id != null) { // 로그인된 상태
            return "redirect:/";
        }
//        ModelAndView mv=new ModelAndView("login");
//        if(redirect.getAttribute("msg")!=null){
//            mv.addObject("msg",redirect.getAttribute("msg"));
//        }
//        return mv; // 로그인되지 않은 상태
        return "boss/bosslogin";
    }

    @ResponseBody
    @PostMapping("/bosslogin")
    public String bosslogin(String boss_id, String boss_pw, HttpSession session,Model model) { // 로그인
        System.out.println("admin id: " + boss_id);
        System.out.println("admin pw: " + boss_pw);
//      String id = userService.login(userId, userPw);
        userVO bossVo = bossService.getBossById(boss_id);
        model.addAttribute("bossInfo", bossVo);
        String resultmsg = "";
        if (bossVo != null && bossVo.getMbr_pwd().equals(boss_pw)) {
            int mbr_sn = bossVo.getMbr_sn();
            session.setAttribute("id",boss_id);
            session.setAttribute("mbr_sn",mbr_sn);
            return resultmsg = "<script>location.href='boss'</script>";
        }
        else {//로그인 실패시

            return resultmsg = "<script>alert('로그인 실패');location.href='bosslogin'</script>";
        }

    }

    @GetMapping("/bosslogout")
    public String logout(HttpSession session) { // 로그아웃
        session.invalidate();
        System.out.println("logout");
        return "redirect:/bosslogin";
    }


    @GetMapping("/store")
    public String getStore(Model model,HttpSession session,RedirectAttributes redirect){


        try {
            Integer sn = (Integer) session.getAttribute("mbr_sn");
            System.out.println("store user sn: " + sn);
            int mbr_sn = (int)sn;
            List<bossVO> storeList = bossService.getStoreById(mbr_sn);
            model.addAttribute("storeList", storeList);

        } catch (NullPointerException e) {
            e.printStackTrace();
            return "boss/bosslogin";
        }


        return "boss/bossstore";
    }




    @GetMapping("/menu/{num}")
    public String toMenuPage(@RequestParam("num") int num, HttpSession session, Model model) { // 회원 정보 수정 페이지


        List<menuVO> menuList = bossService.getMenuListBySn(num);
        model.addAttribute("menu",menuList);

        return "boss/bossmenu";
    }



    @GetMapping("/regStore")
    public String toRegStorePage() {  //회원가입 페이지
        return "boss/popup";
    }
    @PostMapping("/regStore")
    public String toRegStore(bossVO bossVo ,HttpSession session){
       int sn = (int) session.getAttribute("mbr_sn");
       bossService.insertStore(bossVo);




        return "boss/popup";
    }

    @GetMapping("/storeDelete")
    public String deleteStore(@RequestParam("str_sn") int sn) { // 회원 정보 수정
        bossService.deleteStoreBySn(sn);
        return "redirect:/store";
    }

    @GetMapping("/menuDelete")
    public String deleteMenu(@RequestParam("menu_sn")int sn) { // 회원 정보 수정
        bossService.deleteMenuBySn(sn);
        return "redirect:/menu?num";
    }

}
