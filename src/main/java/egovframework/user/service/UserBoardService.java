package egovframework.user.service;

import java.util.List;

import egovframework.example.sample.service.NormalBoardVO;
import egovframework.example.sample.service.SampleDefaultVO;

public interface UserBoardService {

	String insertNormalBoard(NormalBoardVO normalBoardVO) throws Exception;
	String selectNewNormalBoardId() throws Exception;
	
	List<NormalBoardVO> selectNormalBoardList(SampleDefaultVO searchVO) throws Exception;
	
	int selectNormalBoardListTotCnt(SampleDefaultVO searchVO) throws Exception;
	
	NormalBoardVO selectNormalBoard(NormalBoardVO normalBoardVO) throws Exception;
	
	String updateNormalBoard(NormalBoardVO normalBoardVO) throws Exception;
	
	String selectNewPhotoBoardId() throws Exception;
	void insertPhotoUpload(PhotoBoardVO photoBoardVO) throws Exception;
	
	List<PhotoBoardVO> selectPhotoBoardList(String boardId) throws Exception;
	
	String selectNewVideoBoardId() throws Exception;
	void insertVideoUpload(VideoBoardVO videoBoardVO) throws Exception;
	
	List<VideoBoardVO> selectVideoBoardList(String boardId) throws Exception;
}
