package egovframework.admin.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.SampleDefaultVO;

@Repository("menuDAO")
public class MenuDAO extends EgovAbstractDAO {

	public List<?> selectMenuList() throws Exception {
		return list("menuDAO.selectMenuList");
	}
}
