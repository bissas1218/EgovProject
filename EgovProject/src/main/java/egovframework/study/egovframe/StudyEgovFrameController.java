package egovframework.study.egovframe;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudyEgovFrameController {

	@RequestMapping(value = "/study/egov/intro.do")
	public String firstJavaApp(ModelMap model) throws Exception {
		return "/study/egov/intro";  
	}
}
