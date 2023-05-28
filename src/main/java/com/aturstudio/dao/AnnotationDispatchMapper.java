package com.aturstudio.dao;

import com.aturstudio.entity.AnnotationDispatch;
import com.aturstudio.entity.AnnotationDispatchExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AnnotationDispatchMapper {
    long countByExample(AnnotationDispatchExample example);

    int deleteByExample(AnnotationDispatchExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AnnotationDispatch record);

    int insertSelective(AnnotationDispatch record);

    List<AnnotationDispatch> selectByExample(AnnotationDispatchExample example);

    AnnotationDispatch selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AnnotationDispatch record, @Param("example") AnnotationDispatchExample example);

    int updateByExample(@Param("record") AnnotationDispatch record, @Param("example") AnnotationDispatchExample example);

    int updateByPrimaryKeySelective(AnnotationDispatch record);

    int updateByPrimaryKey(AnnotationDispatch record);
}