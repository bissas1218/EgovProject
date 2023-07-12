package egovframework.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.NormalBoardVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.user.service.PhotoBoardVO;

@Repository("userBoardDAO")
public class UserBoardDAO extends EgovAbstractDAO {

	public String insertNormalBoard(NormalBoardVO normalBoardVO) throws Exception {
		return (String) insert("userBoardDAO.insertNormalBoard", normalBoardVO);
	}
	
	public String selectNewNormalBoardId() throws Exception {
		return (String) select("userBoardDAO.selectNewNormalBoardId");
	}
	
	@SuppressWarnings("unchecked")
	public List<NormalBoardVO> selectNormalBoardList(SampleDefaultVO searchVO) throws Exception {
		return (List<NormalBoardVO>) list("userBoardDAO.selectNormalBoardList", searchVO);
	}

	public int selectNormalBoardListTotCnt(SampleDefaultVO searchVO) {
		return (Integer) select("userBoardDAO.selectNormalBoardListTotCnt", searchVO);
	}
	
	public NormalBoardVO selectNormalBoard(NormalBoardVO normalBoardVO) throws Exception {
		return (NormalBoardVO) select("userBoardDAO.selectNormalBoard", normalBoardVO);
	}
	
	public String updateNormalBoard(NormalBoardVO normalBoardVO) throws Exception {
		return (String) insert("userBoardDAO.updateNormalBoard", normalBoardVO);
	}
	
	public String selectNewPhotoBoardId() throws Exception {
		return (String) select("userBoardDAO.selectNewPhotoBoardId");
	}
	
	public void insertPhotoUpload(PhotoBoardVO photoBoardVO) throws Exception {
		//System.out.println("explain:"+photoBoardVO.getExplain());
		insert("userBoardDAO.insertPhotoUpload", photoBoardVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<PhotoBoardVO> selectPhotoBoardList(String boardId) throws Exception {
		return (List<PhotoBoardVO>) list("userBoardDAO.selectPhotoBoardList", boardId);
	}
}
