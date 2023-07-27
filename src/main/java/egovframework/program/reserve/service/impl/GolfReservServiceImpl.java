package egovframework.program.reserve.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.program.reserve.service.GolfReservService;
import egovframework.program.reserve.service.GolfReservVO;

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
}
