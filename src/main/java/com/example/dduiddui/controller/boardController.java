package com.example.dduiddui.controller;

import com.example.dduiddui.service.boardService;
import com.example.dduiddui.service.menuService;
import com.example.dduiddui.service.selectService;
import com.example.dduiddui.service.userService;
import com.example.dduiddui.vo.*;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class boardController {

    @Autowired
    private userService userService;
    @Autowired
    private boardService boardService;
    @Autowired
    private selectService selectService;
    @Autowired
    private menuService menuService;

    @GetMapping("/brdOrder")
    public String toBrdOrderPage(HttpSession session, Model model) {

        Integer boardSn = (Integer) session.getAttribute("boardSn");
        System.out.println("boardSn : " + boardSn);

        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        boardVO boardVO = (boardVO) session.getAttribute("boardVO");
        System.out.println("boardVO : " + boardVO);

        Integer strSn = boardVO.getStr_sn();
        List<menuVO> menuVOList = menuService.getMenuByStrSn(strSn);
        model.addAttribute("menuVOList", menuVOList);

        return "brdOrder";
    }

    // 네비바의 주문현황페이지(과거+현재 주문)
    @GetMapping("/orderList")
    public String toOrderPage(HttpSession session, Model model) {

        // 헤더에 필요
        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        // 추후에 주문 참여한 게시물만 가져오는 걸로 수정하기!
        List<boardVO> NboardList = boardService.getNBoardList();
        model.addAttribute("NboardList", NboardList);

        List<boardVO> YboardList = boardService.getYBoardList();
        model.addAttribute("YboardList", YboardList);

        List<selectVO> selectVONList = boardService.getStrByNBrdSn();
        model.addAttribute("selectVONList", selectVONList);

        List<selectVO> selectVOYList = boardService.getStrByYBrdSn();
        model.addAttribute("selectVOYList", selectVOYList);

        return "orderList";
    }

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

        System.out.println("boardSn : " + sn);
        Integer boardSn = Integer.parseInt(sn);
        session.setAttribute("boardSn", boardSn);

        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        boardVO brd = boardService.getBrd(boardSn);
        session.setAttribute("boardVO", brd);
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

    //배달비 결제창
    @GetMapping("/boardBbangPay")
    public String toBrdPayPage(HttpSession session, Model model) {
        Integer sn = (Integer) session.getAttribute("board_sn");

        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        boardVO brd = boardService.getBrd(sn);
        session.setAttribute("boardVO", brd);
        model.addAttribute("brd", brd);

//        Integer strSn = brd.getStr_sn();
//        selectVO selectVO = selectService.getStrBySn(strSn);
//        model.addAttribute("strImg", selectVO.getStr_img());
//        model.addAttribute("strNm", selectVO.getStr_nm());

//        System.out.println("boardPageboardPage");
//        System.out.println("strSn: " + strSn);
//        System.out.println("selectVO: " + selectVO);

        return "boardBbangPay";
    }


    @PostMapping("/boardBbangPay")
    public String toBbangPayPage( int afterB, HttpSession session,  userVO userVo){
        Integer money = afterB;
        System.out.println("결제 후 포인트 :" + money);
        try {
            System.out.println("현재 가진 포인트" + userVo.getMbr_pt());
            System.out.println("결제 후 포인트 try 문 :" + money);
            userService.payPoint(userVo, money);

        } catch (DuplicateKeyException e) {
            return "redirect:/ChargePay?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/ChargePay?error_code=-99";
        }

        return "redirect:/boardBbangPay";
    }


    @ResponseBody
    @RequestMapping(value = "/getSearchList", method = RequestMethod.GET)
    private Map<String, Object> getSearchList(HttpServletRequest request) throws Exception{

        String safe_yn = request.getParameter("safe_yn");
        Integer searchCnd = Integer.valueOf(request.getParameter("searchCnd"));
        String searchWrd = request.getParameter("searchWrd");

//        System.out.println("getSearchList request " + request.getParameter("searchCnd")
//                + request.getParameter("searchWrd") + request.getParameter("safe_yn"));

        Map<String, Object> res = new HashMap<>();
        res.put("success", Boolean.FALSE);
        List<boardVO> searchList = boardService.getSearchList(safe_yn.charAt(0),searchCnd,searchWrd);
        List<selectVO> searchListStr = boardService.getSearchListStr(safe_yn.charAt(0),searchCnd,searchWrd);
        List<String> searchListBrdSt = boardService.getSearchListBrdSt(safe_yn.charAt(0),searchCnd,searchWrd);

        if(searchList.size()!=0) {
            res.put("searchList", searchList);
            res.put("searchListStr", searchListStr);
            res.put("searchListBrdSt", searchListBrdSt);
            res.put("success", Boolean.TRUE);
            System.out.println("res:" + res);

        }

        System.out.println("res:" + res);
        return res;
    }
}
