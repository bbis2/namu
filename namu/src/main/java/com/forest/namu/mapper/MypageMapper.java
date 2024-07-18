package com.forest.namu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Profile;

@Mapper
public interface MypageMapper {
	public Profile selectProfile(String userId)throws Exception;
	public void insertPhoto(Profile dto);
	public Profile selectPhoto(String userId)throws Exception;
}
