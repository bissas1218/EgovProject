package egovframework.user.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserBoardController {

	@RequestMapping(value="/normalUserBoard.do")
	public String normalUserBoard() throws Exception {
		return "user/normalUserBoard";
	}
	
	@RequestMapping(value="/photoUserBoard.do")
	public String photoUserBoard() throws Exception {
		return "user/photoUserBoard";
	}
	
	@RequestMapping(value="/videoUserBoard.do")
	public String videoUserBoard() throws Exception {
		return "user/videoUserBoard";
	}
}
