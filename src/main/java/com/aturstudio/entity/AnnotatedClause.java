package com.aturstudio.entity;

import java.io.Serializable;
import java.util.Date;

public class AnnotatedClause implements Serializable {
    private Integer id;

    private Integer sentenceId;

    private Integer level;

    private String nodeId;

    private String parentNodeId;

    private String clause;

    private String pos;

    private Integer annotatorId;

    private Date annotationTime;

    private String coordinator;

    private String subordinator;

    private String antecedent;

    private Integer offset;

    private String subordinateType;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSentenceId() {
        return sentenceId;
    }

    public void setSentenceId(Integer sentenceId) {
        this.sentenceId = sentenceId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId == null ? null : nodeId.trim();
    }

    public String getParentNodeId() {
        return parentNodeId;
    }

    public void setParentNodeId(String parentNodeId) {
        this.parentNodeId = parentNodeId == null ? null : parentNodeId.trim();
    }

    public String getClause() {
        return clause;
    }

    public void setClause(String clause) {
        this.clause = clause == null ? null : clause.trim();
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos == null ? null : pos.trim();
    }

    public Integer getAnnotatorId() {
        return annotatorId;
    }

    public void setAnnotatorId(Integer annotatorId) {
        this.annotatorId = annotatorId;
    }

    public Date getAnnotationTime() {
        return annotationTime;
    }

    public void setAnnotationTime(Date annotationTime) {
        this.annotationTime = annotationTime;
    }

    public String getCoordinator() {
        return coordinator;
    }

    public void setCoordinator(String coordinator) {
        this.coordinator = coordinator == null ? null : coordinator.trim();
    }

    public String getSubordinator() {
        return subordinator;
    }

    public void setSubordinator(String subordinator) {
        this.subordinator = subordinator == null ? null : subordinator.trim();
    }

    public String getAntecedent() {
        return antecedent;
    }

    public void setAntecedent(String antecedent) {
        this.antecedent = antecedent == null ? null : antecedent.trim();
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public String getSubordinateType() {
        return subordinateType;
    }

    public void setSubordinateType(String subordinateType) {
        this.subordinateType = subordinateType == null ? null : subordinateType.trim();
    }
}