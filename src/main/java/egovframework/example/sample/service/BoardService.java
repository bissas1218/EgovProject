package egovframework.example.sample.service;

import java.util.List;

public interface BoardService {

	void boardInsert(BoardVO boardVO) throws Exception;
	
	List<BoardVO> selectBoardList(SampleDefaultVO searchVO) throws Exception;
	
	int selectBoardListTotCnt(SampleDefaultVO searchVO) throws Exception;
}
