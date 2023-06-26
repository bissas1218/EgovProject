package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.SampleDefaultVO;

@Controller
public class MainController {

	@RequestMapping(value = "/main.do")
	public String menuMng(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		return "user/main";
	}
}
