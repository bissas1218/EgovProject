package egovframework.example.sample.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.MenuService;
import egovframework.example.sample.service.MenuVO;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.ContentsService;
import egovframework.example.sample.service.ContentsVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

@Controller
public class MenuController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name="menuService")
	private MenuService menuService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="contentsService")
	private ContentsService contentsService;
	
	@RequestMapping(value = "/sidebar.do")
	public String sideBar() throws Exception {
		return "admin/cmmn/sidebar";
	}
	
	@RequestMapping(value = "/menuMng.do", method = RequestMethod.GET)
	public String menuMng(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		
		// 게시판목록 조회
		List<BoardVO> boardList = boardService.selectBoardTitleList(searchVO);
		model.addAttribute("boardList", boardList);
		
		// 컨텐츠목록 조회
		List<ContentsVO> contentsList = contentsService.selectContentsAllList(searchVO);
		model.addAttribute("contentsList", contentsList);
		
		model.addAttribute("menuVO", new MenuVO());
		
		return "admin/menu/menuMng";
	}
	
	
	@RequestMapping(value = "/menuList.do", method=RequestMethod.GET)
	public void ajaxJsonListTest(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		System.out.println("ajaxJsonTest id:"+id);
	//	Map<String, String> res = new HashMap<String, String>();
		//res.put("id", "returnVal");
		try {
			List<MenuVO> menuList = menuService.selectMenuList();
			//System.out.println("menuList:"+menuList);
			
			String resStr = "[";
			for(int i=0; i<menuList.size(); i++) {
			//	System.out.println(menuList.get(i).getMenuId());
				resStr += "{\"id\":\""+menuList.get(i).getMenuId()+"\", \"parent\":\""+menuList.get(i).getpMenuId()+
						"\", \"text\":\""+menuList.get(i).getMenuNm()+
						"\", \"li_attr\":\""+menuList.get(i).getMenuType()+
						"\", \"a_attr\":\""+menuList.get(i).getTypeVal()+
						"\"}";
				
				if(i != (menuList.size()-1)) {
					resStr += ",";
				}
				
			}
			resStr += "]";
			System.out.println("resStr:"+resStr);
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(resStr); 
			
			//response.getWriter().print("[{\"id\":\"returnId1\", \"nm\":\"returnNm1\"}, {\"id\":\"returnId2\", \"nm\":\"returnNm2\"}]");
			//response.getWriter().print("[{\"id\":\"M-001\", \"parent\":\"#\", \"text\":\"My Homepage\"},{\"id\":\"M-002\", \"parent\":\"M-001\", \"text\":\"Child1\"},{\"id\":\"M-003\", \"parent\":\"M-001\", \"text\":\"Child2\"},{\"id\":\"M-004\", \"parent\":\"M-002\", \"text\":\"Child1-1\"}]");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/menuUpdate.do", method=RequestMethod.POST)
	public void menuUpdate(MenuVO menuVO, BindingResult bindingResult, Model model, SessionStatus status,
			HttpServletResponse response) throws Exception {
		
		// Server-Side Validation
		beanValidator.validate(menuVO, bindingResult);
				
		System.out.println("menuId:"+menuVO.getMenuId());
		System.out.println("pMenuId:"+menuVO.getpMenuId());
		System.out.println("menuNm:"+menuVO.getMenuNm());
		System.out.println("menuId:"+menuVO.getMenuId().substring(0,1));
		
		int result = 0;
		if(menuVO.getMenuId().substring(0,1).equals("j")) {	// 신규
			
			// new menuId
			String newMenuId = menuService.selectNewMenuId();
			switch (newMenuId.length()) {
			case 1:
				newMenuId = "M-000" + newMenuId;
				break;
			case 2:
				newMenuId = "M-00" + newMenuId;
				break;
			case 3:
				newMenuId = "M-0" + newMenuId;
				break;
			case 4:
				newMenuId = "M-" + newMenuId;
				break;
			default:
				break;
			}
			System.out.println("newMenuId:"+newMenuId);
			menuVO.setMenuId(newMenuId);
			
			menuService.menuInsert(menuVO);
			//System.out.println("result2:"+result2);
			result = 1;
			
		}else {	// 수정
			result = menuService.menuUpdate(menuVO);
		}
		
		System.out.println("result:"+result);
		
		if(result == 1) {
			response.getWriter().print("success");
		}else {
			response.getWriter().print("fail");
		}
		
	}
}
