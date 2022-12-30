package com.example.dduiddui.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
@Getter
@Setter
public class addressVO {

    private int adr_sn;
    private int mbr_sn;
    private String adr_ttl; // 주소명(집,회사)
    private String adr_cn; // 주소
    private String adr_st; // 상세주소
    private String dft_yn; // 기본주소 설정여부
    private String like_yn; // 즐겨찾기 설정여부
    private String rgtr_id; // 등록자(sn을 파라미터로 받기위해 int)
    private LocalDateTime rgtr_dt; // 등록일시
    private LocalDateTime mdfr_dt; // 등록일시
}
