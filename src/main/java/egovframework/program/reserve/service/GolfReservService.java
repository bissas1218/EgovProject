package egovframework.program.reserve.service;

import java.util.List;

public interface GolfReservService {

	List<GolfReservVO> selectGolfReservListCnt(GolfReservVO vo) throws Exception;
	
	void insertGolfReserv(GolfReservVO vo) throws Exception;
}
