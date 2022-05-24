package egovframework.common.web;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileUploadController {

	@RequestMapping(value = "/ckImgUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView ckImgUpload(ModelMap model, MultipartRequest request, HttpSession session) throws Exception {
		System.out.println("=====>ckImgUpload.do");
		MultipartFile uploadFile = request.getFile("upload");System.out.println("=====>1");
		String uploadDir = session.getServletContext().getRealPath("/").replace("\\", "/") + "images/upload/";System.out.println("=====>2");
		//String uploadDir = "D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\EgovProject\\images\\upload\\";
		String uploadId = UUID.randomUUID().toString() + "." + uploadFile.getOriginalFilename();System.out.println("=====>:"+uploadDir + uploadId);
		//String uploadId = "test" + "." + uploadFile.getOriginalFilename();
		uploadFile.transferTo(new File(uploadDir + uploadId));
		System.out.println("=====>4");
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("url", "/images/upload/" + uploadId);
	//	Thread.sleep(10000);
		return mav;
	}
	
	
	//@PostMapping("/ckImgUpload.do")
	@RequestMapping(value = "/ckImgUpload2.do", method=RequestMethod.POST) 
	@ResponseBody
	public ModelAndView uploadImage(@RequestParam Map<String, Object> paramMap) throws Exception
	{
		System.out.println("=====>ckImgUpload2.do");
		//MultipartFile uploadFile = request.getFile("upload");
		String uploadDir = "D:\\"; //servletContext.getRealPath("/").replace("\\", "/") + "/static/upload/images/";
		//String uploadId = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(uploadFile.getOriginalFilename());
		//String uploadId = "test" + "." + uploadFile.getOriginalFilename();
		//uploadFile.transferTo(new File(uploadDir + uploadId));
		//paramMap.put("url", "/images/doyun.png");
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("url", "/images/doyun.png");
		return mav;
	}
	
	@RequestMapping(value = "/ckImgUpload3.do", method=RequestMethod.POST) 
	public void uploadImage2() throws Exception
	{
		System.out.println("=====>ckImgUpload3.do");
	}
}
