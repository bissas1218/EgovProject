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
	
	public EgovMap selectMenuInfo(HashMap<Object, Object> params) throws Exception{
		return (EgovMap) select("menuDAO.selectMenuInfo", params);
	}
	
	public int updateMenu(HashMap<Object, Object> params) throws Exception{
		return update("menuDAO.updateMenu", params);
	}
	
	public int insertMenu(HashMap<Object, Object> params) throws Exception{
		return (int) insert("menuDAO.insertMenu", params);
	}
	
	public int selectContentId(String menuCd) throws Exception{
		return (int) select("menuDAO.selectContentId", menuCd);
	}
	
	public int updateContent(HashMap<Object, Object> params) throws Exception{
		return (int) update("menuDAO.updateContent", params);
	}
	
	public void insertContent(HashMap<Object, Object> params) throws Exception{
		insert("menuDAO.insertContent", params);
	}
	
	public int selectSubContentId(HashMap<Object, Object> params) throws Exception{
		return (int) select("menuDAO.selectSubContentId", params);
	}
	
	public int updateSubContent(HashMap<Object, Object> params) throws Exception{
		return (int) update("menuDAO.updateSubContent", params);
	}
	
	public int insertSubContent(HashMap<Object, Object> params) throws Exception{
		return (int) insert("menuDAO.insertSubContent", params);
	}
	
	public EgovMap selectContent(HashMap<Object, Object> params) throws Exception{
		return (EgovMap) select("menuDAO.selectContent", params);
	}
	
	public List<?> selectSubContList(String menuCd) throws Exception{
		return list("menuDAO.selectSubContList", menuCd);
	}
}
