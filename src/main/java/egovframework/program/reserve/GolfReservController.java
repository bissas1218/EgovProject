package egovframework.program.reserve;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.service.ScheduleMngService;
import egovframework.example.sample.service.ScheduleVO;

@Controller
public class GolfReservController {

	@Resource(name="scheduleMngService")
	private ScheduleMngService scheduleMngService;
	
	@RequestMapping(value="/golfReservList.do")
	public String reserMng(Model model) throws Exception {
		
		YearMonth today = YearMonth.now();
		
		//System.out.println("today:"+today);
		model.addAttribute("year", today.getYear());
		model.addAttribute("month", today.getMonthValue());
		
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance( );
        //System.out.println(df.format(cal.getTime()));
        
		model.addAttribute("today", df.format(cal.getTime()));
		
		return "admin/reserv/golf/golfReservList";
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/selectGolfReservMonth.do", method=RequestMethod.GET)
	public void ajaxJsonListTest(@RequestParam("year") int year, @RequestParam("month") int month, HttpServletResponse response) throws Exception {
		//System.out.println("ajaxJsonTest month:"+month+", year:"+year);
		
		YearMonth curDay = YearMonth.of(year, month);// .now();
		//System.out.println("curDay:"+curDay);
		LocalDate start = curDay.atDay(1);
		LocalDate end = curDay.atEndOfMonth();
		//System.out.println("start:"+start+", end:"+end);
		
		 // 1. LocalDate 생성
        LocalDate date = LocalDate.of(year, month, 1);
        // LocalDateTime date = LocalDateTime.of(2021, 12, 25, 1, 15, 20);
       // System.out.println(date);  // 
 
        // 2. DayOfWeek 객체 구하기
        DayOfWeek dayOfWeek = date.getDayOfWeek();
 
        // 3. 숫자 요일 구하기
        int dayOfWeekNumber = dayOfWeek.getValue();
 
        // 4. 숫자 요일 출력
        //System.out.println(dayOfWeekNumber);  // 6
        
        DateFormat df = new SimpleDateFormat("yyyyMM");
        Calendar cal = Calendar.getInstance( );
        cal.set(year, month, 0);
        
        cal.add ( cal.MONTH, + 1 ); //다음달
        
        String nextDate = df.format(cal.getTime());
        
        cal.set(year, month, 0);
        
        cal.add ( cal.MONTH, -1 ); //이전달
        String beforeDate = df.format(cal.getTime());
        curDay = YearMonth.of(Integer.parseInt(beforeDate.substring(0,4)), Integer.parseInt(beforeDate.substring(4,6)));// .now();
		
        YearMonth.now();
		
        response.setCharacterEncoding("UTF-8");
       
        String html = "";
        
        int dayOfWeekNumber2 = 0;
		if(dayOfWeekNumber != 7){
			dayOfWeekNumber2 = dayOfWeekNumber;	
		}
		
		html = "<tr>";
		
		int dayEnd = Integer.parseInt(end.toString().substring(8,10)) + dayOfWeekNumber2;
		
		int trNum = 1;
		
		int beforeMonthDay = Integer.parseInt( curDay.atEndOfMonth().toString().replace("-", "").substring(6,8) ) - dayOfWeekNumber2; //Number(result.beforeDate.substr(6,2)) - dayOfWeekNumber; 
		int chk = 0;
		
		// 일정 카운트 조회
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setSrtDate(end.toString().replaceAll("-", "").substring(0,6)+"01");
		scheduleVO.setEndDate(end.toString().replaceAll("-", ""));
		List<ScheduleVO> cntList = scheduleMngService.selectScheduleListCnt(scheduleVO);
		
		// 전월, 현재월, 다음월 날짜 그리기
		for(int i = 1; i <= dayEnd; i++){
				
			chk++;
			
			if(i <= dayOfWeekNumber2){
				html += "<td id='" + curDay.atEndOfMonth().toString().replace("-", "").substring(0,6) + (beforeMonthDay+i)+ "'>" + (beforeMonthDay+i) + "</td>";	// 이전월 날짜 채우기
				
			}else{
				
				// css 날짜 id값 구하기
				int disDay = i-dayOfWeekNumber2;
				String dayCssId = Integer.toString(year);
				
				if(Integer.toString(month).length() == 1){
					dayCssId += "0" + month;
				}else{
					dayCssId += month;
				}
				
				if(Integer.toString(disDay).length() == 1){
					dayCssId += "0" + disDay;	
				}else{
					dayCssId += disDay;
				}
				
				String dayStyle = "";
				String cnt = "";
				String holidayChk = "N";
				
				for(int k=0; k < cntList.size(); k++) {
					
					if(cntList.get(k).getsDate().equals(dayCssId)) {
						System.out.println(cntList.get(k).getHoliDayYn());
						dayStyle = "style='background:#e6e7ff;'";
						cnt = cntList.get(k).getCnt();
						if(cntList.get(k).getHoliDayYn().equals("Y")) {
							holidayChk = "Y";
						}
					}
				}
				
				// 현대월 날짜 그리기
				String cntTxt = "";
				if(!cnt.equals("")) {
					cntTxt = " ("+cnt+")";
				}
				
				if(i % 7 == 0){
					
					if(holidayChk.equals("Y")) { // 토요일인데 공휴일일 경우
						html += "<td id='"+dayCssId+"' "+dayStyle+"><b style='color:red;'>" + disDay + "</b>" + cntTxt + "</td>";	// 토요일
					}else {
						html += "<td id='"+dayCssId+"' "+dayStyle+"><b style='color:blue;'>" + disDay + "</b>" + cntTxt + "</td>";	// 토요일
					}
					
					html += "</tr><tr>";
					trNum++;
					chk = 0;
				}else if(chk == 1){
					
					html += "<td id='"+dayCssId+"' "+dayStyle+"><b style='color:red;'>" + disDay + "</b>" + cntTxt + "</td>";	// 일요일
					
				}else{
					
					if(holidayChk.equals("Y")) { // 주중인데 공휴일일 경우
						html += "<td id='"+dayCssId+"' "+dayStyle+"><b style='color:red;'>" + disDay + "</b>" + cntTxt + "</td>";
					}else {
						html += "<td id='"+dayCssId+"' "+dayStyle+"><b>" + disDay + "</b>" + cntTxt + "</td>";	
					}
					
				}
				
				//console.log(trNum);
				/* * */
			}
			
		}
		
		// 다음달 1일부터 채우기
		for(int j = 1; j <= ((trNum * 7) - dayEnd); j++){
			html += "<td id='"+(nextDate + '0' + j)+"'>"+j+"</td>";
		}
		/**/
		html += "</tr>";
		
        response.getWriter().print("{"
        	//	+ "\"startDate\":\""+start+
			//	"\", \"endDate\":\""+end+
			//	"\", \"dayOfWeekNumber\":\""+dayOfWeekNumber+
				  + "\"curYear\":\""+year+
				"\", \"curMonth\":\""+month+
				"\", \"nextDate\":\""+nextDate+
				"\", \"beforeDate\":\""+curDay.atEndOfMonth().toString().replace("-", "")+
				"\", \"html\":\""+html+
				"\"}");
        
	}
}
