package com.aturstudio.dao;

import com.aturstudio.entity.AnnotatedClause;
import com.aturstudio.entity.AnnotatedClauseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AnnotatedClauseMapper {
    long countByExample(AnnotatedClauseExample example);

    int deleteByExample(AnnotatedClauseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AnnotatedClause record);

    int insertSelective(AnnotatedClause record);

    List<AnnotatedClause> selectByExample(AnnotatedClauseExample example);

    AnnotatedClause selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AnnotatedClause record, @Param("example") AnnotatedClauseExample example);

    int updateByExample(@Param("record") AnnotatedClause record, @Param("example") AnnotatedClauseExample example);

    int updateByPrimaryKeySelective(AnnotatedClause record);

    int updateByPrimaryKey(AnnotatedClause record);
}