package egovframework.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.SampleDefaultVO;

@Repository("menuDAO")
public class MenuDAO extends EgovAbstractDAO {

	public List<?> selectMenuList() throws Exception {
		return list("menuDAO.selectMenuList");
	}
	
	public List<?> selectMenuDepth1List() throws Exception {
		return list("menuDAO.selectMenuDepth1List");
	}
	
	public List<?> selectMenuDepth2List(String pMenuCd) throws Exception {
		return list("menuDAO.selectMenuDepth2List", pMenuCd);
	}
	
	public EgovMap selectMenuInfo(String menuCd) throws Exception{
		return (EgovMap) select("menuDAO.selectMenuInfo", menuCd);
	}
	
	public int updateMenu(HashMap<Object, Object> params) throws Exception{
		return update("menuDAO.updateMenu", params);
	}
	
	public int insertMenu(HashMap<Object, Object> params) throws Exception{
		return (int) insert("menuDAO.insertMenu", params);
	}
}
