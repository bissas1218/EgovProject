package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	public void boardInsert(BoardVO boardVO) throws Exception {
		boardDAO.boardInsert(boardVO); 
	}
	
	public List<BoardVO> selectBoardList() throws Exception {
		return boardDAO.selectBoardList();
	}
}
