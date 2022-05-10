package egovframework.study.java;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.service.SampleDefaultVO;

@Controller
public class StudyJavaController {
	
	@RequestMapping(value = "/study/java/{id}.do")
	public String firstJavaApp(@PathVariable String id, ModelMap model) throws Exception {
		
		return "/study/java/"+ id;  
	}

}
