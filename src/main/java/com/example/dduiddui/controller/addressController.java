package com.example.dduiddui.controller;
import com.example.dduiddui.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import com.example.dduiddui.service.addressService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.dduiddui.service.userService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class addressController {

    @Autowired
    private addressService addressService;
    @Autowired
    private userService userService;

    // /home에서 로그인한 사용자가 등록한 기본주소 가져오기

    // /map에서 로그인한 사용자가 등록한 즐겨찾기목록들 가져오기

    @GetMapping("/map")
    public String toMapPage(Model model, HttpSession session, RedirectAttributes redirect) { // 로그인 페이지
        String id = (String) session.getAttribute("id");

        return "map";
    }


    // /map에서 즐겨찾기 장소 추가하기
    @PostMapping("/insertMap")
    public String insertMap( addressVO addressVO, HttpSession session){
        String resultmsg = "";
        try {
            addressService.uploadLike(addressVO);
            System.out.println("즐겨찾기 추가");
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/map";
    }

//    @GetMapping("/sendLocation")
//    public String sendLocation(HttpSession session, String location,String detailLocation, Model model) {
//        model.addAttribute("location",location);
//        model.addAttribute("detailLocation",detailLocation);
//        String userId = (String) session.getAttribute("id");
//        userVO userVo = userService.getUserById(userId);
//        model.addAttribute("user",userVo);
//        return "post";
//    }
//
//    @PostMapping(value="/sendLocation")
//    public String tosendLocation(mapVO mapVO) {
//        postServiceImpl.upload(postVo);
//        return "redirect:/main";
//    }
}
