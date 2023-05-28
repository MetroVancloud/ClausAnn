package com.aturstudio.dao;

import com.aturstudio.dto.SentenceDTO;

import java.util.List;

public interface SentenceMapperExt {
    List<SentenceDTO> selectDispatchedSentenceList(String sql);
}