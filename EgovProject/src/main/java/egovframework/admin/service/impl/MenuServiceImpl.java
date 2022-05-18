package egovframework.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admin.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Resource(name="menuDAO")
	private MenuDAO menuDAO;
	
	public List<?> selectMenuList() throws Exception{
		return menuDAO.selectMenuList();
	}
	
	public int updateMenu(HashMap<Object, Object> params) throws Exception{
		return menuDAO.updateMenu(params);
	}
}
