package com.aturstudio.controller.clause_segmentation;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.aturstudio.dao.AnnUserMapper;
import com.aturstudio.dao.AnnotatedClauseMapper;
import com.aturstudio.dao.SentenceMapper;
import com.aturstudio.dto.common.BLMessage;
import com.aturstudio.dto.util.AnnotatedClauseUtil;
import com.aturstudio.entity.*;
import com.aturstudio.util.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author Fan Yunlong
 * @create 2022/4/7 下午 16:08
 * @update 2022/4/7 下午 16:08
 */
@RestController
@RequestMapping("/clause_segmentation")
public class ClauseSegmentationController {

    private Logger logger = Logger.getLogger(ClauseSegmentationController.class);

    @Autowired
    SentenceMapper sentenceMapper;
    @Autowired
    AnnotatedClauseMapper annotatedClauseMapper;
    @Autowired
    AnnUserMapper annUserMapper;

    @RequestMapping("/to_segmentation_page")
    public ModelAndView toSegmentationPage(
            @RequestParam(value="annotationSeq", required = false) Integer annotationSeq,
            HttpSession session
            ) {
        ModelAndView modelAndView = new ModelAndView();
        AnnUser user = (AnnUser) session.getAttribute("user");

        //  1. 查询原句
        Sentence sentenceEntity;
        Integer previous, next;

        if (annotationSeq == null || annotationSeq <= 0) {
            annotationSeq = 1;
        } else if (annotationSeq > 24819) {
            annotationSeq = 24819;
        }
        next = (annotationSeq >= 24819) ? 0 : annotationSeq+1;
        previous = (annotationSeq <= 1) ? 0 : annotationSeq - 1;

        SentenceExample sentenceExample = new SentenceExample();
        SentenceExample.Criteria sentenceCriteria = sentenceExample.createCriteria();
        sentenceCriteria.andAnnotationSeqEqualTo(annotationSeq);
        sentenceEntity = sentenceMapper.selectByExampleWithBLOBs(sentenceExample).get(0);

        // 2. 查询标注的子句列表
        AnnotatedClauseExample annotatedClauseExample = new AnnotatedClauseExample();
        AnnotatedClauseExample.Criteria annotatedClauseCriteria = annotatedClauseExample.createCriteria();
        annotatedClauseCriteria.andSentenceIdEqualTo(sentenceEntity.getId());
        annotatedClauseExample.setOrderByClause("node_id");
        List<AnnotatedClause> clauseList = annotatedClauseMapper.selectByExample(annotatedClauseExample);

        // 先将所有标注结果都查询出来
        Map<Integer, List<AnnotatedClause>> annotationMap = new HashMap<>();
        for (AnnotatedClause annotatedClause : clauseList) {
            Integer annotatorId = annotatedClause.getAnnotatorId();
            List<AnnotatedClause> list = new ArrayList<>();
            if (annotationMap.containsKey(annotatorId))
                list = annotationMap.get(annotatorId);
            list.add(annotatedClause);
            annotationMap.put(annotatorId, list);
        }

        List<AnnotatedClause> selectedAnnotationClauseList = new ArrayList<>();
        List<String> selectedSubordinateTypeCNList = new ArrayList<>();
        Map<String, Integer> selectedTreeDict = new HashMap<>();
        List<AnnUser> annotatorList = new ArrayList<>();

        AnnotatedClause clause = new AnnotatedClause();
        clause.setClause(sentenceEntity.getSentence());
        clause.setNodeId("1");
        clause.setLevel(1);
        clause.setOffset(-1);
        clause.setSubordinateType("main");
        clause.setAntecedent("");
        clause.setCoordinator("");
        clause.setSubordinator("");
        selectedAnnotationClauseList.add(clause);
        selectedSubordinateTypeCNList.add("主句");
        selectedTreeDict.put("1", 1);
        AnnUser nonAnnUser = new AnnUser();
        nonAnnUser.setUserId(-1);
        nonAnnUser.setUserName("从零标注");
        annotatorList.add(nonAnnUser);
        Integer selectedAnnotatorId = -1;

        for (Integer annotatorId : annotationMap.keySet()) {
            AnnUser annUser = new AnnUser();
            annUser.setUserId(annotatorId);
            if (annotatorId == 0) {
                annUser.setUserName("自动标注");
            } else {
                AnnUser au = annUserMapper.selectByPrimaryKey(annotatorId);
                annUser.setUserName(au.getUserName());
            }
            annotatorList.add(annUser);
            if (annotatorId >= selectedAnnotatorId) {
                selectedAnnotatorId = annotatorId;
            }
        }

        if (annotationMap.containsKey(user.getUserId())) {
            selectedAnnotatorId = user.getUserId();
        }

        Collections.sort(annotatorList, new Comparator<AnnUser>() {
            @Override
            public int compare(AnnUser o1, AnnUser o2) {
                return o1.getUserId() - o2.getUserId();
            }
        });

        if (selectedAnnotatorId != -1) {
            selectedAnnotationClauseList = annotationMap.get(selectedAnnotatorId);
            Map<String, Object> resultMap = getSelectedAnnotationInfo(selectedAnnotationClauseList);
            selectedSubordinateTypeCNList = (List<String>) resultMap.get("selectedSubordinateTypeCNList");
            selectedTreeDict = (Map<String, Integer>) resultMap.get("selectedTreeDict");
        }

        modelAndView.setViewName("clause_segmentation");
        modelAndView.addObject("sentenceEntity", sentenceEntity);
        modelAndView.addObject("clauseList", selectedAnnotationClauseList);
        modelAndView.addObject("subordinateTypeCNList", selectedSubordinateTypeCNList);
        modelAndView.addObject("treeDictJSON", JSONObject.toJSONString(selectedTreeDict));
        modelAndView.addObject("annotatorList", annotatorList);
        modelAndView.addObject("selectedAnnotatorId", selectedAnnotatorId);
        modelAndView.addObject("user", user);
        modelAndView.addObject("previous", previous);
        modelAndView.addObject("next", next);
        return modelAndView;
    }

    @RequestMapping("/save_annotation")
    @ResponseBody
    public BLMessage saveAnnotation(
            @RequestBody JSONObject json,
            HttpSession session) {
        List<AnnotatedClause> clauseList = json.getObject("clauseList", new TypeReference<List<AnnotatedClause>>(){});
        Integer sentenceId = json.getObject("sentenceId", Integer.class);
        AnnUser user = (AnnUser) session.getAttribute("user");

        AnnotatedClauseExample example = new AnnotatedClauseExample();
        AnnotatedClauseExample.Criteria criteria = example.createCriteria();
        criteria.andSentenceIdEqualTo(sentenceId);
        criteria.andAnnotatorIdEqualTo(user.getUserId());
        try {
            annotatedClauseMapper.deleteByExample(example);
        } catch (Exception e) {
            logger.warn(this, e);
            return new BLMessage(false, "保存失败，请重试！");
        }

        Date currentTime = new Date();
        for (int i = 0; i < clauseList.size(); i++) {
            clauseList.get(i).setAnnotationTime(currentTime);
            clauseList.get(i).setAnnotatorId(user.getUserId());
            try {
                annotatedClauseMapper.insert(clauseList.get(i));
            } catch (Exception e) {
                logger.warn(this, e);
                return new BLMessage(false, "保存失败，请重试！");
            }
        }
        return new BLMessage(true, String.valueOf(clauseList.size()));
    }

    /**
     * 切换一个句子的不同人的标注结果
     * @param json
     * @return
     */
    @RequestMapping("/switch_annotation")
    @ResponseBody
    public BLMessage switchAnnotation(
            @RequestBody JSONObject json) {

        Integer annotatorId = json.getObject("annotationId", Integer.class);
        Integer sentenceId = json.getObject("sentenceId", Integer.class);
        Map<String, Object> resultMap = new HashMap<>();
        List<AnnotatedClause> clauseList = new ArrayList<>();
        List<String> selectedSubordinateTypeCNList = new ArrayList<>();
        Map<String, Integer> selectedTreeDict = new HashMap<>();

        if (annotatorId == -1) {
            Sentence sentence = new Sentence();
            try {
                sentence = sentenceMapper.selectByPrimaryKey(sentenceId);
            } catch (Exception e) {
                logger.warn(this, e);
                return new BLMessage(false, "切换失败，请重试！");
            }
            AnnotatedClause clause = new AnnotatedClause();
            clause.setClause(sentence.getSentence());
            clause.setNodeId("1");
            clause.setLevel(1);
            clause.setOffset(-1);
            clause.setSubordinateType("main");
            clause.setAntecedent("");
            clause.setCoordinator("");
            clause.setSubordinator("");
            clauseList.add(clause);
            selectedSubordinateTypeCNList.add("主句");
            selectedTreeDict.put("1", 1);
            resultMap.put("clauseList", clauseList);
            resultMap.put("selectedSubordinateTypeCNList", selectedSubordinateTypeCNList);
            resultMap.put("selectedTreeDict", selectedTreeDict);
        } else {
            AnnotatedClauseExample example = new AnnotatedClauseExample();
            AnnotatedClauseExample.Criteria criteria = example.createCriteria();
            criteria.andSentenceIdEqualTo(sentenceId);
            criteria.andAnnotatorIdEqualTo(annotatorId);
            example.setOrderByClause("node_id");
            try {
                clauseList = annotatedClauseMapper.selectByExample(example);
            } catch (Exception e) {
                logger.warn(this, e);
                return new BLMessage(false, "切换失败，请重试！");
            }
            resultMap = getSelectedAnnotationInfo(clauseList);
            resultMap.put("clauseList", clauseList);
        }
        return new BLMessage(true, "", resultMap);
    }

    public Map<String, Object> getSelectedAnnotationInfo(List<AnnotatedClause> selectedAnnotationClauseList) {
        Map<String, Object> resultMap = new HashMap<>();
        Map<String, Integer> selectedTreeDict = new HashMap<>();
        List<String> selectedSubordinateTypeCNList = new ArrayList<>();

        for (AnnotatedClause annotatedClause : selectedAnnotationClauseList) {
            selectedSubordinateTypeCNList.add(AnnotatedClauseUtil.getSubordinateTypeCN(annotatedClause.getSubordinateType()));
            if (selectedTreeDict.containsKey(String.valueOf(annotatedClause.getLevel()))) {
                selectedTreeDict.put(String.valueOf(annotatedClause.getLevel()), selectedTreeDict.get(String.valueOf(annotatedClause.getLevel())) + 1);
            } else {
                selectedTreeDict.put(String.valueOf(annotatedClause.getLevel()), 1);
            }
            AnnotatedClauseUtil.rebuildClause(annotatedClause);
        }
        resultMap.put("selectedTreeDict", selectedTreeDict);
        resultMap.put("selectedSubordinateTypeCNList", selectedSubordinateTypeCNList);

        return resultMap;
    }

    @RequestMapping("/save_subordinator_of_single_clause")
    @ResponseBody
    public BLMessage saveSubordinatorOfSingleClause(
            @RequestBody JSONObject json) {
        String nodeId = json.getObject("nodeId", String.class);
        Integer sentenceId = json.getObject("sentenceId", Integer.class);
        String subordinator = json.getObject("subordinator", String.class);
        Integer annotatorId = json.getObject("annotatorId", Integer.class);

        AnnotatedClauseExample example = new AnnotatedClauseExample();
        AnnotatedClauseExample.Criteria criteria = example.createCriteria();
        criteria.andSentenceIdEqualTo(sentenceId);
        criteria.andNodeIdEqualTo(nodeId);
        criteria.andAnnotatorIdEqualTo(annotatorId);
        AnnotatedClause record = new AnnotatedClause();
        record.setSubordinator(subordinator);

        try {
            annotatedClauseMapper.updateByExampleSelective(record, example);
        } catch (Exception e) {
            logger.warn(this, e);
            return new BLMessage(false, "保存失败，请重试！");
        }

        return new BLMessage(true);
    }

}