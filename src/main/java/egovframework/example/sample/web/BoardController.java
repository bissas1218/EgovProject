package egovframework.example.sample.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.MenuVO;

@Controller
public class BoardController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="/boardMng.do")
	public String boardMng(ModelMap model) throws Exception {
		model.addAttribute("boardVO", new BoardVO());
		return "admin/board/boardMng";
	}
	
	@RequestMapping(value = "/boardInsert.do", method=RequestMethod.POST)
	public void menuUpdate(BoardVO boardVO, BindingResult bindingResult, Model model, SessionStatus status,
			HttpServletResponse response) throws Exception {
		
		// Server-Side Validation
		beanValidator.validate(boardVO, bindingResult);
		
		boardService.boardInsert(boardVO);
		
		System.out.println("boardNm:"+boardVO.getBoardNm());
		
		response.getWriter().print("success");
	}
}
