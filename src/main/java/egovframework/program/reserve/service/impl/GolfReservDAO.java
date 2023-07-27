package egovframework.program.reserve.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.program.reserve.service.GolfReservVO;

@Repository("golfReservDAO")
public class GolfReservDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<GolfReservVO> selectGolfReservListCnt(GolfReservVO vo) throws Exception {
		return (List<GolfReservVO>) list("golfReservDAO.selectGolfReservListCnt", vo);
	}
	
	public void insertGolfReserv(GolfReservVO vo) throws Exception{
		insert("golfReservDAO.insertGolfReserv", vo);
	}
}
