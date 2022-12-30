package com.example.dduiddui.vo;

import com.sun.imageio.plugins.common.SingleTileRenderedImage;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data

public class boardWriteVO {
    private int brdSn;
    private int strSn;
    private String brdCtgr;
    private String safeYn;
    private String brdTtl;
    private String brdCn;
    private String brdSt;
    private int brdNn;
    private int brdPri;
    private String brdAdr;
    private String brdEndDt;
    private String rgtrId;
    private LocalDateTime rgtrDt;
    private LocalDateTime mdfrDt;
}
