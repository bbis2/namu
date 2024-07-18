package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Member;

@Mapper
public interface MemberMapper {
	public Member loginMember(String userId);
	public void updateLastLogin(String userId) throws SQLException;
	
	public long memberSeq();
	public void insertMember(Member dto) throws SQLException;
	public void insertMemberDetail(Member dto) throws SQLException;
	public void insertMember12(Member dto) throws SQLException;
	
	public void updateMembership(Map<String, Object> map) throws SQLException;
	public void updateMemberEnabled(Map<String, Object> map) throws SQLException;
	public void updateMember(Member dto) throws SQLException;
	public void updateMemberDetail(Member dto) throws SQLException;
	
	public Member findById(String userId);
	public Member findByNickName(String nickName);
	public Member findByMemberIdx(long memberIdx);
	
	public void deleteMember(Map<String, Object> map) throws SQLException;
	public void deleteMemberDetail(Map<String, Object> map) throws SQLException;
	
	// 패스워드 실패 횟수 / 멤버 상태
	public int checkFailureCount(String userId);
	public void updateFailureCountReset(String userId) throws SQLException;
	public void updateFailureCount(String userId) throws SQLException;
	public void insertMemberState(Member dto) throws SQLException;
	
	public void insertAuthority(Member dto) throws SQLException;
	public void updateAuthority(Member dto) throws SQLException;
	
	//update 닉네임
	public void changeNickname(Member dto)throws Exception;
	//update ment
	public void changeMent(Member dto)throws Exception;

}
