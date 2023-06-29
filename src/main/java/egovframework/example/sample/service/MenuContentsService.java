package egovframework.example.sample.service;

import java.util.List;

public interface MenuContentsService {

	List<MenuVO> selectMenuList() throws Exception;
	
	int menuUpdate(MenuVO menuVO) throws Exception;
	
	String menuInsert(MenuVO menuVO) throws Exception;
	
	String selectNewMenuId() throws Exception;
}