package com.aturstudio.dto;

import com.aturstudio.entity.Sentence;

public class SentenceDTO extends Sentence {
    private Integer annotated;

    public Integer getAnnotated() {
        return annotated;
    }

    public void setAnnotated(Integer annotated) {
        this.annotated = annotated;
    }
}
