package egovframework.example.sample.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.ContentsService;
import egovframework.example.sample.service.MenuVO;
import egovframework.example.sample.service.ContentsVO;
import egovframework.example.sample.service.SampleDefaultVO;

@Controller
public class ContentsController {

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "contentsService")
	private ContentsService contentsService;
	
	@RequestMapping(value = "/contentsMng.do", method = RequestMethod.GET)
	public String contentsMng(@ModelAttribute("contentsVO") ContentsVO contentsVO, ModelMap model) throws Exception {
		model.addAttribute("contentsVO", contentsVO);
		return "admin/contents/contentsMng";
	}
	
	@RequestMapping(value="/selectContentsList.do")
	public void selectContentsList(@ModelAttribute("searchVO") SampleDefaultVO searchVO,	ModelMap model, HttpServletResponse response) throws Exception {
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<ContentsVO> contentsList = contentsService.selectContentsList(searchVO);
		
		int totCnt = contentsService.selectContentsListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		try {
			String resStr = "[";
			for(int i=0; i<contentsList.size(); i++) {
			//	System.out.println(menuList.get(i).getMenuId());
				resStr += "{\"contentsId\":\""+contentsList.get(i).getContentsId()+"\", \"contentsNm\":\""+contentsList.get(i).getContentsNm()+
						"\", \"regDate\":\""+contentsList.get(i).getRegDate()+
						"\"}";
				
				if(i != (contentsList.size()-1)) {
					resStr += ",";
				}
				
			}
			
			if(contentsList.size() > 0) {
				resStr += ",{\"totalRecordCount\":\""+paginationInfo.getTotalRecordCount()+"\", "
						+ "\"currentPageNo\":\""+paginationInfo.getCurrentPageNo()+"\", "
						+ "\"recordCountPerPage\":\""+paginationInfo.getRecordCountPerPage()+"\", "
						+ "\"firstPageNoOnPageList\":\""+paginationInfo.getFirstPageNoOnPageList()+"\", "
						+ "\"lastPageNoOnPageList\":\""+paginationInfo.getLastPageNoOnPageList()+"\", "
						+ "\"totalPageCount\":\""+paginationInfo.getTotalPageCount()+"\","
						+ "\"pageSize\":\""+paginationInfo.getPageSize()+"\"}";
			}
			resStr += "]";
			System.out.println("resStr:"+resStr);
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(resStr); 
			//response.getWriter().print("[{\"id\":\"returnId1\", \"nm\":\"returnNm1\"}, {\"id\":\"returnId2\", \"nm\":\"returnNm2\"}]");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/insertContents.do", method = RequestMethod.POST)
	public String insertContents(@ModelAttribute("contentsVO") ContentsVO contentsVO) throws Exception {
		System.out.println("===> "+contentsVO.getContentsText());
		
		// 신규컨텐츠id 생성
		String newContentsId = contentsService.selectNewContentsId();
		switch (newContentsId.length()) {
		case 1:
			newContentsId = "C-000000" + newContentsId;
			break;
		case 2:
			newContentsId = "C-00000" + newContentsId;
			break;
		case 3:
			newContentsId = "C-0000" + newContentsId;
			break;
		case 4:
			newContentsId = "C-000" + newContentsId;
			break;
		case 5:
			newContentsId = "C-00" + newContentsId;
			break;
		case 6:
			newContentsId = "C-0" + newContentsId;
			break;
		case 7:
			newContentsId = "C-" + newContentsId;
			break;
		default:
			break;
		}
		System.out.println("newContentsId:"+newContentsId);
		
		contentsVO.setContentsId(newContentsId);
		
		String result = contentsService.insertContents(contentsVO);
		System.out.println("result:"+result);
		
		return "redirect:/contentsMng.do";
	}
}
