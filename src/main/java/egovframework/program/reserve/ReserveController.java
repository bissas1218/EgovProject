package egovframework.program.reserve;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReserveController {

	@RequestMapping(value = "/reserv.do")
	public String reservPage(Model model) throws Exception {
		System.out.println("---reser.do-----");
		YearMonth today = YearMonth.now();
		
		System.out.println("today:"+today.getMonthValue());
		model.addAttribute("year", today.getYear());
		model.addAttribute("month", today.getMonthValue());
		
		return "user/reserv/reserv";
	}
	
	@RequestMapping(value = "/selectMonth.do", method=RequestMethod.GET)
	public void ajaxJsonListTest(@RequestParam("year") int year, @RequestParam("month") int month, HttpServletResponse response) {
		System.out.println("ajaxJsonTest month:"+month+", year:"+year);
		
		YearMonth today = YearMonth.of(year, month);// .now();
		System.out.println("today:"+today);
		LocalDate start = today.atDay(1);
		LocalDate end = today.atEndOfMonth();
		System.out.println("start:"+start+", end:"+end);
		
		 // 1. LocalDate 생성
        LocalDate date = LocalDate.of(year, month, 1);
        // LocalDateTime date = LocalDateTime.of(2021, 12, 25, 1, 15, 20);
        System.out.println(date);  // 
 
        // 2. DayOfWeek 객체 구하기
        DayOfWeek dayOfWeek = date.getDayOfWeek();
 
        // 3. 숫자 요일 구하기
        int dayOfWeekNumber = dayOfWeek.getValue();
 
        // 4. 숫자 요일 출력
        System.out.println(dayOfWeekNumber);  // 6
        
		try {
			response.getWriter().print("{\"startDate\":\""+start+
					"\", \"endDate\":\""+end+
					"\", \"dayOfWeekNumber\":\""+dayOfWeekNumber+
					"\", \"curYear\":\""+year+
					"\", \"curMonth\":\""+month+
					"\"}");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
