package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.addressVO;
import com.example.dduiddui.vo.payVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface payMapper {

    void insertPay(payVO payVO); // 즐찾 추가

    List<payVO> getPayListBybrdSn(Integer brd_sn);
}
