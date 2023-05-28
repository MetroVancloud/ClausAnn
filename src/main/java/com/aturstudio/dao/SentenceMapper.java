package com.aturstudio.dao;

import com.aturstudio.entity.Sentence;
import com.aturstudio.entity.SentenceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SentenceMapper {
    long countByExample(SentenceExample example);

    int deleteByExample(SentenceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sentence record);

    int insertSelective(Sentence record);

    List<Sentence> selectByExampleWithBLOBs(SentenceExample example);

    List<Sentence> selectByExample(SentenceExample example);

    Sentence selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Sentence record, @Param("example") SentenceExample example);

    int updateByExampleWithBLOBs(@Param("record") Sentence record, @Param("example") SentenceExample example);

    int updateByExample(@Param("record") Sentence record, @Param("example") SentenceExample example);

    int updateByPrimaryKeySelective(Sentence record);

    int updateByPrimaryKeyWithBLOBs(Sentence record);

    int updateByPrimaryKey(Sentence record);
}