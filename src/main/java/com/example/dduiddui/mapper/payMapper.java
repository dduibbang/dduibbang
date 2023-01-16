package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.addressVO;
import com.example.dduiddui.vo.payVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface payMapper {

    void insertPay(payVO payVO); // 즐찾 추가
}
