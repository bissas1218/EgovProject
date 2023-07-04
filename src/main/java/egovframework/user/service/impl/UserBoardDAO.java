package egovframework.user.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.NormalBoardVO;

@Repository("userBoardDAO")
public class UserBoardDAO extends EgovAbstractDAO {

	public String insertNormalBoard(NormalBoardVO normalBoardVO) throws Exception {
		return (String) insert("userBoardDAO.insertNormalBoard", normalBoardVO);
	}
	
	public String selectNewNormalBoardId() throws Exception {
		return (String) select("userBoardDAO.selectNewNormalBoardId");
	}
}
