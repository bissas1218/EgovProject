package egovframework.user.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.NormalBoardVO;
import egovframework.user.service.UserBoardService;

@Controller
public class UserBoardController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name = "userBoardService")
	private UserBoardService userBoardService;
	
	@RequestMapping(value="/normalUserBoard.do")
	public String normalUserBoard(@RequestParam("boardId") String boardId, Model model) throws Exception {
		System.out.println("boardId:"+boardId);
		model.addAttribute("boardId", boardId);
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
		
		return "forward:/normalUserBoard.do";
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
