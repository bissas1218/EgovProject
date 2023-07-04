package egovframework.user.service;

import egovframework.example.sample.service.NormalBoardVO;

public interface UserBoardService {

	String insertNormalBoard(NormalBoardVO normalBoardVO) throws Exception;
	String selectNewNormalBoardId() throws Exception;
}
