package com.aturstudio.service;

import com.aturstudio.dao.AnnotationDispatchMapper;
import com.aturstudio.dao.SentenceMapperExt;
import com.aturstudio.dto.SentenceDTO;
import com.aturstudio.entity.AnnUser;
import com.aturstudio.entity.Sentence;
import com.aturstudio.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class AnnotationDispatchService {

    private Logger logger = Logger.getLogger(AnnotationDispatchService.class);

    @Autowired
    private SentenceMapperExt sentenceMapperExt;

    public List<SentenceDTO> getDispatchedSentenceList(AnnUser user, SentenceDTO condition) {
        String sql = setSQL4DispatchedSentenceList(user, condition);
        try {
            return sentenceMapperExt.selectDispatchedSentenceList(sql);
        } catch (Exception e) {
            logger.warn(this, e);
            return null;
        }
    }

    public String setSQL4DispatchedSentenceList(AnnUser user, SentenceDTO condition) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT b.* FROM annotation_dispatch a LEFT JOIN sentence b ON a.sentence_id = b.id WHERE a.annotator_id = " + user.getUserId());

        if (StringUtil.notEmpty(condition.getDataset())) {
            sb.append("and b.dataset = '"+ condition.getDataset() +"'");
        }

        if (StringUtil.notEmpty(condition.getSubDataset())) {
            sb.append("and b.sub_dataset = '"+ condition.getSubDataset() +"'");
        }

        if (null != (condition.getAnnotated())) {
            sb.append("and a.annotated = " + condition.getAnnotated());
        }

        return sb.toString();
    }
}
