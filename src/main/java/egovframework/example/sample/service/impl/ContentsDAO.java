package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.ContentsVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Repository("contentsDAO")
public class ContentsDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<ContentsVO> selectContentsList(SampleDefaultVO sampleVO) throws Exception {
		return (List<ContentsVO>) list("contentsDAO.selectContentsList", sampleVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<ContentsVO> selectContentsAllList(SampleDefaultVO sampleVO) throws Exception {
		return (List<ContentsVO>) list("contentsDAO.selectContentsAllList", sampleVO);
	}
	
	public int selectContentsListTotCnt(SampleDefaultVO sampleVO) throws Exception {
		return (int) select("contentsDAO.selectContentsListTotCnt", sampleVO);
	}
	
	public String selectNewContentsId() throws Exception {
		return (String) select("contentsDAO.selectNewContentsId");
	}
	
	public String insertContents(ContentsVO contentsVO) throws Exception {
		return (String) insert("contentsDAO.insertContents", contentsVO);
	}
	
	public ContentsVO selectContents(String contentsId) throws Exception {
		return (ContentsVO) select("contentsDAO.selectContents", contentsId);
	}
	
	public int updateContents(ContentsVO contentsVO) throws Exception {
		return update("contentsDAO.updateContents", contentsVO);
	}
}
