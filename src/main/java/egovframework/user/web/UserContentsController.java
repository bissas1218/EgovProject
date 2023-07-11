package egovframework.user.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.service.ContentsService;
import egovframework.example.sample.service.ContentsVO;

@Controller
public class UserContentsController {

	@Resource(name="contentsService")
	private ContentsService contentsService;
	
	@RequestMapping(value="/UserContentsView.do")
	public String userContentsView(@RequestParam("contentsId") String contentsId, Model model) throws Exception {
		
		ContentsVO vo = contentsService.selectContents(contentsId);
		model.addAttribute("contentsVO", vo);
		
		return "user/contentsView";
	}
}
