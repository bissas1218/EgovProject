package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.MenuService;
import egovframework.example.sample.service.MenuVO;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	
	@Resource(name="menuDAO")
	private MenuDAO menuDAO;
	
	public List<MenuVO> selectMenuList() throws Exception {
		return menuDAO.selectMenuList();
	}
	
	public int menuUpdate(MenuVO menuVO) throws Exception {
		return menuDAO.updateMenu(menuVO);
	}
	
	public String menuInsert(MenuVO menuVO) throws Exception {
		return menuDAO.insertMenu(menuVO);
	}
	
	public String selectNewMenuId() throws Exception {
		return menuDAO.selectNewMenuId();
	}
}
