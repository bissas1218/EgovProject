package egovframework.admin.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;

import egovframework.admin.service.MenuService;

@Controller
public class AdminMainController {

	@Resource(name="menuService")
	private MenuService menuService;
	
	@RequestMapping(value = "/admin.do")
	public String mainPage(ModelMap model) throws Exception {
		return "/admin/main";
	}
	
	@RequestMapping(value = "/menuMng.do")
	public String menuPage(ModelMap model) throws Exception {
		//List<?> menuList = menuService.selectMenuList();
		//System.out.println("=====>"+menuList);
		return "/admin/menuMng";
	}
	
	@RequestMapping(value = "/menuList.do", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView menuListAjax(ModelMap model) throws Exception {
		List<?> menuList = menuService.selectMenuList();
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("menuList", menuList);
		
		return mav;
	}
	
	@RequestMapping(value = "/menuSave.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView menuSaveAjax(@RequestParam HashMap<Object, Object> params, ModelMap model) throws Exception {
		String menuCd = params.get("menuCd").toString();
		
		int result = 0;
		if(menuCd.substring(0,1).equals("j")) {
			result = menuService.insertMenu(params);
		}else {
			result = menuService.updateMenu(params);
		}
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", result);
		
		List<?> menuList = menuService.selectMenuList();
		mav.addObject("menuList", menuList);
		
		return mav;
	}
	
	@RequestMapping(value = "/contentSave.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView contentSaveAjax(@RequestParam HashMap<Object, Object> params, ModelMap model) throws Exception {
		String menuCd = params.get("menuCd").toString();
		
		System.out.println("=====>menuCd:"+menuCd);
		System.out.println("=====>content:"+params.get("content"));
		int result = menuService.insertUpdateContent(params);
		System.out.println("=====>result:"+result);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", "success");
		
		return mav;
	}
	
	@RequestMapping(value = "/selectContent.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView selectContent(@RequestParam HashMap<Object, Object> params, ModelMap model) throws Exception {
		String menuCd = params.get("menuCd").toString();
		
		System.out.println("=====>menuCd:"+menuCd);
		EgovMap map = menuService.selectContent(menuCd);
		System.out.println("=====>result:"+map.get("content"));
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("data", HtmlUtils.htmlUnescape(map.get("content").toString()));
		
		return mav;
	//	return map.get("content").toString();
	}
}
