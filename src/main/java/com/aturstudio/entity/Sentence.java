package com.aturstudio.entity;

import java.io.Serializable;

public class Sentence implements Serializable {
    private Integer id;

    private String sentenceId;

    private String documentId;

    private String dataset;

    private String subDataset;

    private String sentence;

    private String pos;

    private Integer simple;

    private Integer annotationSeq;

    private String amr;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSentenceId() {
        return sentenceId;
    }

    public void setSentenceId(String sentenceId) {
        this.sentenceId = sentenceId == null ? null : sentenceId.trim();
    }

    public String getDocumentId() {
        return documentId;
    }

    public void setDocumentId(String documentId) {
        this.documentId = documentId == null ? null : documentId.trim();
    }

    public String getDataset() {
        return dataset;
    }

    public void setDataset(String dataset) {
        this.dataset = dataset == null ? null : dataset.trim();
    }

    public String getSubDataset() {
        return subDataset;
    }

    public void setSubDataset(String subDataset) {
        this.subDataset = subDataset == null ? null : subDataset.trim();
    }

    public String getSentence() {
        return sentence;
    }

    public void setSentence(String sentence) {
        this.sentence = sentence == null ? null : sentence.trim();
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos == null ? null : pos.trim();
    }

    public Integer getSimple() {
        return simple;
    }

    public void setSimple(Integer simple) {
        this.simple = simple;
    }

    public Integer getAnnotationSeq() {
        return annotationSeq;
    }

    public void setAnnotationSeq(Integer annotationSeq) {
        this.annotationSeq = annotationSeq;
    }

    public String getAmr() {
        return amr;
    }

    public void setAmr(String amr) {
        this.amr = amr == null ? null : amr.trim();
    }
}