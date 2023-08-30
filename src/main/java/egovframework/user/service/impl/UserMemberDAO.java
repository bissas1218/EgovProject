package egovframework.user.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.user.service.MemberVO;

@Repository("userMemberDAO")
public class UserMemberDAO extends EgovAbstractDAO{

	public int userIdDupChk(String userId) throws Exception {
		return (int) select("userMemberDAO.userIdDupChk", userId);
	}
	
	public int mobileNumDupChk(String mobileNum) throws Exception {
		return (int) select("userMemberDAO.mobileNumDupChk", mobileNum);
	}
	
	public void memberInsert(MemberVO vo) throws Exception{
		insert("userMemberDAO.memberInsert", vo);
	}
	
	public int userLogin(MemberVO vo) throws Exception{
		return (int) select("userMemberDAO.userLogin", vo);
	}
}
