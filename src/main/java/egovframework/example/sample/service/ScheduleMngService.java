package egovframework.example.sample.service;

import java.util.List;

public interface ScheduleMngService {

	void insertSchedule(ScheduleVO scheduleVO) throws Exception;
	
	List<ScheduleVO> selectScheduleList(String sDate) throws Exception;
	
	List<ScheduleVO> selectScheduleListCnt(ScheduleVO scheduleVO) throws Exception;
}
