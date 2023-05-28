package com.aturstudio.entity;

import java.util.ArrayList;
import java.util.List;

public class AnnotationDispatchExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AnnotationDispatchExample() {
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

        public Criteria andAnnotatedIsNull() {
            addCriterion("annotated is null");
            return (Criteria) this;
        }

        public Criteria andAnnotatedIsNotNull() {
            addCriterion("annotated is not null");
            return (Criteria) this;
        }

        public Criteria andAnnotatedEqualTo(Integer value) {
            addCriterion("annotated =", value, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedNotEqualTo(Integer value) {
            addCriterion("annotated <>", value, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedGreaterThan(Integer value) {
            addCriterion("annotated >", value, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedGreaterThanOrEqualTo(Integer value) {
            addCriterion("annotated >=", value, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedLessThan(Integer value) {
            addCriterion("annotated <", value, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedLessThanOrEqualTo(Integer value) {
            addCriterion("annotated <=", value, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedIn(List<Integer> values) {
            addCriterion("annotated in", values, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedNotIn(List<Integer> values) {
            addCriterion("annotated not in", values, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedBetween(Integer value1, Integer value2) {
            addCriterion("annotated between", value1, value2, "annotated");
            return (Criteria) this;
        }

        public Criteria andAnnotatedNotBetween(Integer value1, Integer value2) {
            addCriterion("annotated not between", value1, value2, "annotated");
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