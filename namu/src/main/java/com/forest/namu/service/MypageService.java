package com.forest.namu.service;

import java.util.List;

import com.forest.namu.domain.Profile;

public interface MypageService {
	public Profile selectProfile(String userId)throws Exception;
	public void insertPhoto(Profile dto, String pathname) throws Exception;
	public Profile selectPhoto(String userId)throws Exception;
}
