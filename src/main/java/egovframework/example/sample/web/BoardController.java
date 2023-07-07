package egovframework.example.sample.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.MenuVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Controller
public class BoardController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value="/boardMng.do")
	public String boardMng(ModelMap model) throws Exception {
		model.addAttribute("boardVO", new BoardVO());
		return "admin/board/boardMng";
	}
	
	@RequestMapping(value="/selectBoard.do")
	public void selectBoard(BoardVO boardVO, HttpServletResponse response) throws Exception {
		
		System.out.println(boardVO.getBoardId());
		boardVO = boardService.selectBoard(boardVO.getBoardId());
		
		try {
			String resStr = "";
			
			resStr += "{\"boardId\":\""+boardVO.getBoardId()+"\", "
					+ "\"boardNm\":\""+boardVO.getBoardNm()+"\", "
					+ "\"boardDescrYn\":\""+boardVO.getBoardDescrYn()+"\", "
					+ "\"boardDescr\":\""+boardVO.getBoardDescr()+"\", "
					+ "\"boardType\":\""+boardVO.getBoardType()+"\"}";
			System.out.println("resStr:"+resStr);
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(resStr); 
			//response.getWriter().print("[{\"id\":\"returnId1\", \"nm\":\"returnNm1\"}, {\"id\":\"returnId2\", \"nm\":\"returnNm2\"}]");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/selectBoardList.do")
	public void selectBoardList(@ModelAttribute("searchVO") SampleDefaultVO searchVO,	ModelMap model, HttpServletResponse response) throws Exception {
		
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
		/* */
		List<BoardVO> boardList = boardService.selectBoardList(searchVO);

		int totCnt = boardService.selectBoardListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		try {
			String resStr = "[";
			for(int i=0; i<boardList.size(); i++) {
			//	System.out.println(menuList.get(i).getMenuId());
				resStr += "{\"boardId\":\""+boardList.get(i).getBoardId()+"\", \"boardNm\":\""+boardList.get(i).getBoardNm()+
						"\", \"boardType\":\""+boardList.get(i).getBoardType()+
						"\"}";
				
				if(i != (boardList.size()-1)) {
					resStr += ",";
				}
				
			}
			resStr += ",{\"totalRecordCount\":\""+paginationInfo.getTotalRecordCount()+"\", "
					+ "\"currentPageNo\":\""+paginationInfo.getCurrentPageNo()+"\", "
					+ "\"recordCountPerPage\":\""+paginationInfo.getRecordCountPerPage()+"\", "
					+ "\"firstPageNoOnPageList\":\""+paginationInfo.getFirstPageNoOnPageList()+"\", "
					+ "\"lastPageNoOnPageList\":\""+paginationInfo.getLastPageNoOnPageList()+"\", "
					+ "\"totalPageCount\":\""+paginationInfo.getTotalPageCount()+"\","
					+ "\"pageSize\":\""+paginationInfo.getPageSize()+"\"}"
					+ "]";
			System.out.println("resStr:"+resStr);
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(resStr); 
			//response.getWriter().print("[{\"id\":\"returnId1\", \"nm\":\"returnNm1\"}, {\"id\":\"returnId2\", \"nm\":\"returnNm2\"}]");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/boardUpdate.do", method=RequestMethod.POST)
	public void boardUpdate(BoardVO boardVO, BindingResult bindingResult, Model model, SessionStatus status,
			HttpServletResponse response) throws Exception {
		
		// Server-Side Validation
		beanValidator.validate(boardVO, bindingResult);
		
		boardService.boardUpdate(boardVO);
		
		//System.out.println("boardNm:"+boardVO.getBoardNm());
		
		response.getWriter().print("success");
	}
	
	@RequestMapping(value = "/boardInsert.do", method=RequestMethod.POST)
	public void boardInsert(BoardVO boardVO, BindingResult bindingResult, Model model, SessionStatus status,
			HttpServletResponse response) throws Exception {
		
		// Server-Side Validation
		beanValidator.validate(boardVO, bindingResult);
		
		boardService.boardInsert(boardVO);
		
		System.out.println("boardNm:"+boardVO.getBoardNm());
		
		response.getWriter().print("success");
	}
}
