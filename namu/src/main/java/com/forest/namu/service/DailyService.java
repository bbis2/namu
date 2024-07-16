package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Daily;

public interface DailyService {
    
    public void insertDaily(Daily dto) throws Exception;
    public List<Daily> listDaily(Map<String, Object> map);
    public int dataCount(Map<String, Object> map);
    public Daily findById(long num);
    public void updateHitCount(long num) throws Exception;
    public Daily findByPrev(Map<String, Object> map);
    public Daily findByNext(Map<String, Object> map);
    public void updateDaily(Daily dto) throws Exception;
    public void deleteDaily(Map<String, Object> map) throws Exception;
    
    public void insertDailyLike(Map<String, Object>map) throws Exception;
    public void deleteDailyLike(Map<String, Object>map) throws Exception;
    public int DailyLikeCount(long num);
    public boolean userDailyLiked(Map<String, Object> map);
    
    
    public void insertCategory(Daily dto) throws Exception;
    public List<Daily> listDailyCategory ();
    
}