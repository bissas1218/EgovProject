package egovframework.admin.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.admin.service.MenuService;

@Controller
public class AdminMainController {

	@Resource(name="menuService")
	private MenuService menuService;
	
	@RequestMapping(value = "/admin.do")
	public String mainPage(ModelMap model) throws Exception {
		return "/admin/main";
	}
	
	@RequestMapping(value = "/menu.do")
	public String menuPage(ModelMap model) throws Exception {
		//List<?> menuList = menuService.selectMenuList();
		//System.out.println("=====>"+menuList);
		return "/admin/menu";
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
		
		System.out.println("=====>id:"+menuCd.substring(0,3));
		int result = 0;
		if(menuCd.substring(0,3).equals("j1_")) {
			menuService.insertMenu(params);
		}else {
			result = menuService.updateMenu(params);
		}
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", result);
		
		List<?> menuList = menuService.selectMenuList();
		mav.addObject("menuList", menuList);
		
		return mav;
	}
}
