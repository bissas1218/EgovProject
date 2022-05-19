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
	
	public EgovMap selectMenuInfo(String menuCd) throws Exception{
		return menuDAO.selectMenuInfo(menuCd);
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
}
