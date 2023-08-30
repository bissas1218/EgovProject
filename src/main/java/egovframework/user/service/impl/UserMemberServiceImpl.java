package egovframework.user.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.user.service.MemberVO;
import egovframework.user.service.UserMemberService;

@Service("userMemberService")
public class UserMemberServiceImpl implements UserMemberService{

	@Resource(name="userMemberDAO")
	private UserMemberDAO userMemberDAO;
	
	public int userIdDupChk(String userId) throws Exception {
		return userMemberDAO.userIdDupChk(userId); 
	}
	
	public int mobileNumDupChk(String mobileNum) throws Exception {
		return userMemberDAO.mobileNumDupChk(mobileNum); 
	}
	
	public void memberInsert(MemberVO vo) throws Exception {
		userMemberDAO.memberInsert(vo);
	}
	
	public int userLogin(MemberVO vo) throws Exception {
		return userMemberDAO.userLogin(vo);
	}
}
