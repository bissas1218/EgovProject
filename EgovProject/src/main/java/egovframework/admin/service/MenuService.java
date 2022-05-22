package egovframework.admin.service;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

public interface MenuService {

	List<?> selectMenuList() throws Exception;
	
	List<?> selectMenuDepth1List() throws Exception;
	
	List<?> selectMenuDepth2List(String pMenuCd) throws Exception;
	
	EgovMap selectMenuInfo(HashMap<Object, Object> params) throws Exception;
	
	int updateMenu(HashMap<Object, Object> params) throws Exception;
	
	int insertMenu(HashMap<Object, Object> params) throws Exception;
	
	int insertUpdateContent(HashMap<Object, Object> params) throws Exception;
	
	EgovMap selectContent(HashMap<Object, Object> params) throws Exception;
	
	List<?> selectSubContList(String menuCd) throws Exception;
}
