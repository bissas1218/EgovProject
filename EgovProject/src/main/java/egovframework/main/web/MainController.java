package egovframework.main.web;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.admin.service.MenuService;

@Controller
public class MainController {

	@Resource(name="menuService")
	private MenuService menuService;
	
	@RequestMapping(value = "/main.do")
	public String mainPage(ModelMap model) throws Exception {
		return "/main";
	}
	
	@RequestMapping(value = "/header.do")
	public String headerPage(@RequestParam("pMenuCd") String pMenuCd, ModelMap model) throws Exception {
		System.out.println("=====>header.do");
		List<?> menuDepth1List = menuService.selectMenuDepth1List();
		model.addAttribute("menuDepth1List", menuDepth1List);
		model.addAttribute("pMenuCd", pMenuCd);
		return "/header";
	}
	
	@RequestMapping(value = "/menuCall.do")
	public String menuCall(@RequestParam("menuCd") String menuCd, ModelMap model) throws Exception{
		System.out.println("=====>menuCd:"+menuCd);
		EgovMap map = menuService.selectMenuInfo(menuCd);
		System.out.println("=====>map:"+map);
		
		model.addAttribute("pMenuCd", map.get("pId"));
		model.addAttribute("menuCd", map.get("id"));
		
		String page = "";
		if(map.get("type").equals("content")) {
			List<?> menuDepth2List = menuService.selectMenuDepth2List(map.get("pId").toString());
			model.addAttribute("menuDepth2List", menuDepth2List);
			page = "content";
		}else if(map.get("type").equals("board")) {
			List<?> menuDepth2List = menuService.selectMenuDepth2List(map.get("pId").toString());
			model.addAttribute("menuDepth2List", menuDepth2List);
			page = "board";
		}else if(map.get("type").equals("program")) {
			page = "redirect:"+map.get("url");
		}
			
		return page;
	}
}
