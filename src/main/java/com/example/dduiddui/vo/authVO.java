package com.example.dduiddui.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Data
@Getter
@Setter
public class authVO {

    private Integer auth_sn;
    private Integer mbr_sn;

    private Integer brd_sn;

    private Character auth_yn;
}
