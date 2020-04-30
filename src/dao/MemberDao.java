package dao;

import java.util.List;

import model.Member;

public interface MemberDao {
	public Member selectMemberByMId(String mId);
	
	public List<String> selectAuthoritiesByMNum(int mNum);
}
