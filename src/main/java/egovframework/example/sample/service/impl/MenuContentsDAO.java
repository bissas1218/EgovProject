package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.MenuVO;

@Repository("menuContentsDAO")
public class MenuContentsDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	List<MenuVO> selectMenuList() throws Exception {
		return (List<MenuVO>) list("menuContentsDAO.selectMenuList");
	}
}
