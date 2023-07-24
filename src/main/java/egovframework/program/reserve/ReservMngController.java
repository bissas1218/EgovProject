package egovframework.program.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservMngController {

	@RequestMapping(value="/reservMng.do")
	public String reserMng() throws Exception {
		return "admin/reserv/reservMng";
	}
}
