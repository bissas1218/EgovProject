package egovframework.program.reserve.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.program.reserve.service.GolfReservVO;
import egovframework.program.reserve.service.GolfSettingVO;

@Repository("golfReservDAO")
public class GolfReservDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<GolfReservVO> selectGolfReservListCnt(GolfReservVO vo) throws Exception {
		return (List<GolfReservVO>) list("golfReservDAO.selectGolfReservListCnt", vo);
	}
	
	public void insertGolfReserv(GolfReservVO vo) throws Exception{
		insert("golfReservDAO.insertGolfReserv", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<GolfReservVO> selectGolfReservList(GolfReservVO vo) throws Exception {
		return (List<GolfReservVO>) list("golfReservDAO.selectGolfReservList", vo);
	}
	
	public int updateGolfSetting(GolfSettingVO vo) throws Exception{
		return update("golfReservDAO.updateGolfSetting", vo);
	}
	
	public GolfSettingVO selectGolfSetting() throws Exception{
		return (GolfSettingVO) select("golfReservDAO.selectGolfSetting");
	}
	
	public int updateGolfReserv(GolfReservVO golfReservVO) throws Exception{
		return update("golfReservDAO.updateGolfReserv", golfReservVO);
	}
	
	public int selectGolfReservTime(GolfReservVO golfReservVO) throws Exception{
		return (int) select("golfReservDAO.selectGolfReservTime", golfReservVO);
	}
	
	public int deleteGolfReserv(GolfReservVO golfReservVO) throws Exception{
		return (int) delete("golfReservDAO.deleteGolfReserv", golfReservVO);
	}
	
	public void userReservUpdate(GolfReservVO golfReservVO) throws Exception {
		insert("golfReservDAO.userReservUpdate", golfReservVO);
	}
}
