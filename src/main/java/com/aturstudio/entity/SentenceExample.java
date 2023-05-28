package com.aturstudio.entity;

import java.util.ArrayList;
import java.util.List;

public class SentenceExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SentenceExample() {
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

        public Criteria andSentenceIdEqualTo(String value) {
            addCriterion("sentence_id =", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdNotEqualTo(String value) {
            addCriterion("sentence_id <>", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdGreaterThan(String value) {
            addCriterion("sentence_id >", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdGreaterThanOrEqualTo(String value) {
            addCriterion("sentence_id >=", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdLessThan(String value) {
            addCriterion("sentence_id <", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdLessThanOrEqualTo(String value) {
            addCriterion("sentence_id <=", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdLike(String value) {
            addCriterion("sentence_id like", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdNotLike(String value) {
            addCriterion("sentence_id not like", value, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdIn(List<String> values) {
            addCriterion("sentence_id in", values, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdNotIn(List<String> values) {
            addCriterion("sentence_id not in", values, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdBetween(String value1, String value2) {
            addCriterion("sentence_id between", value1, value2, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andSentenceIdNotBetween(String value1, String value2) {
            addCriterion("sentence_id not between", value1, value2, "sentenceId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdIsNull() {
            addCriterion("document_id is null");
            return (Criteria) this;
        }

        public Criteria andDocumentIdIsNotNull() {
            addCriterion("document_id is not null");
            return (Criteria) this;
        }

        public Criteria andDocumentIdEqualTo(String value) {
            addCriterion("document_id =", value, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdNotEqualTo(String value) {
            addCriterion("document_id <>", value, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdGreaterThan(String value) {
            addCriterion("document_id >", value, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdGreaterThanOrEqualTo(String value) {
            addCriterion("document_id >=", value, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdLessThan(String value) {
            addCriterion("document_id <", value, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdLessThanOrEqualTo(String value) {
            addCriterion("document_id <=", value, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdLike(String value) {
            addCriterion("document_id like", value, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdNotLike(String value) {
            addCriterion("document_id not like", value, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdIn(List<String> values) {
            addCriterion("document_id in", values, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdNotIn(List<String> values) {
            addCriterion("document_id not in", values, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdBetween(String value1, String value2) {
            addCriterion("document_id between", value1, value2, "documentId");
            return (Criteria) this;
        }

        public Criteria andDocumentIdNotBetween(String value1, String value2) {
            addCriterion("document_id not between", value1, value2, "documentId");
            return (Criteria) this;
        }

        public Criteria andDatasetIsNull() {
            addCriterion("dataset is null");
            return (Criteria) this;
        }

        public Criteria andDatasetIsNotNull() {
            addCriterion("dataset is not null");
            return (Criteria) this;
        }

        public Criteria andDatasetEqualTo(String value) {
            addCriterion("dataset =", value, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetNotEqualTo(String value) {
            addCriterion("dataset <>", value, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetGreaterThan(String value) {
            addCriterion("dataset >", value, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetGreaterThanOrEqualTo(String value) {
            addCriterion("dataset >=", value, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetLessThan(String value) {
            addCriterion("dataset <", value, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetLessThanOrEqualTo(String value) {
            addCriterion("dataset <=", value, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetLike(String value) {
            addCriterion("dataset like", value, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetNotLike(String value) {
            addCriterion("dataset not like", value, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetIn(List<String> values) {
            addCriterion("dataset in", values, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetNotIn(List<String> values) {
            addCriterion("dataset not in", values, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetBetween(String value1, String value2) {
            addCriterion("dataset between", value1, value2, "dataset");
            return (Criteria) this;
        }

        public Criteria andDatasetNotBetween(String value1, String value2) {
            addCriterion("dataset not between", value1, value2, "dataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetIsNull() {
            addCriterion("sub_dataset is null");
            return (Criteria) this;
        }

        public Criteria andSubDatasetIsNotNull() {
            addCriterion("sub_dataset is not null");
            return (Criteria) this;
        }

        public Criteria andSubDatasetEqualTo(String value) {
            addCriterion("sub_dataset =", value, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetNotEqualTo(String value) {
            addCriterion("sub_dataset <>", value, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetGreaterThan(String value) {
            addCriterion("sub_dataset >", value, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetGreaterThanOrEqualTo(String value) {
            addCriterion("sub_dataset >=", value, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetLessThan(String value) {
            addCriterion("sub_dataset <", value, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetLessThanOrEqualTo(String value) {
            addCriterion("sub_dataset <=", value, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetLike(String value) {
            addCriterion("sub_dataset like", value, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetNotLike(String value) {
            addCriterion("sub_dataset not like", value, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetIn(List<String> values) {
            addCriterion("sub_dataset in", values, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetNotIn(List<String> values) {
            addCriterion("sub_dataset not in", values, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetBetween(String value1, String value2) {
            addCriterion("sub_dataset between", value1, value2, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSubDatasetNotBetween(String value1, String value2) {
            addCriterion("sub_dataset not between", value1, value2, "subDataset");
            return (Criteria) this;
        }

        public Criteria andSentenceIsNull() {
            addCriterion("sentence is null");
            return (Criteria) this;
        }

        public Criteria andSentenceIsNotNull() {
            addCriterion("sentence is not null");
            return (Criteria) this;
        }

        public Criteria andSentenceEqualTo(String value) {
            addCriterion("sentence =", value, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceNotEqualTo(String value) {
            addCriterion("sentence <>", value, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceGreaterThan(String value) {
            addCriterion("sentence >", value, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceGreaterThanOrEqualTo(String value) {
            addCriterion("sentence >=", value, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceLessThan(String value) {
            addCriterion("sentence <", value, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceLessThanOrEqualTo(String value) {
            addCriterion("sentence <=", value, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceLike(String value) {
            addCriterion("sentence like", value, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceNotLike(String value) {
            addCriterion("sentence not like", value, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceIn(List<String> values) {
            addCriterion("sentence in", values, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceNotIn(List<String> values) {
            addCriterion("sentence not in", values, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceBetween(String value1, String value2) {
            addCriterion("sentence between", value1, value2, "sentence");
            return (Criteria) this;
        }

        public Criteria andSentenceNotBetween(String value1, String value2) {
            addCriterion("sentence not between", value1, value2, "sentence");
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

        public Criteria andSimpleIsNull() {
            addCriterion("simple is null");
            return (Criteria) this;
        }

        public Criteria andSimpleIsNotNull() {
            addCriterion("simple is not null");
            return (Criteria) this;
        }

        public Criteria andSimpleEqualTo(Integer value) {
            addCriterion("simple =", value, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleNotEqualTo(Integer value) {
            addCriterion("simple <>", value, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleGreaterThan(Integer value) {
            addCriterion("simple >", value, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleGreaterThanOrEqualTo(Integer value) {
            addCriterion("simple >=", value, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleLessThan(Integer value) {
            addCriterion("simple <", value, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleLessThanOrEqualTo(Integer value) {
            addCriterion("simple <=", value, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleIn(List<Integer> values) {
            addCriterion("simple in", values, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleNotIn(List<Integer> values) {
            addCriterion("simple not in", values, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleBetween(Integer value1, Integer value2) {
            addCriterion("simple between", value1, value2, "simple");
            return (Criteria) this;
        }

        public Criteria andSimpleNotBetween(Integer value1, Integer value2) {
            addCriterion("simple not between", value1, value2, "simple");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqIsNull() {
            addCriterion("annotation_seq is null");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqIsNotNull() {
            addCriterion("annotation_seq is not null");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqEqualTo(Integer value) {
            addCriterion("annotation_seq =", value, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqNotEqualTo(Integer value) {
            addCriterion("annotation_seq <>", value, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqGreaterThan(Integer value) {
            addCriterion("annotation_seq >", value, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqGreaterThanOrEqualTo(Integer value) {
            addCriterion("annotation_seq >=", value, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqLessThan(Integer value) {
            addCriterion("annotation_seq <", value, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqLessThanOrEqualTo(Integer value) {
            addCriterion("annotation_seq <=", value, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqIn(List<Integer> values) {
            addCriterion("annotation_seq in", values, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqNotIn(List<Integer> values) {
            addCriterion("annotation_seq not in", values, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqBetween(Integer value1, Integer value2) {
            addCriterion("annotation_seq between", value1, value2, "annotationSeq");
            return (Criteria) this;
        }

        public Criteria andAnnotationSeqNotBetween(Integer value1, Integer value2) {
            addCriterion("annotation_seq not between", value1, value2, "annotationSeq");
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