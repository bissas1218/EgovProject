package egovframework.example.sample.web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.service.ScheduleMngService;
import egovframework.example.sample.service.ScheduleVO;

@Controller
public class ScheduleMngController {

	@Resource(name="scheduleMngService")
	private ScheduleMngService scheduleMngService;
	
	@RequestMapping(value="/scheduleMng.do")
	public String scheduleMng(Model model) throws Exception {
		
		YearMonth today = YearMonth.now();
		
		//System.out.println("today:"+today);
		model.addAttribute("year", today.getYear());
		model.addAttribute("month", today.getMonthValue());
		
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance( );
        //System.out.println(df.format(cal.getTime()));
        
		model.addAttribute("today", df.format(cal.getTime()));
		
		return "admin/schedule";
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/selectScheduleMonth.do", method=RequestMethod.GET)
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
        //System.out.println("before date:"+Integer.parseInt(beforeDate.substring(0,4)));
        //System.out.println("before date:"+Integer.parseInt(beforeDate.substring(4,6)));
        curDay = YearMonth.of(Integer.parseInt(beforeDate.substring(0,4)), Integer.parseInt(beforeDate.substring(4,6)));// .now();
		//System.out.println("curDay:"+curDay);
		//LocalDate start = curDay.atDay(1);
		//curDay.atEndOfMonth();
		
        YearMonth.now();
		
        response.setCharacterEncoding("UTF-8");
        /*
		response.getWriter().print("{\"startDate\":\""+start+
				"\", \"endDate\":\""+end+
				"\", \"dayOfWeekNumber\":\""+dayOfWeekNumber+
				"\", \"curYear\":\""+year+
				"\", \"curMonth\":\""+month+
				"\", \"nextDate\":\""+nextDate+
				"\", \"beforeDate\":\""+curDay.atEndOfMonth().toString().replace("-", "")+
				"\"}"); */
        String html = "";
        System.out.println("dayOfWeekNumber:"+dayOfWeekNumber);
        
        int dayOfWeekNumber2 = 0;
		if(dayOfWeekNumber != 7){
			dayOfWeekNumber2 = dayOfWeekNumber;	
		}
		
		System.out.println("dayOfWeekNumber2:"+dayOfWeekNumber2);
		
		html = "<tr>";
		System.out.println("end:"+end.toString().substring(8,10));
		
		int dayEnd = Integer.parseInt(end.toString().substring(8,10)) + dayOfWeekNumber2;// ) Number(result.endDate.substr(8,2)) + dayOfWeekNumber;
		System.out.println("dayEnd:"+dayEnd);
		
		int trNum = 1;
		
		//console.log( result );
		int beforeMonthDay = Integer.parseInt( curDay.atEndOfMonth().toString().replace("-", "").substring(6,8) ) - dayOfWeekNumber2; //Number(result.beforeDate.substr(6,2)) - dayOfWeekNumber; 
		int chk = 0;
		
		// 전월, 현재월, 다음월 날짜 그리기
		for(int i = 1; i <= dayEnd; i++){
			//	System.out.println("i:"+i);
				
			chk++;
			
			//console.log(i, ', '+i%7);
			if(i <= dayOfWeekNumber2){
				System.out.println("i:"+i);
				html += "<td id='" + curDay.atEndOfMonth().toString().replace("-", "").substring(0,6) + (beforeMonthDay+i)+ "'>" + (beforeMonthDay+i) + "</td>";	// 이전월 날짜 채우기
				
			}else{
				
				// css 날짜 id값 구하기
				int disDay = i-dayOfWeekNumber;
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
				
				// 현대월 날짜 그리기
				if(i % 7 == 0){
					html += "<td id='"+dayCssId+"'><b style='color:blue;'>" + disDay + "</b></td>";	// 토요일
					html += "</tr><tr>";
					trNum++;
					chk = 0;
				}else if(chk == 1){
					html += "<td id='"+dayCssId+"'><b style='color:red;'>" + disDay + "</b></td>";	// 일요일
				}else{
					html += "<td id='"+dayCssId+"'><b>" + disDay + "</b></td>";
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
		
        response.getWriter().print("{\"startDate\":\""+start+
				"\", \"endDate\":\""+end+
				"\", \"dayOfWeekNumber\":\""+dayOfWeekNumber+
				"\", \"curYear\":\""+year+
				"\", \"curMonth\":\""+month+
				"\", \"nextDate\":\""+nextDate+
				"\", \"beforeDate\":\""+curDay.atEndOfMonth().toString().replace("-", "")+
				"\", \"html\":\""+html+
				"\"}");
        
	}
	
	@RequestMapping(value="/updateSchedule.do", method=RequestMethod.POST)
	public void updateSchedule(ScheduleVO scheduleVO, //@RequestParam("sDate") String sDate, @RequestParam("title") String title,
			HttpServletResponse response) throws Exception {
		System.out.println("sDate:"+scheduleVO.getsDate());
		System.out.println("title:"+scheduleVO.getTitle());
		//response.setContentType("text/plain; charset=utf-8");
		//String test = new String(ServletRequestUtils.getStringParameter(request, "sDate", "").getBytes("8859_1"),"UTF-8");
		//System.out.println("==>"+test);
		scheduleMngService.insertSchedule(scheduleVO);
		
		List<ScheduleVO> list = scheduleMngService.selectScheduleList(scheduleVO.getsDate());
		
		String resStr = "[";
		for(int i=0; i<list.size(); i++) {
		//	System.out.println(menuList.get(i).getMenuId());
			resStr += "{\"id\":\""+list.get(i).getId()+
					"\", \"s_date\":\""+list.get(i).getsDate()+
					"\", \"title\":\""+list.get(i).getTitle()+
					"\"}";
			
			if(i != (list.size()-1)) {
				resStr += ",";
			}
			
		}
		resStr += "]";
		System.out.println("resStr:"+resStr);
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(resStr); 
	}
	
	@RequestMapping(value="/selectScheduleList.do")
	public void selectScheduleList(@RequestParam("sDate") String sDate, HttpServletResponse response) throws Exception {
		List<ScheduleVO> list = scheduleMngService.selectScheduleList(sDate);
		String resStr = "[";
		for(int i=0; i<list.size(); i++) {
		//	System.out.println(menuList.get(i).getMenuId());
			resStr += "{\"id\":\""+list.get(i).getId()+
					"\", \"s_date\":\""+list.get(i).getsDate()+
					"\", \"title\":\""+list.get(i).getTitle()+
					"\"}";
			
			if(i != (list.size()-1)) {
				resStr += ",";
			}
			
		}
		resStr += "]";
		System.out.println("resStr:"+resStr);
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(resStr);
	}
}
