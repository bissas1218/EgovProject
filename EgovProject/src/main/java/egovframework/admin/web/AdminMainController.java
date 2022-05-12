package egovframework.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {

	@RequestMapping(value = "/admin.do")
	public String mainPage(ModelMap model) throws Exception {
		return "/admin/main";
	}
	
	@RequestMapping(value = "/menu.do")
	public String menuPage(ModelMap model) throws Exception {
		return "/admin/menu";
	}
}
