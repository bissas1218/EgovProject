package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	public void boardUpdate(BoardVO boardVO) throws Exception {
		update("boardDAO.updateBoard", boardVO);
	}
	
	public void boardInsert(BoardVO boardVO) throws Exception {
		
		String newBoardId = (String) select("boardDAO.selectNewBoardId");
		
		if(newBoardId == null) {
			newBoardId = "B-0001";
		}else {
			switch (newBoardId.length()) {
			case 1:
				newBoardId = "B-000" + newBoardId;
				break;
			case 2:
				newBoardId = "B-00" + newBoardId;
				break;
			case 3:
				newBoardId = "B-0" + newBoardId;
				break;
			case 4:
				newBoardId = "B-" + newBoardId;
				break;
			default:
				break;
			}
		}
		
		
		boardVO.setBoardId(newBoardId);
		
		insert("boardDAO.boardInsert", boardVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVO> selectBoardList(SampleDefaultVO searchVO) throws Exception {
		return (List<BoardVO>) list("boardDAO.selectBoardList", searchVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVO> selectBoardTitleList(SampleDefaultVO searchVO) throws Exception {
		return (List<BoardVO>) list("boardDAO.selectBoardTitleList", searchVO);
	}
	
	public int selectBoardListTotCnt(SampleDefaultVO searchVO) throws Exception {
		return (int) select("boardDAO.selectBoardListTotCnt", searchVO);
	}
	
	public BoardVO selectBoard(String boardId) throws Exception {
		return (BoardVO) select("boardDAO.selectBoard", boardId);
	}
}
