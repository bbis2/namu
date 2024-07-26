package com.forest.namu.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Singo;

@Mapper
public interface SingoMapper {
	public void insertReport(Singo dto)throws Exception;
}
