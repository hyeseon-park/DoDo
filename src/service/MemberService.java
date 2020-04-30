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

	public Member getMemberByMId(String mId) {
		return memberDao.selectMemberByMId(mId);
	}

	public List<String> getAuthoritiesByMNum(int mNum) {
		return memberDao.selectAuthoritiesByMNum(mNum);
	}
}

