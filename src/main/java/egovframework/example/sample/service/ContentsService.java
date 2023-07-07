package egovframework.example.sample.service;

import java.util.List;

public interface ContentsService {

	List<ContentsVO> selectContentsList(SampleDefaultVO sampleVO) throws Exception;
	
	int selectContentsListTotCnt(SampleDefaultVO sampleVO) throws Exception;
	
	String selectNewContentsId() throws Exception;
	
	String insertContents(ContentsVO contentsVO) throws Exception;
}
