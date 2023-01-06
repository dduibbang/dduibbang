package com.example.dduiddui.controller;
import com.example.dduiddui.vo.*;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import com.example.dduiddui.service.addressService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.dduiddui.service.userService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class addressController {

    @Autowired // 전역변수 선언
    private addressService addressService;

    // 즐찾목록의 기본주소 설정 버튼
    @RequestMapping(value = "/setAddressBtn",method = RequestMethod.GET)
    public String setAddressBtn(String adr_ttl, HttpSession session){

        System.out.println("adr_ttl : " + adr_ttl);
        Integer sn = (Integer) session.getAttribute("mbr_sn");

        // 해당주소의 sn 얻기
       Integer adrSn = addressService.getAdrSn(adr_ttl,sn);
       session.setAttribute("main_adr_sn",adrSn);
       System.out.println("adrSn : " + adrSn);

       // 기존의 기본주소 설정 체크해제
       addressService.updateAdr(sn);

       // adrvo 얻어와서 기본주소 설정
        addressService.updateMainAdr(adrSn);

       return "redirect:/map";
    }

    // 이 주소로 기본주소 등록하기 버튼
    @PostMapping("/setAddress")
    public String setAddress(HttpSession session,addressVO addressVO,Model model){

        Integer sn = (Integer) session.getAttribute("mbr_sn");
        if(sn != null) {

            // 일단 주소목록 추가
            addressVO.setRgtr_dt(LocalDateTime.now());
            String getTime = String.valueOf(LocalDateTime.now());
            Integer num = (Integer) session.getAttribute("adrListLength");
            num+=1;
            addressVO.setAdr_ttl(getTime.substring(5,7) +"월"+ getTime.substring(8,10) + "일 [" + num+"]");
            addressService.uploadLike(addressVO);

            // 기존의 기본주소 리셋 후 해당주소 기본주소 설정
            addressService.updateAdr(sn);
            Integer adrSn = addressService.getAdrSn(addressVO.getAdr_ttl(),sn);
            session.setAttribute("main_adr_sn",adrSn);
            //System.out.println("adrSn : " + adrSn);
            addressService.updateMainAdr(adrSn);

            return "redirect:/map";
        }
        return "redirect:/login";
    }

    // /home에서 로그인한 사용자가 등록한 기본주소 가져오기
    @ResponseBody
    @RequestMapping(value = "/getMyAddress",method = RequestMethod.GET)
    public String getMyAddress(HttpSession session, Model model) {

        String userAdr = "주소를 설정해주세요.";
        String id = (String) session.getAttribute("id");
        Integer sn = (Integer) session.getAttribute("mbr_sn");
        System.out.println("mbr_sn:" + sn);
        if (id != null) { // 로그인된 상태
            userAdr = addressService.getAddress(sn);
            model.addAttribute("userAdr",userAdr);
            System.out.println("adr:" + userAdr);
        }
        return userAdr;
    }


    // /map에서 로그인한 사용자가 등록한 즐겨찾기목록들 가져오기(지도에)
    @ResponseBody
    @RequestMapping(value = "/getLikeList",method = RequestMethod.GET)
    public List<addressVO> getLikeList(HttpSession session,Model model){
        Integer sn = (Integer) session.getAttribute("mbr_sn");
        Map<String, Object> res = new HashMap<>();
        res.put("success", Boolean.FALSE);
        res.put("searchList", null);

        if (sn != null) { // 로그인된 상태
            List<addressVO> likeList = addressService.getAddressList(sn);
            res.put("success", Boolean.TRUE);
            res.put("searchList", likeList);
            session.setAttribute("adrListLength",likeList.size());
            //System.out.println(likeList);
            return likeList;
        }
//        return new Gson().toJson(res).getBytes("UTF-8");
        return null;
    }

    // /map에서 로그인한 사용자가 등록한 즐겨찾기목록들(목록에)
    @GetMapping("/map")
    public String toMapPage(Model model, HttpSession session) { // 로그인 페이지
        String id = (String) session.getAttribute("id");
        Integer sn = (Integer) session.getAttribute("mbr_sn");
        if (id != null) { // 로그인된 상태
            model.addAttribute("sn", sn);

            // 즐찾목록
            List<addressVO> likeList = addressService.getAddressList(sn);
            session.setAttribute("likeAdrList",likeList);
            //System.out.println(likeList);
        }
        return "map";
    }

    // /map에서 즐겨찾기 장소 추가하기
    @PostMapping("/insertMap")
    public String insertMap( addressVO addressVO){
        try {
            //System.out.println(addressVO);
            addressService.uploadLike(addressVO);
        } catch (DuplicateKeyException e) {
            return "redirect:/login";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/login";
        }
        return "redirect:/map";
    }
}
