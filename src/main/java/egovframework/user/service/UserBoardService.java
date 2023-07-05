package egovframework.user.service;

import java.util.List;

import egovframework.example.sample.service.NormalBoardVO;
import egovframework.example.sample.service.SampleDefaultVO;

public interface UserBoardService {

	String insertNormalBoard(NormalBoardVO normalBoardVO) throws Exception;
	String selectNewNormalBoardId() throws Exception;
	
	List<NormalBoardVO> selectNormalBoardList(SampleDefaultVO searchVO) throws Exception;
	
	int selectNormalBoardListTotCnt(SampleDefaultVO searchVO);
}
