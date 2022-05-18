package egovframework.admin.service;

import java.util.HashMap;
import java.util.List;

public interface MenuService {

	List<?> selectMenuList() throws Exception;
	
	int updateMenu(HashMap<Object, Object> params) throws Exception;
	
	void insertMenu(HashMap<Object, Object> params) throws Exception;
}
