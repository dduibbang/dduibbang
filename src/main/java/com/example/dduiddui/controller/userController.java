package com.example.dduiddui.controller;

import com.example.dduiddui.service.userService;
import com.example.dduiddui.vo.*;
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
public class userController {
    @Autowired
    private userService userService;

    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");



        if (id != null) { // 로그인된 상태
            userVO userVo = userService.getUserById(id);
            model.addAttribute("userInfo", userVo);
        }
        return "home";
    }

    @ResponseBody
    @GetMapping("/accessr")
    public String accessRestriction() {
        String resultmsg = "";
        return resultmsg="<script>alert('접근제한');location.href='/home'</script>";
    }



    @GetMapping("/login")
    public String toLoginPage(Model model,HttpSession session,RedirectAttributes redirect) { // 로그인 페이지
        String id = (String) session.getAttribute("id");
        if (id != null) { // 로그인된 상태
            return "redirect:/";
        }
//        ModelAndView mv=new ModelAndView("login");
//        if(redirect.getAttribute("msg")!=null){
//            mv.addObject("msg",redirect.getAttribute("msg"));
//        }
//        return mv; // 로그인되지 않은 상태
        return "login";
    }



    @ResponseBody
    @PostMapping("/login")
    public String login(String mbr_id, String mbr_pwd, HttpSession session,Model model) { // 로그인
        System.out.println("user id: " + mbr_id);
        System.out.println("user pw: " + mbr_pwd);

        userVO userVo = userService.getUserById(mbr_id);
        model.addAttribute("userInfo", userVo);
        System.out.println(userVo);
        String resultmsg = "";
        if (userVo != null && userVo.getMbr_pwd().equals(mbr_pwd)) {
            String name = userVo.getMbr_nm();
            session.setAttribute("id",mbr_id);
            session.setAttribute("state","user");
            return resultmsg = "<script>location.href='/home'</script>";
        } else{//로그인 실패시
            return resultmsg = "<script>alert('로그인 실패');location.href='/login'</script>";
        }

    }

    @GetMapping("/signup")
    public String toSignupPage() {  //회원가입 페이지
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(userVO userVo) { // 회원가입
        try {
            userService.signup(userVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) { // 로그아웃
        session.invalidate();
        System.out.println("logout");
        return "redirect:/home";
    }


}
