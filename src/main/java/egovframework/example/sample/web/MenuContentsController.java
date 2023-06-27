package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.MenuVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

@Controller
public class MenuContentsController {

	@RequestMapping(value = "/sidebar.do")
	public String sideBar() throws Exception {
		return "admin/cmmn/sidebar";
	}
	
	@RequestMapping(value = "/menuMng.do")
	public String menuMng(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		MenuVO menuVO = new MenuVO();
		//menuVO.setMenuId("testMenuID");
		
		//System.out.println("page index:"+searchVO.getPageIndex());
		// 변수명은 CoC 에 따라 sampleVO
		model.addAttribute(menuVO);
		return "admin/menuContent/menuMng";
	}
	
	@RequestMapping(value = "/ajaxTest.do")
	@ResponseBody
	public String ajaxTest() {
		return "abcd";
	}
	
	@RequestMapping(value = "/ajaxJsonTest.do")
	@ResponseBody
	public String ajaxJsonTest() {
		return "abcd";
	}
}
