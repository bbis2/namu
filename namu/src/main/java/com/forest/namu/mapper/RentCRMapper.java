package com.forest.namu.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.RentCR;

@Mapper
public interface RentCRMapper {

	public long rentConfirmSeq();
	public void insertRentConfirm(RentCR rentCR) throws SQLException; // 신청 등록


}
