package com.aturstudio.dao;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Method;
import java.util.List;

@Repository
public class CommonDAO {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    private Logger logger = Logger.getLogger(this.getClass());


    public int batchInsert(List list, Class mapperClass) throws Exception {

        int insertRows = 0;
        if (list == null || list.isEmpty()) {
            return insertRows;
        }
        int totalRows = list.size();
        SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH);
        try {
            Object mapper = sqlSession.getMapper(mapperClass);
            Method[] methods = mapperClass.getDeclaredMethods();
            Method insertMethod = null;
            for (Method method : methods) {
                if (method.getName().equals("insert")) {
                    insertMethod = method;
                    break;
                }
            }

            for (int i = 0; i < list.size(); i++) {
                Object object = list.get(i);
                insertMethod.invoke(mapper, object);
                insertRows++;
                if (i > 0 && i % 10000 == 0) {
                    //手动每1000个一提交，提交后无法回滚
                    sqlSession.commit();
                    //清理缓存，防止溢出
                    sqlSession.clearCache();
                    logger.info("已写入 " + insertRows + "/" + totalRows + "条");
                }
            }
            sqlSession.commit();
            //清理缓存，防止溢出
            sqlSession.clearCache();
            logger.info("已写入 " + insertRows + "/" + totalRows + "条");
        } catch (Exception e) {
            logger.error(this, e);
            //没有提交的数据可以回滚
            sqlSession.rollback();
            throw e;
        } finally {
            sqlSession.close();
        }
        return insertRows;
    }


}
