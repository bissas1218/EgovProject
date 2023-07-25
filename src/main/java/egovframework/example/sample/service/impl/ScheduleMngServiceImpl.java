package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.ScheduleMngService;
import egovframework.example.sample.service.ScheduleVO;

@Service("scheduleMngService")
public class ScheduleMngServiceImpl implements ScheduleMngService {

	@Resource(name="scheduleMngDAO")
	private ScheduleMngDAO scheduleMngDAO;
	
	public void insertSchedule(ScheduleVO scheduleVO) throws Exception {
		scheduleMngDAO.insertSchedule(scheduleVO);
	}
	
	public List<ScheduleVO> selectScheduleList(String sDate) throws Exception{
		return scheduleMngDAO.selectScheduleList(sDate);
	}
}
