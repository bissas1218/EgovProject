package egovframework.program.reserve.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.program.reserve.service.GolfReservService;
import egovframework.program.reserve.service.GolfReservVO;
import egovframework.program.reserve.service.GolfSettingVO;

@Service("golfReservService")
public class GolfReservServiceImpl implements GolfReservService {
	
	@Resource(name="golfReservDAO")
	private GolfReservDAO golfReservDAO;
	
	public List<GolfReservVO> selectGolfReservListCnt(GolfReservVO vo) throws Exception {
		return golfReservDAO.selectGolfReservListCnt(vo);
	}
	
	public void insertGolfReserv(GolfReservVO vo) throws Exception{
		golfReservDAO.insertGolfReserv(vo);
	}
	
	public List<GolfReservVO> selectGolfReservList(GolfReservVO vo) throws Exception {
		return golfReservDAO.selectGolfReservList(vo);
	}
	
	public int updateGolfSetting(GolfSettingVO vo) throws Exception{
		return golfReservDAO.updateGolfSetting(vo);
	}
	
	public GolfSettingVO selectGolfSetting() throws Exception{
		return golfReservDAO.selectGolfSetting();
	}
	
	public int updateGolfReserv(GolfReservVO golfReservVO) throws Exception {
		return golfReservDAO.updateGolfReserv(golfReservVO);
	}
	
	public int selectGolfReservTime(GolfReservVO golfReservVO) throws Exception {
		return golfReservDAO.selectGolfReservTime(golfReservVO);
	}
	
	public int deleteGolfReserv(GolfReservVO golfReservVO) throws Exception {
		return golfReservDAO.deleteGolfReserv(golfReservVO);
	}
}
