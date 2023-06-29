package egovframework.user.service;

import java.util.List;

import egovframework.example.sample.service.MenuVO;

public interface UserMainService {

	List<MenuVO> selectUserMenuList() throws Exception;
}
