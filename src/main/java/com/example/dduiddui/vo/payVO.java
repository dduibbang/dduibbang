package com.example.dduiddui.vo;

import lombok.Data;

@Data
public class payVO {

    private Integer pay_sn;

    private Integer brd_sn;

    private Integer mbr_sn;
    private String menu_nm;

    private String menu_pr;

    private Character pay_yn;

    private Character odr_yn;

    private Character div_yn;
}
