package egovframework.user.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.BoardVO;

@Controller
public class UserBoardController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@RequestMapping(value="/normalUserBoard.do")
	public String normalUserBoard(Model model) throws Exception {
		return "user/board/normalUserBoardList";
	}
	
	@RequestMapping(value="/normalUserBoardInsert.do")
	public String normalUserBoardInsert(ModelMap model) throws Exception {
		model.addAttribute("boardVO", new BoardVO());
		return "user/board/normalUserBoardInsert";
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
