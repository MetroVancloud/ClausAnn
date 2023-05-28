package com.aturstudio.dao;

import com.aturstudio.entity.AnnUser;
import com.aturstudio.entity.AnnUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AnnUserMapper {
    long countByExample(AnnUserExample example);

    int deleteByExample(AnnUserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(AnnUser record);

    int insertSelective(AnnUser record);

    List<AnnUser> selectByExample(AnnUserExample example);

    AnnUser selectByPrimaryKey(Integer userId);

    int updateByExampleSelective(@Param("record") AnnUser record, @Param("example") AnnUserExample example);

    int updateByExample(@Param("record") AnnUser record, @Param("example") AnnUserExample example);

    int updateByPrimaryKeySelective(AnnUser record);

    int updateByPrimaryKey(AnnUser record);
}