package egovframework.user.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.MenuVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.user.service.UserMainService;

@Controller
public class UserMainController {

	@Resource(name="userMainService")
	private UserMainService userMainService;
	
	@RequestMapping(value = "/main.do")
	public String userMain(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		
		return "user/main";
	}
	
	@RequestMapping(value = "/userFooter.do")
	public String userFooter(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		
		return "user/footer";
	}
	
	@RequestMapping(value = "/userNavi.do")
	public String userNaviPage(ModelMap model) throws Exception {
		
		List<MenuVO> userMenuList = userMainService.selectUserMenuList();
		System.out.println("userMenuList:"+userMenuList);
		model.addAttribute("userMenuList", userMenuList);
		
		return "user/userNavi";
	}
}
