package com.aturstudio.entity;

import java.io.Serializable;

public class AnnotationDispatch implements Serializable {
    private Integer id;

    private Integer sentenceId;

    private Integer annotatorId;

    private Integer annotated;

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

    public Integer getAnnotatorId() {
        return annotatorId;
    }

    public void setAnnotatorId(Integer annotatorId) {
        this.annotatorId = annotatorId;
    }

    public Integer getAnnotated() {
        return annotated;
    }

    public void setAnnotated(Integer annotated) {
        this.annotated = annotated;
    }
}