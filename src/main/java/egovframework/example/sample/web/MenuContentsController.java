package egovframework.example.sample.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.MenuContentsService;
import egovframework.example.sample.service.MenuVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

@Controller
public class MenuContentsController {

	@Resource(name="menuContentsService")
	private MenuContentsService menuContentsService;
	
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
	
	@RequestMapping(value = "/menuList.do", method=RequestMethod.GET)
	public void ajaxJsonListTest(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		System.out.println("ajaxJsonTest id:"+id);
	//	Map<String, String> res = new HashMap<String, String>();
		//res.put("id", "returnVal");
		try {
			List<MenuVO> menuList = menuContentsService.selectMenuList();
			System.out.println("menuList:"+menuList);
			String resStr = "[";
			for(int i=0; i<menuList.size(); i++) {
				System.out.println(menuList.get(i).getMenuId());
				resStr += "{\"id\":\""+menuList.get(i).getMenuId()+"\", \"parent\":\""+menuList.get(i).getpMenuId()+"\", \"text\":\""+menuList.get(i).getMenuNm()+"\"}";
				if(i != (menuList.size()-1)) {
					resStr += ",";
				}
			}
			resStr += "]";
			System.out.println("resStr:"+resStr);
			
			response.getWriter().print(resStr); 
			//response.getWriter().print("[{\"id\":\"returnId1\", \"nm\":\"returnNm1\"}, {\"id\":\"returnId2\", \"nm\":\"returnNm2\"}]");
			//response.getWriter().print("[{\"id\":\"M-001\", \"parent\":\"#\", \"text\":\"My Homepage\"},{\"id\":\"M-002\", \"parent\":\"M-001\", \"text\":\"Child1\"},{\"id\":\"M-003\", \"parent\":\"M-001\", \"text\":\"Child2\"},{\"id\":\"M-004\", \"parent\":\"M-002\", \"text\":\"Child1-1\"}]");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
