package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.ContentsService;
import egovframework.example.sample.service.ContentsVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Service("contentsService")
public class ContentsServiceImpl implements ContentsService {
	
	@Resource(name = "contentsDAO")
	private ContentsDAO contentsDAO;
	
	public List<ContentsVO> selectContentsList(SampleDefaultVO sampleVO) throws Exception {
		return contentsDAO.selectContentsList(sampleVO);
	}

	public int selectContentsListTotCnt(SampleDefaultVO sampleVO) throws Exception {
		return contentsDAO.selectContentsListTotCnt(sampleVO);
	}
	
	public String selectNewContentsId() throws Exception {
		return contentsDAO.selectNewContentsId();
	}
	
	public String insertContents(ContentsVO contentsVO) throws Exception {
		return contentsDAO.insertContents(contentsVO);
	}
}
