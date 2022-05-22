package egovframework.main.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;

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
	//	System.out.println("=====>header.do");
		List<?> menuDepth1List = menuService.selectMenuDepth1List();
		model.addAttribute("menuDepth1List", menuDepth1List);
		model.addAttribute("pMenuCd", pMenuCd);
		return "/header";
	}
	
	@RequestMapping(value = "/menuCall.do")
	public String menuCall(@RequestParam HashMap<Object, Object> params, ModelMap model) throws Exception{
		
		
		EgovMap map = menuService.selectMenuInfo(params);
	//	System.out.println("=====>map:"+map);
		
		model.addAttribute("pMenuCd", map.get("pId"));
		model.addAttribute("menuCd", map.get("id"));
		
		String page = "";
		if(map.get("type").equals("content")) {
			
			List<?> menuDepth2List = menuService.selectMenuDepth2List(map.get("pId").toString());
			model.addAttribute("menuDepth2List", menuDepth2List);
			
			params.put("menuCd", map.get("id"));
			params.put("subContId", "0");
		//	System.out.println("=====>params:"+params);
			EgovMap map2 = menuService.selectContent(params);
		//	System.out.println("=====>content:"+map2.get("content"));
			model.addAttribute("content", HtmlUtils.htmlUnescape(map2.get("content").toString()));
			
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
	
	@RequestMapping(value = "/subContCall.do")
	public String subContCall(@RequestParam HashMap<Object, Object> params, ModelMap model) throws Exception{
		
		String id = params.get("id").toString();
		String arr[] = id.split("-");
		
		params.put("menuCd", arr[0]);
		EgovMap map = menuService.selectMenuInfo(params);
		
		model.addAttribute("pMenuCd", map.get("pId"));
		model.addAttribute("menuCd", map.get("id"));
		
		model.addAttribute("menuNm", map.get("nm"));
		
		List<?> menuDepth2List = menuService.selectMenuDepth2List(map.get("pId").toString());
		model.addAttribute("menuDepth2List", menuDepth2List);
		
		params.put("menuCd", arr[0]);
		params.put("subContId", arr[1]);
	//	System.out.println("=====>params:"+params);
		
		map = menuService.selectContent(params);
	//	System.out.println("=====>content:"+map2.get("content"));
		model.addAttribute("content", HtmlUtils.htmlUnescape(map.get("content").toString()));
		model.addAttribute("subContNm", map.get("subContNm"));
		
		return "sub_content";
	}
}
