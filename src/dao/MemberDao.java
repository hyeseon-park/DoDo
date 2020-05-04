package dao;

import java.util.List;

import model.Member;

public interface MemberDao {
	public Member selectMemberByMId(String mId);
	
	public List<String> selectAuthoritiesByMNum(int mNum);
	
	public int insertMember(Member member);
	
	public int insertAuthority(int mNum);
	
}
