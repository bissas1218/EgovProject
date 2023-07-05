package egovframework.example.sample.service;

import java.util.List;

public interface BoardService {

	void boardInsert(BoardVO boardVO) throws Exception;
	
	void boardUpdate(BoardVO boardVO) throws Exception;
	
	List<BoardVO> selectBoardTitleList(SampleDefaultVO searchVO) throws Exception;
	
	List<BoardVO> selectBoardList(SampleDefaultVO searchVO) throws Exception;
	
	int selectBoardListTotCnt(SampleDefaultVO searchVO) throws Exception;
	
	BoardVO selectBoard(String boardId) throws Exception;
}
