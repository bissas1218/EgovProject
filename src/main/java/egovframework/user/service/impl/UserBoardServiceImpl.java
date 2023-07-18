package egovframework.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.NormalBoardVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.user.service.PhotoBoardVO;
import egovframework.user.service.UserBoardService;
import egovframework.user.service.VideoBoardVO;

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
	
	@Override
	public List<NormalBoardVO> selectNormalBoardList(SampleDefaultVO searchVO) throws Exception {
		return userBoardDAO.selectNormalBoardList(searchVO);
	}

	@Override
	public int selectNormalBoardListTotCnt(SampleDefaultVO searchVO) throws Exception {
		return userBoardDAO.selectNormalBoardListTotCnt(searchVO);
	}
	
	public NormalBoardVO selectNormalBoard(NormalBoardVO normalBoardVO) throws Exception {
		return userBoardDAO.selectNormalBoard(normalBoardVO);
	}
	
	public String updateNormalBoard(NormalBoardVO normalBoardVO) throws Exception {
		return userBoardDAO.updateNormalBoard(normalBoardVO);
	}
	
	public String selectNewPhotoBoardId() throws Exception {
		return userBoardDAO.selectNewPhotoBoardId();
	}
	
	public void insertPhotoUpload(PhotoBoardVO photoBoardVO) throws Exception {
		userBoardDAO.insertPhotoUpload(photoBoardVO);
	}
	
	public List<PhotoBoardVO> selectPhotoBoardList(String boardId) throws Exception {
		return userBoardDAO.selectPhotoBoardList(boardId);
	}
	
	public String selectNewVideoBoardId() throws Exception {
		return userBoardDAO.selectNewVideoBoardId();
	}
	
	public void insertVideoUpload(VideoBoardVO videoBoardVO) throws Exception {
		userBoardDAO.insertVideoUpload(videoBoardVO);
	}
	
	public List<VideoBoardVO> selectVideoBoardList(String boardId) throws Exception {
		return userBoardDAO.selectVideoBoardList(boardId);
	}
}
