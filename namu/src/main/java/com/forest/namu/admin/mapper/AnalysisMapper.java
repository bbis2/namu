package com.forest.namu.admin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.admin.domain.Analysis;

@Mapper
public interface AnalysisMapper {
	public Analysis selectPageCount()throws Exception;
}
