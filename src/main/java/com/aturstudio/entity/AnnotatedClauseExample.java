package com.aturstudio.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AnnotatedClauseExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AnnotatedClauseExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andSentenceIdIsNull() {
            addCriterion("sentence_id is null");
            return (Criteria) this;
        }

        public Criteria andSentenceIdIsNotNull() {
            addCriterion("sentence_id is not null");
            return (Criteria) this;
        }

        public Criteria andSentenceIdEqualTo(Integer value) {
            addCriterion("sentence_id =", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdNotEqualTo(Integer value) {
            addCriterion("sentence_id <>", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdGreaterThan(Integer value) {
            addCriterion("sentence_id >", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("sentence_id >=", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdLessThan(Integer value) {
            addCriterion("sentence_id <", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdLessThanOrEqualTo(Integer value) {
            addCriterion("sentence_id <=", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdIn(List<Integer> values) {
            addCriterion("sentence_id in", values, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdNotIn(List<Integer> values) {
            addCriterion("sentence_id not in", values, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdBetween(Integer value1, Integer value2) {
            addCriterion("sentence_id between", value1, value2, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdNotBetween(Integer value1, Integer value2) {
            addCriterion("sentence_id not between", value1, value2, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andLevelIsNull() {
            addCriterion("level is null");
            return (Criteria) this;
        }

        public Criteria andLevelIsNotNull() {
            addCriterion("level is not null");
            return (Criteria) this;
        }

        public Criteria andLevelEqualTo(Integer value) {
            addCriterion("level =", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelNotEqualTo(Integer value) {
            addCriterion("level <>", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelGreaterThan(Integer value) {
            addCriterion("level >", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelGreaterThanOrEqualTo(Integer value) {
            addCriterion("level >=", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelLessThan(Integer value) {
            addCriterion("level <", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelLessThanOrEqualTo(Integer value) {
            addCriterion("level <=", value, "level");
            return (Criteria) this;
        }

        public Criteria andLevelIn(List<Integer> values) {
            addCriterion("level in", values, "level");
            return (Criteria) this;
        }

        public Criteria andLevelNotIn(List<Integer> values) {
            addCriterion("level not in", values, "level");
            return (Criteria) this;
        }

        public Criteria andLevelBetween(Integer value1, Integer value2) {
            addCriterion("level between", value1, value2, "level");
            return (Criteria) this;
        }

        public Criteria andLevelNotBetween(Integer value1, Integer value2) {
            addCriterion("level not between", value1, value2, "level");
            return (Criteria) this;
        }

        public Criteria andNodeIdIsNull() {
            addCriterion("node_id is null");
            return (Criteria) this;
        }

        public Criteria andNodeIdIsNotNull() {
            addCriterion("node_id is not null");
            return (Criteria) this;
        }

        public Criteria andNodeIdEqualTo(String value) {
            addCriterion("node_id =", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotEqualTo(String value) {
            addCriterion("node_id <>", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdGreaterThan(String value) {
            addCriterion("node_id >", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdGreaterThanOrEqualTo(String value) {
            addCriterion("node_id >=", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdLessThan(String value) {
            addCriterion("node_id <", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdLessThanOrEqualTo(String value) {
            addCriterion("node_id <=", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdLike(String value) {
            addCriterion("node_id like", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotLike(String value) {
            addCriterion("node_id not like", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdIn(List<String> values) {
            addCriterion("node_id in", values, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotIn(List<String> values) {
            addCriterion("node_id not in", values, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdBetween(String value1, String value2) {
            addCriterion("node_id between", value1, value2, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotBetween(String value1, String value2) {
            addCriterion("node_id not between", value1, value2, "nodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdIsNull() {
            addCriterion("parent_node_id is null");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdIsNotNull() {
            addCriterion("parent_node_id is not null");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdEqualTo(String value) {
            addCriterion("parent_node_id =", value, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdNotEqualTo(String value) {
            addCriterion("parent_node_id <>", value, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdGreaterThan(String value) {
            addCriterion("parent_node_id >", value, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdGreaterThanOrEqualTo(String value) {
            addCriterion("parent_node_id >=", value, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdLessThan(String value) {
            addCriterion("parent_node_id <", value, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdLessThanOrEqualTo(String value) {
            addCriterion("parent_node_id <=", value, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdLike(String value) {
            addCriterion("parent_node_id like", value, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdNotLike(String value) {
            addCriterion("parent_node_id not like", value, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdIn(List<String> values) {
            addCriterion("parent_node_id in", values, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdNotIn(List<String> values) {
            addCriterion("parent_node_id not in", values, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdBetween(String value1, String value2) {
            addCriterion("parent_node_id between", value1, value2, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andParentNodeIdNotBetween(String value1, String value2) {
            addCriterion("parent_node_id not between", value1, value2, "parentNodeId");
            return (Criteria) this;
        }

        public Criteria andClauseIsNull() {
            addCriterion("clause is null");
            return (Criteria) this;
        }

        public Criteria andClauseIsNotNull() {
            addCriterion("clause is not null");
            return (Criteria) this;
        }

        public Criteria andClauseEqualTo(String value) {
            addCriterion("clause =", value, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseNotEqualTo(String value) {
            addCriterion("clause <>", value, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseGreaterThan(String value) {
            addCriterion("clause >", value, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseGreaterThanOrEqualTo(String value) {
            addCriterion("clause >=", value, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseLessThan(String value) {
            addCriterion("clause <", value, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseLessThanOrEqualTo(String value) {
            addCriterion("clause <=", value, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseLike(String value) {
            addCriterion("clause like", value, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseNotLike(String value) {
            addCriterion("clause not like", value, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseIn(List<String> values) {
            addCriterion("clause in", values, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseNotIn(List<String> values) {
            addCriterion("clause not in", values, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseBetween(String value1, String value2) {
            addCriterion("clause between", value1, value2, "clause");
            return (Criteria) this;
        }

        public Criteria andClauseNotBetween(String value1, String value2) {
            addCriterion("clause not between", value1, value2, "clause");
            return (Criteria) this;
        }

        public Criteria andPosIsNull() {
            addCriterion("pos is null");
            return (Criteria) this;
        }

        public Criteria andPosIsNotNull() {
            addCriterion("pos is not null");
            return (Criteria) this;
        }

        public Criteria andPosEqualTo(String value) {
            addCriterion("pos =", value, "pos");
            return (Criteria) this;
        }

        public Criteria andPosNotEqualTo(String value) {
            addCriterion("pos <>", value, "pos");
            return (Criteria) this;
        }

        public Criteria andPosGreaterThan(String value) {
            addCriterion("pos >", value, "pos");
            return (Criteria) this;
        }

        public Criteria andPosGreaterThanOrEqualTo(String value) {
            addCriterion("pos >=", value, "pos");
            return (Criteria) this;
        }

        public Criteria andPosLessThan(String value) {
            addCriterion("pos <", value, "pos");
            return (Criteria) this;
        }

        public Criteria andPosLessThanOrEqualTo(String value) {
            addCriterion("pos <=", value, "pos");
            return (Criteria) this;
        }

        public Criteria andPosLike(String value) {
            addCriterion("pos like", value, "pos");
            return (Criteria) this;
        }

        public Criteria andPosNotLike(String value) {
            addCriterion("pos not like", value, "pos");
            return (Criteria) this;
        }

        public Criteria andPosIn(List<String> values) {
            addCriterion("pos in", values, "pos");
            return (Criteria) this;
        }

        public Criteria andPosNotIn(List<String> values) {
            addCriterion("pos not in", values, "pos");
            return (Criteria) this;
        }

        public Criteria andPosBetween(String value1, String value2) {
            addCriterion("pos between", value1, value2, "pos");
            return (Criteria) this;
        }

        public Criteria andPosNotBetween(String value1, String value2) {
            addCriterion("pos not between", value1, value2, "pos");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdIsNull() {
            addCriterion("annotator_id is null");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdIsNotNull() {
            addCriterion("annotator_id is not null");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdEqualTo(Integer value) {
            addCriterion("annotator_id =", value, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdNotEqualTo(Integer value) {
            addCriterion("annotator_id <>", value, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdGreaterThan(Integer value) {
            addCriterion("annotator_id >", value, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("annotator_id >=", value, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdLessThan(Integer value) {
            addCriterion("annotator_id <", value, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdLessThanOrEqualTo(Integer value) {
            addCriterion("annotator_id <=", value, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdIn(List<Integer> values) {
            addCriterion("annotator_id in", values, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdNotIn(List<Integer> values) {
            addCriterion("annotator_id not in", values, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdBetween(Integer value1, Integer value2) {
            addCriterion("annotator_id between", value1, value2, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotatorIdNotBetween(Integer value1, Integer value2) {
            addCriterion("annotator_id not between", value1, value2, "annotatorId");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeIsNull() {
            addCriterion("annotation_time is null");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeIsNotNull() {
            addCriterion("annotation_time is not null");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeEqualTo(Date value) {
            addCriterion("annotation_time =", value, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeNotEqualTo(Date value) {
            addCriterion("annotation_time <>", value, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeGreaterThan(Date value) {
            addCriterion("annotation_time >", value, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("annotation_time >=", value, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeLessThan(Date value) {
            addCriterion("annotation_time <", value, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeLessThanOrEqualTo(Date value) {
            addCriterion("annotation_time <=", value, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeIn(List<Date> values) {
            addCriterion("annotation_time in", values, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeNotIn(List<Date> values) {
            addCriterion("annotation_time not in", values, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeBetween(Date value1, Date value2) {
            addCriterion("annotation_time between", value1, value2, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andAnnotationTimeNotBetween(Date value1, Date value2) {
            addCriterion("annotation_time not between", value1, value2, "annotationTime");
            return (Criteria) this;
        }

        public Criteria andCoordinatorIsNull() {
            addCriterion("coordinator is null");
            return (Criteria) this;
        }

        public Criteria andCoordinatorIsNotNull() {
            addCriterion("coordinator is not null");
            return (Criteria) this;
        }

        public Criteria andCoordinatorEqualTo(String value) {
            addCriterion("coordinator =", value, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorNotEqualTo(String value) {
            addCriterion("coordinator <>", value, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorGreaterThan(String value) {
            addCriterion("coordinator >", value, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorGreaterThanOrEqualTo(String value) {
            addCriterion("coordinator >=", value, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorLessThan(String value) {
            addCriterion("coordinator <", value, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorLessThanOrEqualTo(String value) {
            addCriterion("coordinator <=", value, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorLike(String value) {
            addCriterion("coordinator like", value, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorNotLike(String value) {
            addCriterion("coordinator not like", value, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorIn(List<String> values) {
            addCriterion("coordinator in", values, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorNotIn(List<String> values) {
            addCriterion("coordinator not in", values, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorBetween(String value1, String value2) {
            addCriterion("coordinator between", value1, value2, "coordinator");
            return (Criteria) this;
        }

        public Criteria andCoordinatorNotBetween(String value1, String value2) {
            addCriterion("coordinator not between", value1, value2, "coordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorIsNull() {
            addCriterion("subordinator is null");
            return (Criteria) this;
        }

        public Criteria andSubordinatorIsNotNull() {
            addCriterion("subordinator is not null");
            return (Criteria) this;
        }

        public Criteria andSubordinatorEqualTo(String value) {
            addCriterion("subordinator =", value, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorNotEqualTo(String value) {
            addCriterion("subordinator <>", value, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorGreaterThan(String value) {
            addCriterion("subordinator >", value, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorGreaterThanOrEqualTo(String value) {
            addCriterion("subordinator >=", value, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorLessThan(String value) {
            addCriterion("subordinator <", value, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorLessThanOrEqualTo(String value) {
            addCriterion("subordinator <=", value, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorLike(String value) {
            addCriterion("subordinator like", value, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorNotLike(String value) {
            addCriterion("subordinator not like", value, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorIn(List<String> values) {
            addCriterion("subordinator in", values, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorNotIn(List<String> values) {
            addCriterion("subordinator not in", values, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorBetween(String value1, String value2) {
            addCriterion("subordinator between", value1, value2, "subordinator");
            return (Criteria) this;
        }

        public Criteria andSubordinatorNotBetween(String value1, String value2) {
            addCriterion("subordinator not between", value1, value2, "subordinator");
            return (Criteria) this;
        }

        public Criteria andAntecedentIsNull() {
            addCriterion("antecedent is null");
            return (Criteria) this;
        }

        public Criteria andAntecedentIsNotNull() {
            addCriterion("antecedent is not null");
            return (Criteria) this;
        }

        public Criteria andAntecedentEqualTo(String value) {
            addCriterion("antecedent =", value, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentNotEqualTo(String value) {
            addCriterion("antecedent <>", value, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentGreaterThan(String value) {
            addCriterion("antecedent >", value, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentGreaterThanOrEqualTo(String value) {
            addCriterion("antecedent >=", value, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentLessThan(String value) {
            addCriterion("antecedent <", value, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentLessThanOrEqualTo(String value) {
            addCriterion("antecedent <=", value, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentLike(String value) {
            addCriterion("antecedent like", value, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentNotLike(String value) {
            addCriterion("antecedent not like", value, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentIn(List<String> values) {
            addCriterion("antecedent in", values, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentNotIn(List<String> values) {
            addCriterion("antecedent not in", values, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentBetween(String value1, String value2) {
            addCriterion("antecedent between", value1, value2, "antecedent");
            return (Criteria) this;
        }

        public Criteria andAntecedentNotBetween(String value1, String value2) {
            addCriterion("antecedent not between", value1, value2, "antecedent");
            return (Criteria) this;
        }

        public Criteria andOffsetIsNull() {
            addCriterion("offset is null");
            return (Criteria) this;
        }

        public Criteria andOffsetIsNotNull() {
            addCriterion("offset is not null");
            return (Criteria) this;
        }

        public Criteria andOffsetEqualTo(Integer value) {
            addCriterion("offset =", value, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetNotEqualTo(Integer value) {
            addCriterion("offset <>", value, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetGreaterThan(Integer value) {
            addCriterion("offset >", value, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetGreaterThanOrEqualTo(Integer value) {
            addCriterion("offset >=", value, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetLessThan(Integer value) {
            addCriterion("offset <", value, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetLessThanOrEqualTo(Integer value) {
            addCriterion("offset <=", value, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetIn(List<Integer> values) {
            addCriterion("offset in", values, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetNotIn(List<Integer> values) {
            addCriterion("offset not in", values, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetBetween(Integer value1, Integer value2) {
            addCriterion("offset between", value1, value2, "offset");
            return (Criteria) this;
        }

        public Criteria andOffsetNotBetween(Integer value1, Integer value2) {
            addCriterion("offset not between", value1, value2, "offset");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeIsNull() {
            addCriterion("subordinate_type is null");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeIsNotNull() {
            addCriterion("subordinate_type is not null");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeEqualTo(String value) {
            addCriterion("subordinate_type =", value, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeNotEqualTo(String value) {
            addCriterion("subordinate_type <>", value, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeGreaterThan(String value) {
            addCriterion("subordinate_type >", value, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeGreaterThanOrEqualTo(String value) {
            addCriterion("subordinate_type >=", value, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeLessThan(String value) {
            addCriterion("subordinate_type <", value, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeLessThanOrEqualTo(String value) {
            addCriterion("subordinate_type <=", value, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeLike(String value) {
            addCriterion("subordinate_type like", value, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeNotLike(String value) {
            addCriterion("subordinate_type not like", value, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeIn(List<String> values) {
            addCriterion("subordinate_type in", values, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeNotIn(List<String> values) {
            addCriterion("subordinate_type not in", values, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeBetween(String value1, String value2) {
            addCriterion("subordinate_type between", value1, value2, "subordinateType");
            return (Criteria) this;
        }

        public Criteria andSubordinateTypeNotBetween(String value1, String value2) {
            addCriterion("subordinate_type not between", value1, value2, "subordinateType");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}