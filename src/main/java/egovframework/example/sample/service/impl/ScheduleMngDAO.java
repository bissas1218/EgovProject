package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.ScheduleVO;

@Repository("scheduleMngDAO")
public class ScheduleMngDAO extends EgovAbstractDAO{

	public void insertSchedule(ScheduleVO scheduleVO) throws Exception{
		insert("scheduleMngDAO.insertSchedule", scheduleVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<ScheduleVO> selectScheduleList(String sDate) throws Exception {
		return (List<ScheduleVO>) list("scheduleMngDAO.selectScheduleList", sDate);
	}
}
