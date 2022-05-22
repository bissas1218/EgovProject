package egovframework.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Service;

import egovframework.admin.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Resource(name="menuDAO")
	private MenuDAO menuDAO;
	
	public List<?> selectMenuList() throws Exception{
		return menuDAO.selectMenuList();
	}
	
	public EgovMap selectMenuInfo(HashMap<Object, Object> params) throws Exception{
		return menuDAO.selectMenuInfo(params);
	}
	
	public List<?> selectMenuDepth1List() throws Exception{
		return menuDAO.selectMenuDepth1List();
	}
	
	public List<?> selectMenuDepth2List(String pMenuCd) throws Exception{
		return menuDAO.selectMenuDepth2List(pMenuCd);
	}
	
	public int updateMenu(HashMap<Object, Object> params) throws Exception{
		return menuDAO.updateMenu(params);
	}
	
	public int insertMenu(HashMap<Object, Object> params) throws Exception{
		return menuDAO.insertMenu(params);
	}
	
	public int insertUpdateContent(HashMap<Object, Object> params) throws Exception{
		
		int cnt = menuDAO.selectContentId(params.get("menuCd").toString());
		int result = 0;
		if(cnt>0) {
			
			System.out.println("=====>subChk:"+params.get("subChk"));
			System.out.println("=====>subContId:"+params.get("subContId"));
			System.out.println("=====>subContNm:"+params.get("subContNm"));
			if(params.get("subChk").equals("true")) {
				/* 하위컨텐츠일 경우 merge into */
				int sub_cnt = menuDAO.selectSubContentId(params);
				if(sub_cnt>0) {
					result = menuDAO.updateSubContent(params);
				}else if(sub_cnt==0) {
					result = menuDAO.insertSubContent(params);
				}
				
			}else {
				result = menuDAO.updateContent(params);
			}
			
		}else if(cnt==0){
			menuDAO.insertContent(params);
		}
		return result;
	}
	
	public EgovMap selectContent(HashMap<Object, Object> params) throws Exception{
		return menuDAO.selectContent(params);
	}
	
	public List<?> selectSubContList(String menuCd) throws Exception{
		return menuDAO.selectSubContList(menuCd);
	}
}
