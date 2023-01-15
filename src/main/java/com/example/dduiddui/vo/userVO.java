package com.example.dduiddui.vo;

import lombok.Data;
@Data
public class userVO {


    private int mbr_sn; //자동으로 맴버 번호 매길 vo
    private String mbr_id;
    private String mbr_pwd;
    private String mbr_nm;
    private String mbr_tel;
    private String mbr_email;
    private String mbr_pt;
    private String mbr_se;
    private String mbr_gd;
    //private 사진 넣을 vo

    private int select_money;
    private int money;





}
