package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.MenuVO;

@Repository("menuDAO")
public class MenuDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MenuVO> selectMenuList() throws Exception {
		return (List<MenuVO>) list("menuDAO.selectMenuList");
	}
	
	public int updateMenu(MenuVO menuVO) throws Exception {
		return update("menuDAO.updateMenu", menuVO);
	}
	
	public String insertMenu(MenuVO menuVO) throws Exception {
		String nextOrder = (String) select("menuDAO.selectNextMenuOrder", menuVO.getpMenuId());
		menuVO.setMenuOrder(nextOrder);
		return (String) insert("menuDAO.insertMenu", menuVO);
	}
	
	public String selectNewMenuId() throws Exception {
		return (String) select("menuDAO.selectNewMenuId");
	}
	
}
