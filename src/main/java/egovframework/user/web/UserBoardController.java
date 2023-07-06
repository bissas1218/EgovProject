package egovframework.user.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringEscapeUtils;
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
	public String normalUserBoard(@ModelAttribute("normalBoardVO") NormalBoardVO normalBoardVO, Model model) throws Exception {
		//System.out.println("boardId:"+normalBoardVO.getBoardId());
		model.addAttribute("boardId", normalBoardVO.getBoardId());
		
		BoardVO boardVO = boardService.selectBoard(normalBoardVO.getBoardId());
		model.addAttribute("boardVO", boardVO);
		
		/** EgovPropertyService.sample */
		normalBoardVO.setPageUnit(propertiesService.getInt("pageUnit"));
		normalBoardVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(normalBoardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(normalBoardVO.getPageUnit());
		paginationInfo.setPageSize(normalBoardVO.getPageSize());

		normalBoardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		normalBoardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		normalBoardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<NormalBoardVO> normalBoardList = userBoardService.selectNormalBoardList(normalBoardVO);
		model.addAttribute("normalBoardList", normalBoardList);

		int totCnt = userBoardService.selectNormalBoardListTotCnt(normalBoardVO);
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
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/normalUserBoardInsert.do", method = RequestMethod.POST)
	public String normalUserBoardInsertSubmit(NormalBoardVO normalBoardVO, ModelMap model, BindingResult bindingResult) throws Exception {
		
		//System.out.println("boardId:"+normalBoardVO.getBoardId());
		//System.out.println("postTitle:"+normalBoardVO.getPostTitle());
		//System.out.println("postContent:"+normalBoardVO.getPostContent());
		//System.out.println(StringEscapeUtils.unescapeHtml3(normalBoardVO.getPostContent()));
		normalBoardVO.setPostContent(StringEscapeUtils.unescapeHtml3(normalBoardVO.getPostContent()));
		
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
	
	@RequestMapping(value="/normalUserBoardView.do")
	public String normalUserBoardView(@ModelAttribute("normalBoardVO") NormalBoardVO normalBoardVO, Model model) throws Exception {
		
		String searchKeyword = normalBoardVO.getSearchKeyword();
		String searchCondition = normalBoardVO.getSearchCondition();
		int pageIndex = normalBoardVO.getPageIndex();
		
		normalBoardVO = userBoardService.selectNormalBoard(normalBoardVO);
		
		normalBoardVO.setSearchCondition(searchCondition);
		normalBoardVO.setSearchKeyword(searchKeyword);
		normalBoardVO.setPageIndex(pageIndex);
		
		model.addAttribute("normalBoardVO", normalBoardVO);
		
		return "user/board/normalUserBoardView";
	}
	
	@RequestMapping(value="/normalUserBoardUpdate.do")
	public String normalUserBoardUpdate(@ModelAttribute("normalBoardVO") NormalBoardVO normalBoardVO, Model model) throws Exception {
		
		normalBoardVO = userBoardService.selectNormalBoard(normalBoardVO);
		model.addAttribute("normalBoardVO", normalBoardVO);
		
		return "user/board/normalUserBoardUpdate";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/normalUserBoardUpdate.do", method = RequestMethod.POST)
	public String normalUserBoardUpdateSubmit(NormalBoardVO normalBoardVO, ModelMap model, BindingResult bindingResult) throws Exception {
		
		//System.out.println("boardId:"+normalBoardVO.getBoardId());
		//System.out.println("postTitle:"+normalBoardVO.getPostTitle());
		//System.out.println("postContent:"+normalBoardVO.getPostContent());
		//System.out.println(StringEscapeUtils.unescapeHtml3(normalBoardVO.getPostContent()));
		normalBoardVO.setPostContent(StringEscapeUtils.unescapeHtml3(normalBoardVO.getPostContent()));
		
		// Server-Side Validation
		beanValidator.validate(normalBoardVO, bindingResult);
				
		String result = userBoardService.updateNormalBoard(normalBoardVO);
		System.out.println("update result:"+result);
		
		return "forward:/normalUserBoardList.do";
	}
	
	@RequestMapping(value="/photoUserBoardList.do")
	public String photoUserBoard() throws Exception {
		return "user/board/photoUserBoardList";
	}
	
	@RequestMapping(value="/videoUserBoardList.do")
	public String videoUserBoard() throws Exception {
		return "user/board/videoUserBoardList";
	}
}
