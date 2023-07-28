package egovframework.program.reserve.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.service.ScheduleMngService;
import egovframework.example.sample.service.ScheduleVO;
import egovframework.program.reserve.service.GolfReservService;
import egovframework.program.reserve.service.GolfReservVO;

@Controller
public class GolfReservController {

	@Resource(name="scheduleMngService")
	private ScheduleMngService scheduleMngService;
	
	@Resource(name="golfReservService")
	private GolfReservService golfReservService;
	
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
		//ScheduleVO scheduleVO = new ScheduleVO();
		//scheduleVO.setSrtDate(end.toString().replaceAll("-", "").substring(0,6)+"01");
		//scheduleVO.setEndDate(end.toString().replaceAll("-", ""));
		
		GolfReservVO golfReservVO = new GolfReservVO();
		golfReservVO.setSrtDate(end.toString().replaceAll("-", "").substring(0,6)+"01");
		golfReservVO.setEndDate(end.toString().replaceAll("-", ""));
		List<GolfReservVO> cntList = golfReservService.selectGolfReservListCnt(golfReservVO); // scheduleMngService.selectScheduleListCnt(scheduleVO);
		
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
					
					if(cntList.get(k).getDate().equals(dayCssId)) {
					//	System.out.println(cntList.get(k).getHoliDayYn());
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
				  + "\"curYear\":\""+year+
				"\", \"curMonth\":\""+month+
				"\", \"nextDate\":\""+nextDate+
				"\", \"beforeDate\":\""+curDay.atEndOfMonth().toString().replace("-", "")+
				"\", \"html\":\""+html+
				"\"}");
        
	}
	
	@RequestMapping(value="/insertGolfReserv.do", method=RequestMethod.POST)
	public void insertGolfReserv(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int totalReservCnt = Integer.parseInt( request.getParameter("total_reserv_cnt"));
		
		GolfReservVO vo = new GolfReservVO();
		vo.setDate(request.getParameter("reserv_date"));
		vo.setCourse(request.getParameter("golf_course"));
		vo.setPart(request.getParameter("part"));
		vo.setHoliDayYn(request.getParameter("holiday_yn"));
		vo.setMemberType(request.getParameter("member_type"));
		
		for(int i=1; i<totalReservCnt; i++) {
			
		//	System.out.println(request.getParameter("reserv_date")+" "+request.getParameter("golf_course")+" "+request.getParameter("reservTime_"+i));
			
			vo.setTime(request.getParameter("reservTime_"+i));
			vo.setHole(request.getParameter("hole_"+i));
			vo.setCaddy(request.getParameter("caddy_"+i));
			vo.setPerson(request.getParameter("person_"+i));
			vo.setGreenFee(request.getParameter("green_fee_"+i).replace(",",""));
			
			golfReservService.insertGolfReserv(vo);
		}
		
		response.getWriter().print("[{status:success}]");
	}
	
	@RequestMapping(value="/selectGolfReservList.do", method=RequestMethod.GET)
	public void selectGolfReservList(GolfReservVO golfReservVO, HttpServletResponse response) throws Exception {
		
		System.out.println("date:"+golfReservVO.getDate());
		
		List<GolfReservVO> list = golfReservService.selectGolfReservList(golfReservVO);
		String html = "";
		for(int i=0; i<list.size(); i++) {
			//System.out.println(list.get(i).getTime());
			String caddy_y = "";
			String caddy_n = "";
			if(list.get(i).getCaddy().equals("Y")) {
				caddy_y = "selected";
			}else {
				caddy_n = "selected";
			}
			html += "<tr>";
			html += "<td><input type='text' name='reservTime_"+(i+1)+"' id='reservTime_"+(i+1)+"' value='"+list.get(i).getTime()+"'/></td>"+
				    "<td><input type='text' name='hole_"+(i+1)+"' id='hole_"+(i+1)+"' value='"+list.get(i).getHole()+"' /></td>"+
				    "<td><select name='caddy_"+(i+1)+"' id='caddy_"+(i+1)+"'>"+
				    	"<option value='Y' "+caddy_y+">캐디</option><option value='N' "+caddy_n+">노캐디</option>"+
				    	"</select></td>"+
				    "<td><input type='text' name='person_"+(i+1)+"' id='person_"+(i+1)+"' value='"+list.get(i).getPerson()+"' /></td>"+
				    "<td><input type='text' name='green_fee_"+(i+1)+"' id='green_fee_"+(i+1)+"' value='"+list.get(i).getGreenFee()+"'/></td>";
				    
			html += "</tr>";
		}
		
		response.setCharacterEncoding("utf-8");
		
		response.getWriter().print("{"+
				"\"html\":\""+html+
				"\"}");
	}
	
	@RequestMapping(value="/selectUserGolfReservList.do", method=RequestMethod.GET)
	public void selectUserGolfReservList(GolfReservVO golfReservVO, HttpServletResponse response) throws Exception {
		
		System.out.println("date:"+golfReservVO.getDate());
		
		List<GolfReservVO> list = golfReservService.selectGolfReservList(golfReservVO);
		String html = "";
		for(int i=0; i<list.size(); i++) {
			//System.out.println(list.get(i).getTime());
			String caddy_yn = "";
			if(list.get(i).getCaddy().equals("Y")) {
				caddy_yn = "캐디";
			}else {
				caddy_yn = "노캐디";
			}
			html += "<tr>";
			html += "<td>"+list.get(i).getCourse()+"</td>"+
					"<td>"+list.get(i).getTime()+"</td>"+
				    "<td>"+list.get(i).getHole()+"</td>"+
				    "<td>"+caddy_yn+"</td>"+
				    "<td>"+list.get(i).getPerson()+"</td>"+
				    "<td>"+list.get(i).getGreenFee()+"</td>"+
				    "<td><a href=\'javascript:fn_user_reserv(\""+list.get(i).getTime()+"\");\'>예약</a></td>"
				    ;
				    
			html += "</tr>";
		}
		
		response.setContentType("text/html; charset=utf-8"); // 응답하는 컨텐츠 타입 선택
		response.setCharacterEncoding("utf-8");
		
		System.out.println(html);
		/*
		response.getWriter().print("{"+
				"\"html\":\""+html+
				"\"}");*/
		response.getWriter().print(html);
	}
}
