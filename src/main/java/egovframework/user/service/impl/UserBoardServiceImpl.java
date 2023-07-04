package egovframework.user.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.NormalBoardVO;
import egovframework.user.service.UserBoardService;

@Service("userBoardService")
public class UserBoardServiceImpl implements UserBoardService{

	@Resource(name="userBoardDAO")
	private UserBoardDAO userBoardDAO;
	
	public String insertNormalBoard(NormalBoardVO normalBoardVO) throws Exception {
		return userBoardDAO.insertNormalBoard(normalBoardVO);
	}
	
	public String selectNewNormalBoardId() throws Exception {
		return userBoardDAO.selectNewNormalBoardId();
	}
}
