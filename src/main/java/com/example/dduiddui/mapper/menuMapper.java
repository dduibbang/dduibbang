package com.example.dduiddui.mapper;

import com.example.dduiddui.vo.selectVO;
import org.apache.ibatis.annotations.Mapper;
import com.example.dduiddui.vo.menuVO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Mapper
public interface menuMapper {

    List<menuVO> getMenuByStrSn(Integer str_sn);

}
