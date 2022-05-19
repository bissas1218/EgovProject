package egovframework.admin.service;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

public interface MenuService {

	List<?> selectMenuList() throws Exception;
	
	List<?> selectMenuDepth1List() throws Exception;
	
	EgovMap selectMenuInfo(String menuCd) throws Exception;
	
	int updateMenu(HashMap<Object, Object> params) throws Exception;
	
	int insertMenu(HashMap<Object, Object> params) throws Exception;
}
