package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.MenuContentsService;
import egovframework.example.sample.service.MenuVO;

@Service("menuContentsService")
public class MenuContentsServiceImpl implements MenuContentsService {
	
	@Resource(name="menuContentsDAO")
	private MenuContentsDAO menuContentsDAO;
	
	public List<MenuVO> selectMenuList() throws Exception {
		return menuContentsDAO.selectMenuList();
	}
}
