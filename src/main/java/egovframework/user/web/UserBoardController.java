package egovframework.user.web;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.NormalBoardVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.user.service.UserBoardService;

@Controller
public class UserBoardController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "userBoardService")
	private UserBoardService userBoardService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value="/normalUserBoardList.do")
	public String normalUserBoard(@ModelAttribute("searchVO") SampleDefaultVO searchVO, @RequestParam("boardId") String boardId, Model model) throws Exception {
		System.out.println("boardId:"+boardId);
		model.addAttribute("boardId", boardId);
		
		BoardVO boardVO = boardService.selectBoard(boardId);
		model.addAttribute("boardVO", boardVO);
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<NormalBoardVO> normalBoardList = userBoardService.selectNormalBoardList(searchVO);
		model.addAttribute("normalBoardList", normalBoardList);

		int totCnt = userBoardService.selectNormalBoardListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		//List<NormalBoardVO> normalBoardList = userBoardService.selectNormalBoardList(searchVO);
		
		return "user/board/normalUserBoardList";
	}
	
	@RequestMapping(value="/normalUserBoardInsert.do")
	public String normalUserBoardInsert(NormalBoardVO normalBoardVO, ModelMap model) throws Exception {
		System.out.println("boardId:"+normalBoardVO.getBoardId());
		model.addAttribute("normalBoardVO", normalBoardVO);
		return "user/board/normalUserBoardInsert";
	}
	
	@RequestMapping(value="/normalUserBoardInsert.do", method = RequestMethod.POST)
	public String normalUserBoardInsertSubmit(NormalBoardVO normalBoardVO, ModelMap model, BindingResult bindingResult) throws Exception {
		
		System.out.println("boardId:"+normalBoardVO.getBoardId());
		System.out.println("postTitle:"+normalBoardVO.getPostTitle());
		System.out.println("postContent:"+normalBoardVO.getPostContent());
		
		// Server-Side Validation
		beanValidator.validate(normalBoardVO, bindingResult);
				
		String newNormalBoardId = userBoardService.selectNewNormalBoardId();
				
		switch (newNormalBoardId.length()) {
		case 1:
			newNormalBoardId = "NB-000000" + newNormalBoardId;
			break;
		case 2:
			newNormalBoardId = "NB-00000" + newNormalBoardId;
			break;
		case 3:
			newNormalBoardId = "NB-0000" + newNormalBoardId;
			break;
		case 4:
			newNormalBoardId = "NB-000" + newNormalBoardId;
			break;
		case 5:
			newNormalBoardId = "NB-00" + newNormalBoardId;
			break;
		case 6:
			newNormalBoardId = "NB-0" + newNormalBoardId;
			break;
		case 7:
			newNormalBoardId = "NB-" + newNormalBoardId;
			break;
		default:
			break;
		}
		System.out.println("newNormalBoardId:"+newNormalBoardId);
		normalBoardVO.setNorBrdId(newNormalBoardId);
		
		String result = userBoardService.insertNormalBoard(normalBoardVO);
		System.out.println("result:"+result);
		
		return "forward:/normalUserBoardList.do";
	}
	
	@RequestMapping(value="/photoUserBoard.do")
	public String photoUserBoard() throws Exception {
		return "user/board/photoUserBoard";
	}
	
	@RequestMapping(value="/videoUserBoard.do")
	public String videoUserBoard() throws Exception {
		return "user/board/videoUserBoard";
	}
}
