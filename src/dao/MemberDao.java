package dao;

import java.util.List;

import model.Member;

public interface MemberDao {
	public Member selectMemberByMID(String mID);
	
	public List<String> selectAuthoritiesByMNum(int mNum);
}
