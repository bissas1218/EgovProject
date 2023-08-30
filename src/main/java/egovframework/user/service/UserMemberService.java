package egovframework.user.service;

public interface UserMemberService {

	int userIdDupChk(String userId) throws Exception;
	
	int mobileNumDupChk(String mobileNum) throws Exception;
	
	void memberInsert(MemberVO vo) throws Exception;
	
	int userLogin(MemberVO vo) throws Exception;
}
