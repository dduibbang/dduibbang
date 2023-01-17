package com.example.dduiddui.controller;

import com.example.dduiddui.service.*;
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
import java.util.ArrayList;
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

    @Autowired
    private authService authService;

    @Autowired
    private payService payService;


    @GetMapping("/brdOrder")
    public String toBrdOrderPage(HttpSession session, Model model) {

        authVO authBrdVO = (authVO) session.getAttribute("authBrdVO");
        Integer boardSn = authBrdVO.getBrd_sn();

        //Integer boardSn = (Integer) session.getAttribute("board");
        System.out.println("boardSn : " + boardSn);

        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        boardVO boardVO = (boardVO) session.getAttribute("boardVO");
        System.out.println("boardVO : " + boardVO);
        model.addAttribute("boardVO", boardVO);

        Integer strSn = boardVO.getStr_sn();
        List<menuVO> menuVOList = menuService.getMenuByStrSn(strSn);
        model.addAttribute("menuVOList", menuVOList);

        List<authVO> authVOList = authService.getAuthList(boardSn);
        model.addAttribute("authVOList", authVOList);

//        List<userVO> authUserVOList =new ArrayList<>();
//        for (int i=0;i<authVOList.size();i++){
//
//            // 해당 게시물의 배달비 엔빵에 참가한 유저 겟
//            userVO authUserVO = userService.getUserBySn(authVOList.get(i).getMbr_sn());
//            authUserVOList.add(authUserVO);
//        }
//        model.addAttribute("authUserVOList", authUserVOList);

        List<payVO> payVOList = payService.getPayListBybrdSn(boardSn);
        System.out.println("payVOList : " + payVOList);
        model.addAttribute("payVOList", payVOList);

        List<userVO> mbrVOList =new ArrayList<>();
        for (int i=0;i<payVOList.size();i++){

            // 해당 게시물의 배달비 엔빵에 참가한 유저 겟
            userVO payUserVO = userService.getUserBySn(payVOList.get(i).getMbr_sn());
            mbrVOList.add(payUserVO);
        }
        model.addAttribute("mbrVOList", mbrVOList);


        return "brdOrder";
    }

    @PostMapping("/updatePay")
    public String updatePay(payVO payVO){
        try {
            payService.updatePay(payVO);

        } catch (DuplicateKeyException e) {
            return "redirect:/brdOrder?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/brdOrder?error_code=-99";
        }

        return "redirect:/brdOrder";
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
        List<boardVO>  OrderList = boardService.getOrderList(mbr_sn);
        model.addAttribute("OrderList", OrderList);
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

        List<authVO> authVOList = authService.getAuthList(boardSn);
        model.addAttribute("authVOListSize", authVOList.size());

        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        boardVO brd = boardService.getBrd(boardSn);
        session.setAttribute("boardVO", brd);
        model.addAttribute("brd", brd);
        System.out.println("boardSn : " + sn);

        Integer strSn = brd.getStr_sn();
        selectVO selectVO = selectService.getStrBySn(strSn);
        model.addAttribute("strImg", selectVO.getStr_img());
        model.addAttribute("strNm", selectVO.getStr_nm());

        if (mbr_sn != null) { // 로그인된 상태
            authVO authVO = authService.getAuth(mbr_sn);
            System.out.println("authVO: " + authVO);

            if(authVO !=null){ // 사용자가 배달비 빵 결제한 이력이 있을 때

                if(authVO.getBrd_sn() == boardSn){
                    model.addAttribute("authYN", "Y");
                    session.setAttribute("authBrdVO", authVO);
                }else
                    model.addAttribute("authYN", "N");
            }else // 사용자가 배달비 빵 결제한 이력이 없을 때
                model.addAttribute("authYN", "N");

        }else // 사용자가 배달비 빵 결제한 이력이 없을 때
            model.addAttribute("authYN", "N");


//        System.out.println("boardPageboardPage");
//        System.out.println("strSn: " + strSn);
//        System.out.println("selectVO: " + selectVO);

        return "boardPage";
    }

    //배달비 결제창
    @GetMapping("/boardBbangPay")
    public String toBrdPayPage(HttpSession session, Model model) {
        Integer sn = (Integer) session.getAttribute("boardSn");
        model.addAttribute("board_sn",sn);
        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        boardVO brd = boardService.getBrd(sn);
        session.setAttribute("boardVO", brd);
        model.addAttribute("brd", brd);
        System.out.println("brd brd: " + sn);
        System.out.println("user sn: " + mbr_sn);

        return "boardBbangPay";
    }


    @PostMapping("/boardBbangPay")
    public String toBbangPayPage( int afterB,int board_sn, String mbr_sn, HttpSession session,  userVO userVo, payVO payVO, Model model){

        Integer boardSn = board_sn;
        session.setAttribute("boardSn", boardSn);
        boardVO brd = boardService.getBrd(boardSn);
        session.setAttribute("boardVO", brd);
        model.addAttribute("brd", brd);
        Integer money = afterB;
        //Integer mbr  (mbr_sn); Integer
        //userVo.setMbr_sn;
        //System.out.println("결제 후 포인트 :" + money);

            System.out.println("현재 가진 포인트" + userVo.getMbr_pt());
            System.out.println("결제 후 포인트 try 문 :" + money);
            userService.payPoint(userVo, money); // 빵 결제

            Integer mbrSn = (Integer) session.getAttribute("mbr_sn");
            authVO authVO = authService.getAuth(mbrSn);

            if(authVO == null){
                authService.insertAuth(mbrSn,boardSn); // 배달비 빵 결제이력 추가
                System.out.println("결제 후 포인트 try 문 :" + money);

//                payVO payVO = null;
//                payVO.setBrd_sn(brd.getBrd_sn());
//                payVO.setMbr_sn(mbrSn);
                payService.insertPay(payVO);
            }else{
                payService.updatePayYn(mbrSn);
            }

        return "redirect:/regEnd"; // 팝업창 사라지게하기
    }

    @GetMapping("/storePage")
    public String toStorePage(HttpSession session,  Model model) {
        // 헤더에 필요
        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        List<storeVO> storeList = boardService.getStoreList();
        model.addAttribute("storeList", storeList);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        return "storePage";
    }

    // 클릭한 가게로
    @GetMapping("/store/{sn}")
    public String toStorePage(@PathVariable String sn, HttpSession session, Model model) {

        System.out.println("storeSn : " + sn);
        Integer storeSn = Integer.parseInt(sn);
        session.setAttribute("storeSn", storeSn);

        Integer mbr_sn = (Integer) session.getAttribute("mbr_sn");
        model.addAttribute("mbr_sn",mbr_sn);

        userVO userVO = userService.getUserBySn(mbr_sn);
        model.addAttribute("userInfo",userVO);

        storeVO str = boardService.getStr(storeSn);
        session.setAttribute("storeVO", str);
        model.addAttribute("str", str);

        List<menuVO> menuVOList = menuService.getMenuByStrSn(storeSn);
        model.addAttribute("menuVOList", menuVOList);


        return "store";
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
        List<Integer> searchListBrdAuth = new ArrayList<>();

        for (int i=0;i<searchList.size();i++){

            // 해당 게시물의 배달비 엔빵에 참가한 리스트 개수 겟
            List<authVO> authVOList = authService.getAuthList(searchList.get(i).getBrd_sn());
            searchListBrdAuth.add(authVOList.size()+1);
        }


        if(searchList.size()!=0) {
            res.put("searchList", searchList);
            res.put("searchListStr", searchListStr);
            res.put("searchListBrdSt", searchListBrdSt);
            res.put("searchListBrdAuth", searchListBrdAuth);
            res.put("success", Boolean.TRUE);
            System.out.println("res:" + res);

        }

        System.out.println("res:" + res);
        return res;
    }
}
