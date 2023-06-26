package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.SampleDefaultVO;

@Controller
public class ChartSampleController {

	@RequestMapping(value = "/chartSample.do")
	public String chartSample(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		return "admin/chart/chartSample";
	}
}
