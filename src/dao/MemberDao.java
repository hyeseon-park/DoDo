package dao;

import java.util.List;

import model.Member;

public interface MemberDao {
	public Member selectMemberByMNum(int mNum);

	public Member selectMemberByMId(String mId);

	public List<String> selectAuthoritiesByMNum(int mNum);

	public int insertMember(Member member);

	public int insertAuthority(int mNum);

	public List<Member> selectMemberByPNum(int pNum);

	public List<Member> selectMemberByKeyword(String keyword);

}
