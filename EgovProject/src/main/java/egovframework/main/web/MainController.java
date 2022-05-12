package egovframework.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = "/main.do")
	public String mainPage(ModelMap model) throws Exception {
		return "/main";
	}
	
	@RequestMapping(value = "/header.do")
	public String headerPage(ModelMap model) throws Exception {
		System.out.println("=====>header.do");
		return "/header";
	}
}
