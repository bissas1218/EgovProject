package egovframework.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.NormalBoardVO;
import egovframework.example.sample.service.SampleDefaultVO;

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
}
