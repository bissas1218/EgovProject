package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.MenuVO;

@Repository("menuContentsDAO")
public class MenuContentsDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MenuVO> selectMenuList() throws Exception {
		return (List<MenuVO>) list("menuContentsDAO.selectMenuList");
	}
	
	public int updateMenu(MenuVO menuVO) throws Exception {
		return update("menuContentsDAO.updateMenu", menuVO);
	}
	
	public String insertMenu(MenuVO menuVO) throws Exception {
		String nextOrder = (String) select("menuContentsDAO.selectNextMenuOrder", menuVO.getpMenuId());
		menuVO.setMenuOrder(nextOrder);
		return (String) insert("menuContentsDAO.insertMenu", menuVO);
	}
	
	public String selectNewMenuId() throws Exception {
		return (String) select("menuContentsDAO.selectNewMenuId");
	}
	
}
