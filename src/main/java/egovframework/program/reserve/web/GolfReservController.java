package egovframework.program.reserve.web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Calendar;
import java.util.Date;
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
import egovframework.program.reserve.service.GolfSettingVO;

@Controller
public class GolfReservController {

	@Resource(name="scheduleMngService")
	private ScheduleMngService scheduleMngService;
	
	@Resource(name="golfReservService")
	private GolfReservService golfReservService;
	
	@RequestMapping(value="/golfReservList.do")
	public String golfReservList(Model model) throws Exception {
		
		YearMonth today = YearMonth.now();
		
		//System.out.println("today:"+today);
		model.addAttribute("year", today.getYear());
		model.addAttribute("month", today.getMonthValue());
		
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance( );
        //System.out.println(df.format(cal.getTime()));
        
		model.addAttribute("today", df.format(cal.getTime()));
		
		/* 골프설정값 조회 */
		GolfSettingVO golfSettingVO = golfReservService.selectGolfSetting();
		model.addAttribute("golfSetting", golfSettingVO);
		
		return "admin/reserv/golf/golfReservList";
	}
	
	@RequestMapping(value="/golfReservMng.do")
	public String golfReservMng(Model model) throws Exception {
		
		YearMonth today = YearMonth.now();
		
		//System.out.println("today:"+today);
		model.addAttribute("year", today.getYear());
		model.addAttribute("month", today.getMonthValue());
		
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance( );
        //System.out.println(df.format(cal.getTime()));
        
		model.addAttribute("today", df.format(cal.getTime()));
		
		/* 골프설정값 조회 */
		GolfSettingVO golfSettingVO = golfReservService.selectGolfSetting();
		model.addAttribute("golfSetting", golfSettingVO);
		
		return "admin/reserv/golf/golfReservMng";
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/selectGolfReservMonth.do", method=RequestMethod.GET)
	public void ajaxJsonListTest(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("type") String type, HttpServletResponse response) throws Exception {
		//System.out.println("ajaxJsonTest month:"+month+", year:"+year);
		//System.out.println("type:"+type);
		
		YearMonth curMonth = YearMonth.of(year, month);// .now();
		
		//System.out.println("curMonth:"+curMonth);
		//LocalDate start = curMonth.atDay(1);
		LocalDate end = curMonth.atEndOfMonth();
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
     //   DateFormat df2 = new SimpleDateFormat("dd");
        Calendar cal = Calendar.getInstance( );
      //  String curDay = df2.format(cal.getTime());
        //System.out.println("curDay:"+curDay);
        
        cal.set(year, month, 0);
        cal.add ( cal.MONTH, + 1 ); //다음달
        
        String nextDate = df.format(cal.getTime());
        
        cal.set(year, month, 0);
        
        cal.add ( cal.MONTH, -1 ); //이전달
        String beforeDate = df.format(cal.getTime());
        curMonth = YearMonth.of(Integer.parseInt(beforeDate.substring(0,4)), Integer.parseInt(beforeDate.substring(4,6)));// .now();
		//System.out.println("curMonth:"+curMonth);
		
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
		
		int beforeMonthDay = Integer.parseInt( curMonth.atEndOfMonth().toString().replace("-", "").substring(6,8) ) - dayOfWeekNumber2; //Number(result.beforeDate.substr(6,2)) - dayOfWeekNumber; 
		int chk = 0;
		
		// 골프예약목록조회
		GolfReservVO golfReservVO = new GolfReservVO();
		golfReservVO.setSrtDate(end.toString().replaceAll("-", "").substring(0,6)+"01");
		golfReservVO.setEndDate(end.toString().replaceAll("-", ""));
		List<GolfReservVO> cntList = golfReservService.selectGolfReservListCnt(golfReservVO); // scheduleMngService.selectScheduleListCnt(scheduleVO);
		
		// 전월, 현재월, 다음월 날짜 그리기
		for(int i = 1; i <= dayEnd; i++){
				
		//	System.out.println("i:"+i+", curDay:"+curDay+", dayEnd:"+dayEnd);
			
			chk++;
			
			// 이전월 날짜 채우기
			if(i <= dayOfWeekNumber2){
				html += "<td id='" + curMonth.atEndOfMonth().toString().replace("-", "").substring(0,6) + (beforeMonthDay+i)+ "'>" + (beforeMonthDay+i) + "</td>";	
				
			}else{ // 현재월 날짜 출력
				
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
				
				// 현재날짜 비교
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");  
				Calendar cal2 = Calendar.getInstance( );
		        Date curDate = formatter.parse(formatter.format(cal2.getTime()));        
		        Date selDate = formatter.parse(dayCssId); 
				
		     //   System.out.println("curDate:"+formatter.format(cal2.getTime())+", day:"+dayCssId);
		     //   System.out.println( curDate.after(selDate) );
		        
				// 날짜별 예약가능 건수입력
				for(int k=0; k < cntList.size(); k++) {
					
					if(cntList.get(k).getDate().equals(dayCssId)) {// && i >= curDay) {
						
						// 사용자일경우 오늘 이후예약만 표시
						if(type.equals("user") && !curDate.after(selDate)) {
//							System.out.println(cntList.get(k).getHoliDayYn());
							dayStyle = "style='background:#e6e7ff;'";
							cnt = cntList.get(k).getCnt();
							if(cntList.get(k).getHoliDayYn().equals("Y")) {
								holidayChk = "Y";
							}
							
						// 관리자일 경우 전체표시
						}else if(type.equals("admin")) {
							dayStyle = "style='background:#e6e7ff;'";
							cnt = cntList.get(k).getCnt();
							if(cntList.get(k).getHoliDayYn().equals("Y")) {
								holidayChk = "Y";
							}
						}
					
					}
				}
				
				// 현재월 날짜 그리기
				String cntTxt = "";
				if(!cnt.equals("")) {
					
					// 사용자일경우 오늘 이후예약만 표시
					if(type.equals("user") && !curDate.after(selDate)) {
						cntTxt = " ("+cnt+")";
					// 관리자일 경우 전체표시
					}else if(type.equals("admin")) {
						cntTxt = " ("+cnt+")";
					}
					
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
				"\", \"beforeDate\":\""+curMonth.atEndOfMonth().toString().replace("-", "")+
				"\", \"html\":\""+html+
				"\"}");
        
	}
	
	@RequestMapping(value="/insertGolfReserv.do", method=RequestMethod.POST)
	public void insertGolfReserv(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println("reserv_array:"+request.getParameter("reserv_array"));
		String[] arr = request.getParameter("reserv_array").split(",");
		//System.out.println("reserv_array:"+arr);
		
		
	//	int totalReservCnt = Integer.parseInt( request.getParameter("total_reserv_cnt"));
		
		GolfReservVO vo = new GolfReservVO();
		vo.setDate(request.getParameter("reserv_date"));
		
		// 코스저장
		if(!request.getParameter("golf_course").equals("Non")) {
			vo.setCourse(request.getParameter("golf_course"));
		};
		
		// 부저장
		if(!request.getParameter("part").equals("Non")) {
			vo.setPart(request.getParameter("part"));
		}
		
		// 공휴일여부 저장
		vo.setHoliDayYn(request.getParameter("holiday_yn"));
		if(!request.getParameter("member_type").equals("Non")) {
			vo.setMemberType(request.getParameter("member_type"));
		}
		/*
		for(int i=1; i<totalReservCnt; i++) {
			
		//	System.out.println(request.getParameter("reserv_date")+" "+request.getParameter("golf_course")+" "+request.getParameter("reservTime_"+i));
			
			vo.setTime(request.getParameter("reservTime_"+i));
			vo.setHole(request.getParameter("hole_"+i));
			vo.setCaddy(request.getParameter("caddy_"+i));
			vo.setPerson(request.getParameter("person_"+i));
			vo.setGreenFee(request.getParameter("green_fee_"+i).replace(",",""));
			
			if(request.getParameter("golf_course").equals("Non")) {
				vo.setCourse(request.getParameter("golf_course_"+i));
			};
			if(request.getParameter("part").equals("Non")) {
				vo.setPart(request.getParameter("part_"+i));
			};
			if(request.getParameter("member_type").equals("Non")) {
				vo.setMemberType(request.getParameter("member_type_"+i));
			};
			System.out.println("=====>"+vo);
			golfReservService.insertGolfReserv(vo);
		}
		*/
		for(int i=0; i<arr.length; i++) {
			System.out.println(arr[i]);
			vo.setTime(request.getParameter("reservTime_"+arr[i]));
			vo.setHole(request.getParameter("hole_"+arr[i]));
			vo.setCaddy(request.getParameter("caddy_"+arr[i]));
			vo.setPerson(request.getParameter("person_"+arr[i]));
			vo.setGreenFee(request.getParameter("green_fee_"+arr[i]).replace(",",""));
			
			if(request.getParameter("golf_course").equals("Non")) {
				vo.setCourse(request.getParameter("golf_course_"+arr[i]));
			};
			if(request.getParameter("part").equals("Non")) {
				vo.setPart(request.getParameter("part_"+arr[i]));
			};
			if(request.getParameter("member_type").equals("Non")) {
				vo.setMemberType(request.getParameter("member_type_"+arr[i]));
			};
		//	System.out.println("=====>"+vo);
			golfReservService.insertGolfReserv(vo);
		}
		response.getWriter().print("[{status:success}]");
	}
	
	@RequestMapping(value="/selectGolfReservList.do", method=RequestMethod.GET)
	public void selectGolfReservList(GolfReservVO golfReservVO, HttpServletResponse response) throws Exception {
		
		System.out.println("date:"+golfReservVO.getDate());
		
		response.setCharacterEncoding("utf-8");
		
		List<GolfReservVO> list = golfReservService.selectGolfReservList(golfReservVO);
		String reservArr = "[";
		for(int i=0; i<list.size(); i++) {
			
			reservArr += "{"+
					"\"date\":\""+list.get(i).getDate()+
					"\", \"course\":\""+list.get(i).getCourse()+
					"\", \"courseNm\":\""+list.get(i).getCourseNm()+
					"\", \"time\":\""+list.get(i).getTime()+
					"\", \"hole\":\""+list.get(i).getHole()+
					"\", \"caddy\":\""+list.get(i).getCaddy()+
					"\", \"person\":\""+list.get(i).getPerson()+
					"\", \"greenFee\":\""+list.get(i).getGreenFee()+
					"\", \"part\":\""+list.get(i).getPart()+
					"\", \"holiDayYn\":\""+list.get(i).getHoliDayYn()+
					"\", \"cnt\":\""+list.get(i).getCnt()+
					"\", \"srtDate\":\""+list.get(i).getSrtDate()+
					"\", \"endDate\":\""+list.get(i).getEndDate()+
					"\", \"memberType\":\""+list.get(i).getMemberType()+
					"\", \"reservId\":\""+list.get(i).getReservId()+
					"\", \"reservDate\":\""+list.get(i).getReservDate()+
					"\"}";
			
			if(i<(list.size()-1)) {
				reservArr += ",";
			}
			
		}
		reservArr += "]";
		
		//System.out.println("reservArr:"+reservArr);
		
		response.getWriter().print(reservArr);
		
	}
	
	@RequestMapping(value="/selectCreateGolfReservList.do", method=RequestMethod.GET)
	public void selectCreateGolfReservList(GolfReservVO golfReservVO, HttpServletResponse response) throws Exception {
		
		//System.out.println("date:"+golfReservVO.getDate());
		
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
			html += "<td style='background-color:#fffea6;'><input type='text' name='reservTime_"+(i+1)+"' id='reservTime_"+(i+1)+"' value='"+list.get(i).getTime()+"'/></td>"+
				    "<td style='background-color:#fffea6;'><input type='text' name='hole_"+(i+1)+"' id='hole_"+(i+1)+"' value='"+list.get(i).getHole()+"' /></td>"+
				    "<td style='background-color:#fffea6;'><select name='caddy_"+(i+1)+"' id='caddy_"+(i+1)+"'>"+
				    	"<option value='Y' "+caddy_y+">캐디</option><option value='N' "+caddy_n+">노캐디</option>"+
				    	"</select></td>"+
				    "<td style='background-color:#fffea6;'><input type='text' name='person_"+(i+1)+"' id='person_"+(i+1)+"' value='"+list.get(i).getPerson()+"' /></td>"+
				    "<td style='background-color:#fffea6;'><input type='text' name='green_fee_"+(i+1)+"' id='green_fee_"+(i+1)+"' value='"+list.get(i).getGreenFee()+"'/></td>";
				    
			html += "</tr>";
		}
		
		response.setCharacterEncoding("utf-8");
		
		response.getWriter().print("{"+
				"\"html\":\""+html+
				"\"}");
	}
	
	@RequestMapping(value="/selectCreateGolfReservList2.do", method=RequestMethod.GET)
	public void selectCreateGolfReservList2(GolfReservVO golfReservVO, HttpServletResponse response) throws Exception {
		
		//System.out.println("date:"+golfReservVO.getDate());
		
		List<GolfReservVO> list = golfReservService.selectGolfReservList(golfReservVO);
		
		
		response.setCharacterEncoding("utf-8");
		
		String arr = "[";
		for(int i=0; i<list.size(); i++) {
			arr += "{"+
					"\"date\":\""+list.get(i).getDate()+"\""+
					",\"course\":\""+list.get(i).getCourse()+"\""+
					",\"courseNm\":\""+list.get(i).getCourseNm()+"\""+
					",\"time\":\""+list.get(i).getTime()+"\""+
					",\"hole\":\""+list.get(i).getHole()+"\""+
					",\"caddy\":\""+list.get(i).getCaddy()+"\""+
					",\"person\":\""+list.get(i).getPerson()+"\""+
					",\"greenFee\":\""+list.get(i).getGreenFee()+"\""+
					",\"part\":\""+list.get(i).getPart()+"\""+
					",\"holidayYn\":\""+list.get(i).getHoliDayYn()+"\""+
					",\"memberType\":\""+list.get(i).getMemberType()+"\""+
					"}";
			if(list.size()-1 > i) {
				arr += ",";
			}
			//response.getWriter().print("[{\"id\":\"returnId1\", \"nm\":\"returnNm1\"}, {\"id\":\"returnId2\", \"nm\":\"returnNm2\"}]");
		}
		arr += "]";
		
		response.getWriter().print(arr);
		
		//System.out.println("==>"+arr);
				
	}
	
	@RequestMapping(value="/selectUserGolfReservList.do", method=RequestMethod.GET)
	public void selectUserGolfReservList(GolfReservVO golfReservVO, HttpServletResponse response) throws Exception {
		
		//System.out.println("date:"+golfReservVO.getDate());
		golfReservVO.setUserType("user");
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
			html += "<td>"+list.get(i).getCourseNm()+"</td>"+
					//"<td style='display:none;'>"+list.get(i).getCourse()+"</td>"+
					"<td>"+list.get(i).getTime()+"</td>"+
				    "<td>"+list.get(i).getHole()+"</td>"+
				    "<td>"+caddy_yn+"</td>"+
				    "<td>"+list.get(i).getPerson()+"</td>"+
				    "<td>"+list.get(i).getGreenFee()+"</td>"+
				    "<td><a href=\'javascript:fn_user_reserv(\""+list.get(i).getTime()+"\", \""+list.get(i).getCourse()+"\", \""+list.get(i).getCourseNm()+"\");\'>예약</a></td>"
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
	
	@RequestMapping(value="/golfSettingSave.do", method=RequestMethod.POST)
	public void golfSettingSave(GolfSettingVO golfSettingVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//System.out.println(golfSettingVO);
		
		int result = golfReservService.updateGolfSetting(golfSettingVO);
		//System.out.println(result);
		String txt = "";
		if(result == 1) {
			txt = "설정값이 저장되었습니다!";
		}else {
			txt = "설정값 저장중 에러가 발생하였습니다!";
		}
		response.setContentType("text/html; charset=utf-8"); // 응답하는 컨텐츠 타입 선택
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("<html><script>alert('"+txt+"');window.location.href='/golfReservList.do';</script></html>");
		
		//return "redirect:/golfReservList.do";
	}
	
	@RequestMapping(value = "/golfReserv.do")
	public String userReservPage(Model model) throws Exception {
		//System.out.println("---reser.do-----");
		YearMonth today = YearMonth.now();
		
		//System.out.println("today:"+today);
		model.addAttribute("year", today.getYear());
		model.addAttribute("month", today.getMonthValue());
		
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance( );
        //System.out.println(df.format(cal.getTime()));
        
		model.addAttribute("today", df.format(cal.getTime()));
		
		GolfSettingVO golfSettingVO = golfReservService.selectGolfSetting();
		model.addAttribute("golfSetting", golfSettingVO);
		
		return "user/reserv/golf/reserv";
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/selectMonth.do", method=RequestMethod.GET)
	public void selectMonth(@RequestParam("year") int year, @RequestParam("month") int month, HttpServletResponse response) {
		//System.out.println("ajaxJsonTest month:"+month+", year:"+year);
		
		YearMonth curMonth = YearMonth.of(year, month);// .now();
		//System.out.println("curMonth:"+curMonth);
		LocalDate start = curMonth.atDay(1);
		LocalDate end = curMonth.atEndOfMonth();
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
        curMonth = YearMonth.of(Integer.parseInt(beforeDate.substring(0,4)), Integer.parseInt(beforeDate.substring(4,6)));// .now();
		//System.out.println("curMonth:"+curMonth);
		//LocalDate start = curMonth.atDay(1);
		//curMonth.atEndOfMonth();
		
        YearMonth.now();
		
		try {
			response.getWriter().print("{\"startDate\":\""+start+
					"\", \"endDate\":\""+end+
					"\", \"dayOfWeekNumber\":\""+dayOfWeekNumber+
					"\", \"curYear\":\""+year+
					"\", \"curMonth\":\""+month+
					"\", \"nextDate\":\""+nextDate+
					"\", \"beforeDate\":\""+curMonth.atEndOfMonth().toString().replace("-", "")+
					"\"}");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/updateGolfReserv.do", method = RequestMethod.POST)
	public void updateGolfReserv(GolfReservVO golfReservVO, HttpServletResponse response) throws Exception {
		//System.out.println("date time:"+golfReservVO.getDate()+", "+golfReservVO.getCourse()+", "+golfReservVO.getTime()+"->"+golfReservVO.getUpdateTime());
		
		String txt = "";
		
		/* 예약시간 변경 유무 */
		if(golfReservVO.getTime().equals(golfReservVO.getUpdateTime())) {	// 예약시간 미변경
			
			int result = golfReservService.updateGolfReserv(golfReservVO);
		//	System.out.println("result:"+result);
			txt = "예약정보를 수정하였습니다.";
		
		}else { // 예약시간 변경
			
			/* 중복된 예약시간이 존재하는지 확인 */
			int cnt = golfReservService.selectGolfReservTime(golfReservVO);
			//System.out.println("cnt:"+cnt);
			if(cnt > 0) {
				txt = "중복된 예약시간이 존재합니다.";
			}else {
				int result = golfReservService.updateGolfReserv(golfReservVO);
			//	System.out.println("result:"+result);
				if(result == 1) {
					txt = "예약정보를 수정하였습니다.";	
				}else {
					txt = "예약정보 수정중 에러가 발생하였습니다.";
				}
				
			}
		}
		
		response.setCharacterEncoding("utf-8");
		
		response.getWriter().print(txt);
	}
	
	@RequestMapping(value="/deleteGolfReserv.do", method = RequestMethod.POST)
	public void deleteGolfReserv(GolfReservVO golfReservVO, HttpServletResponse response) throws Exception {
		//System.out.println("date time:"+golfReservVO.getDate()+", "+golfReservVO.getCourse()+", "+golfReservVO.getTime()+"->"+golfReservVO.getUpdateTime());
		
		String txt = "";
		
		int result = golfReservService.deleteGolfReserv(golfReservVO);
		System.out.println("delete result:"+result);
		//txt = result;//"예약정보를 수정하였습니다.";
		if(result == 1) {
			txt = "예약을 삭제하였습니다.";
		}else {
			txt = "예약삭제중 에러가 발생하였습니다.";
		}
		
		response.setCharacterEncoding("utf-8");
		
		response.getWriter().print(txt);
	}
	
	@RequestMapping(value="/userReservSave.do", method=RequestMethod.POST)
	public void userReservUpdate(GolfReservVO golfReservVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(golfReservVO.getDate()+", "+request.getSession().getAttribute("userId"));
		String result = "";
		
		if(request.getSession().getAttribute("userId") != null && !request.getSession().getAttribute("userId").equals("")) {
			golfReservVO.setReservId(request.getSession().getAttribute("userId").toString());
			golfReservService.userReservUpdate(golfReservVO);
			result = "success";
		}else {
			result = "error-1";
		}
		
		response.getWriter().print(result);
	}
}
