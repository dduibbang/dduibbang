package com.example.dduiddui.controller;

import com.example.dduiddui.service.boardService;
import com.example.dduiddui.service.userService;
import com.example.dduiddui.service.addressService;
import com.example.dduiddui.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class userController {
    @Autowired
    private userService userService;

    @Autowired
    private boardService boardService;


    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        System.out.println(id);

        List<boardVO> NboardList = boardService.getNBoardList();
        model.addAttribute("NboardList", NboardList);

        List<boardVO> YboardList = boardService.getYBoardList();
        model.addAttribute("YboardList", YboardList);

        Integer sn = (Integer) session.getAttribute("mbr_sn");
        System.out.println("home");
        System.out.println("user sn: " + sn);
        System.out.println("user id: " + id);

        List<selectVO> selectVONList = boardService.getStrByNBrdSn();
        model.addAttribute("selectVONList", selectVONList);

        List<selectVO> selectVOYList = boardService.getStrByYBrdSn();
        model.addAttribute("selectVOYList", selectVOYList);

        if (id != null) { // 로그인된 상태
            userVO userVo = userService.getUserById(id);
            model.addAttribute("userInfo", userVo);
            model.addAttribute("sn", sn);
        }
        return "home";
    }

    @ResponseBody
    @GetMapping("/accessr")
    public String accessRestriction() {
        String resultmsg = "";
        return resultmsg="<script>alert('접근제한');location.href='/home'</script>";
    }

    @RequestMapping("/map")
    public String toMapPage() {  //회원가입 페이지
        return "map";
    }


    @GetMapping("/memberInfo")
    public String mbrInfoPage(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        Integer sn = (Integer) session.getAttribute("mbr_sn");

        if (id != null) { // 로그인된 상태
            userVO userVo = userService.getUserById(id);
            model.addAttribute("userInfo", userVo);
            model.addAttribute("sn", sn);
        }

        return "memberInfo";
    }
    @GetMapping("/updatePw")
    public String toupdatePwPage(){

        return "updatePw";
    }

    //비밀번호 확인 처리 요청
    @PostMapping("/checkPw")
    public String checkPw(@RequestBody String pw, HttpSession session) throws Exception{
        System.out.println("비밀번호 확인 요청");

        String result = null;

        userVO userVo = (userVO) session.getAttribute("login");
        System.out.println("회원님의 기존 비밀번호 : " + userVo.getMbr_pwd());
        System.out.println("폼에서 받아온 비밀번호 : " + pw);

        if(pw == userVo.getMbr_pwd()){
            result = "pwConfirmOK";
        }else{
            result = "pwConfirmNO";
        }
        return result;
    }

    @PostMapping("/updatePw")
    public String updatePw(@RequestBody userVO userVo, HttpSession session) throws Exception{
        System.out.println("비밀번호 변경 요청!!!");

        //비번 변경
        userService.updatePW(userVo);

        //비번 변경 성공시
        return "변경 성공";
    }

    @GetMapping("/login")
    public String toLoginPage(Model model,HttpSession session,RedirectAttributes redirect) { // 로그인 페이지
        Integer sn = (Integer) session.getAttribute("mbr_sn");
        System.out.println("user sn: " + sn);
        //String id = (String) session.getAttribute("id");
        if (sn != null) { // 로그인된 상태
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
        System.out.println("login");
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

            Integer mbrSn = userService.getMbrSn(mbr_id);
            session.setAttribute("mbr_sn",mbrSn);
            System.out.println("user sn: " + mbrSn);
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
