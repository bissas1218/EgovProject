package egovframework.program.reserve.service;

import java.util.List;

public interface GolfReservService {

	List<GolfReservVO> selectGolfReservListCnt(GolfReservVO vo) throws Exception;
	
	void insertGolfReserv(GolfReservVO vo) throws Exception;
	
	List<GolfReservVO> selectGolfReservList(GolfReservVO vo) throws Exception;
	
	int updateGolfSetting(GolfSettingVO vo) throws Exception;
	
	GolfSettingVO selectGolfSetting() throws Exception;
	
	int updateGolfReserv(GolfReservVO golfReservVO) throws Exception;
	
	int selectGolfReservTime(GolfReservVO golfReservVO) throws Exception;
	
	int deleteGolfReserv(GolfReservVO golfReservVO) throws Exception;
}
