package egovframework.user.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.MenuVO;

@Repository("userMainDAO")
public class UserMainDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MenuVO> selectUserMenuList() throws Exception {
		return (List<MenuVO>) list("UserMainDAO.selectUserMenuList");
	}
}
