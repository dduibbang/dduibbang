package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.selectVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface selectMapper {
    List<selectVO> getSelectList();
}
