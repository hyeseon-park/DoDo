package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;
import model.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;

	public Member getMemberByMNum(int mNum) {
		return memberDao.selectMemberByMNum(mNum);
	}

	public Member getMemberByMId(String mId) {
		return memberDao.selectMemberByMId(mId);
	}

	public List<String> getAuthoritiesByMNum(int mNum) {
		return memberDao.selectAuthoritiesByMNum(mNum);
	}

	public boolean joinMember(Member member) {
		if (memberDao.insertMember(member) > 0) {
			if (memberDao.insertAuthority(member.getmNum()) > 0) {
				return true;
			}
			return true;
		}
		return false;
	}

	public List<Member> searchMemberList(String keyword, int pNum) {
		return memberDao.selectMemberByKeyword(keyword, pNum);
	}

	public List<Member> getProjectMemberListExceptMe(int pNum, int mNum){
		return memberDao.selectMemberListExceptMeByPNum(pNum, mNum);
	}
}
