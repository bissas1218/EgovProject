package egovframework.user.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserBoardController {

	@RequestMapping(value="/userBoard.do")
	public String userBoard() throws Exception {
		return "user/userBoard";
	}
}
