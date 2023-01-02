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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class addressController {

    @Autowired
    private addressService addressService;
    @Autowired
    private userService userService;

    // /home에서 로그인한 사용자가 등록한 기본주소 가져오기

    // /map에서 로그인한 사용자가 등록한 즐겨찾기목록들 가져오기(지도에)
//    @ResponseBody
//    @GetMapping("/getLikeList")
//    private byte[] getLikeList(HttpSession session,addressVO addressVO) throws Exception{
//
//        Map<String, Object> res = new HashMap<>();
//        res.put("success", Boolean.FALSE);
//        Character sd = 'Y';
//        addressVO.setUse_yn(sd);//(Character(session.getAttribute("intteSeq").toString()));
//        List<addressVO> searchList = freeServiceImpl.choiceFree(addressVO);
//        res.put("searchList", searchList);
//        return new Gson().toJson(res).getBytes("UTF-8");
//    }

    // /map에서 로그인한 사용자가 등록한 즐겨찾기목록들 가져오기(목록에)
    @GetMapping("/map")
    public String toMapPage(Model model, HttpSession session, RedirectAttributes redirect) { // 로그인 페이지
        String id = (String) session.getAttribute("id");
        Integer sn = (Integer) session.getAttribute("mbr_sn");
        if (id != null) { // 로그인된 상태
            userVO userVo = userService.getUserById(id);
            model.addAttribute("userInfo", userVo);
            model.addAttribute("sn", sn);

            List<addressVO> likeList = addressService.getAddressList(sn);
            model.addAttribute("likeAdrList",likeList);
            System.out.println(likeList);
        }
        return "map";
    }

    // /map에서 즐겨찾기 장소 추가하기
    @PostMapping("/insertMap")
    public String insertMap( addressVO addressVO, HttpSession session){
        try {
            if(addressVO.getAdr_st().equals("상세주소를 입력해주세요."))
                addressVO.setAdr_st(null);

            System.out.println(addressVO);
            addressService.uploadLike(addressVO);
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
