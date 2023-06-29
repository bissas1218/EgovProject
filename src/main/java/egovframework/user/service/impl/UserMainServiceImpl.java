package egovframework.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.MenuVO;
import egovframework.user.service.UserMainService;

@Service("userMainService")
public class UserMainServiceImpl implements UserMainService {

	@Resource(name="userMainDAO")
	private UserMainDAO userMainDAO;
	
	public List<MenuVO> selectUserMenuList() throws Exception {
		return userMainDAO.selectUserMenuList();
	}
}
