package egovframework.user.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringEscapeUtils;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.NormalBoardVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.user.service.PhotoBoardVO;
import egovframework.user.service.UserBoardService;
import net.bramp.ffmpeg.FFmpeg;
import net.bramp.ffmpeg.FFprobe;
import net.bramp.ffmpeg.probe.FFmpegProbeResult;

@Controller
public class UserBoardController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "userBoardService")
	private UserBoardService userBoardService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value="/normalUserBoardList.do")
	public String normalUserBoard(@ModelAttribute("normalBoardVO") NormalBoardVO normalBoardVO, Model model) throws Exception {
		//System.out.println("boardId:"+normalBoardVO.getBoardId());
		model.addAttribute("boardId", normalBoardVO.getBoardId());
		
		BoardVO boardVO = boardService.selectBoard(normalBoardVO.getBoardId());
		model.addAttribute("boardVO", boardVO);
		
		/** EgovPropertyService.sample */
		normalBoardVO.setPageUnit(propertiesService.getInt("pageUnit"));
		normalBoardVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(normalBoardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(normalBoardVO.getPageUnit());
		paginationInfo.setPageSize(normalBoardVO.getPageSize());

		normalBoardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		normalBoardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		normalBoardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<NormalBoardVO> normalBoardList = userBoardService.selectNormalBoardList(normalBoardVO);
		model.addAttribute("normalBoardList", normalBoardList);

		int totCnt = userBoardService.selectNormalBoardListTotCnt(normalBoardVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		//List<NormalBoardVO> normalBoardList = userBoardService.selectNormalBoardList(searchVO);
		
		return "user/board/normalUserBoardList";
	}
	
	@RequestMapping(value="/normalUserBoardInsert.do")
	public String normalUserBoardInsert(NormalBoardVO normalBoardVO, ModelMap model) throws Exception {
		System.out.println("boardId:"+normalBoardVO.getBoardId());
		model.addAttribute("normalBoardVO", normalBoardVO);
		return "user/board/normalUserBoardInsert";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/normalUserBoardInsert.do", method = RequestMethod.POST)
	public String normalUserBoardInsertSubmit(NormalBoardVO normalBoardVO, ModelMap model, BindingResult bindingResult) throws Exception {
		
		//System.out.println("boardId:"+normalBoardVO.getBoardId());
		//System.out.println("postTitle:"+normalBoardVO.getPostTitle());
		//System.out.println("postContent:"+normalBoardVO.getPostContent());
		//System.out.println(StringEscapeUtils.unescapeHtml3(normalBoardVO.getPostContent()));
		normalBoardVO.setPostContent(StringEscapeUtils.unescapeHtml3(normalBoardVO.getPostContent()));
		
		// Server-Side Validation
		beanValidator.validate(normalBoardVO, bindingResult);
				
		String newNormalBoardId = userBoardService.selectNewNormalBoardId();
				
		switch (newNormalBoardId.length()) {
		case 1:
			newNormalBoardId = "NB-000000" + newNormalBoardId;
			break;
		case 2:
			newNormalBoardId = "NB-00000" + newNormalBoardId;
			break;
		case 3:
			newNormalBoardId = "NB-0000" + newNormalBoardId;
			break;
		case 4:
			newNormalBoardId = "NB-000" + newNormalBoardId;
			break;
		case 5:
			newNormalBoardId = "NB-00" + newNormalBoardId;
			break;
		case 6:
			newNormalBoardId = "NB-0" + newNormalBoardId;
			break;
		case 7:
			newNormalBoardId = "NB-" + newNormalBoardId;
			break;
		default:
			break;
		}
		//System.out.println("newNormalBoardId:"+newNormalBoardId);
		normalBoardVO.setNorBrdId(newNormalBoardId);
		
		String result = userBoardService.insertNormalBoard(normalBoardVO);
		//System.out.println("result:"+result);
		
		return "redirect:/normalUserBoardList.do";
	}
	
	@RequestMapping(value="/normalUserBoardView.do")
	public String normalUserBoardView(@ModelAttribute("normalBoardVO") NormalBoardVO normalBoardVO, Model model) throws Exception {
		
		String searchKeyword = normalBoardVO.getSearchKeyword();
		String searchCondition = normalBoardVO.getSearchCondition();
		int pageIndex = normalBoardVO.getPageIndex();
		
		normalBoardVO = userBoardService.selectNormalBoard(normalBoardVO);
		
		normalBoardVO.setSearchCondition(searchCondition);
		normalBoardVO.setSearchKeyword(searchKeyword);
		normalBoardVO.setPageIndex(pageIndex);
		
		model.addAttribute("normalBoardVO", normalBoardVO);
		
		return "user/board/normalUserBoardView";
	}
	
	@RequestMapping(value="/normalUserBoardUpdate.do")
	public String normalUserBoardUpdate(@ModelAttribute("normalBoardVO") NormalBoardVO normalBoardVO, Model model) throws Exception {
		
		normalBoardVO = userBoardService.selectNormalBoard(normalBoardVO);
		model.addAttribute("normalBoardVO", normalBoardVO);
		
		return "user/board/normalUserBoardUpdate";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/normalUserBoardUpdate.do", method = RequestMethod.POST)
	public String normalUserBoardUpdateSubmit(NormalBoardVO normalBoardVO, ModelMap model, BindingResult bindingResult) throws Exception {
		
		//System.out.println("boardId:"+normalBoardVO.getBoardId());
		//System.out.println("postTitle:"+normalBoardVO.getPostTitle());
		//System.out.println("postContent:"+normalBoardVO.getPostContent());
		//System.out.println(StringEscapeUtils.unescapeHtml3(normalBoardVO.getPostContent()));
		normalBoardVO.setPostContent(StringEscapeUtils.unescapeHtml3(normalBoardVO.getPostContent()));
		
		// Server-Side Validation
		beanValidator.validate(normalBoardVO, bindingResult);
				
		String result = userBoardService.updateNormalBoard(normalBoardVO);
		System.out.println("update result:"+result);
		
		return "redirect:/normalUserBoardList.do";
	}
	
	@RequestMapping(value="/photoUserBoardList.do")
	public String photoUserBoardList(@RequestParam("boardId") String boardId, Model model) throws Exception {
		//System.out.println("===========================photoUserBoardList================================"+boardId);
		model.addAttribute("boardId", boardId);
		List<PhotoBoardVO> list = userBoardService.selectPhotoBoardList(boardId);
		model.addAttribute("photoBoardList", list);
		
		return "user/board/photoUserBoardList";
	}
	
	@RequestMapping(value="/photoUserBoardInsert.do", method = RequestMethod.POST)
	public String photoUserBoardInsert(MultipartHttpServletRequest multipart, PhotoBoardVO photoBoardVO) throws Exception {
		//System.out.println("===========================photoUserBoardInsert================================");
		//System.out.println("file name:"+multipart);
		//System.out.println("boardId:"+multipart.getParameter("boardId"));
		//String boardId = multipart.getParameter("boardId");
		
		Iterator<String> itr = multipart.getFileNames();
		
		boolean isLocal = false;
		//System.out.println(multipart.getParameter("id"));
				
		String requestUrl = new String(multipart.getRequestURL());
		System.out.println(requestUrl);		
		if (requestUrl.contains("localhost") || requestUrl.contains("127.0.0.1"))
		{
			isLocal = true;
		}
		isLocal = true;
		String filePath = "/usr/local/리눅스 서버 경로.....";
		String filePath2 = "/usr/local/리눅스 서버 경로.....";
		if (isLocal) {
			//filePath = "F:\\eGovFrameDev-3.8.0-64bit\\Server\\apache-tomcat-9.0.21\\webapps\\test";
			//filePath = "C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\EgovProject\\src\\main\\webapp\\images\\thumbs";
			//filePath2 = "C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\EgovProject\\src\\main\\webapp\\images\\fulls";
			filePath = "C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\EgovProject\\images\\thumbs";
			filePath2 = "C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\EgovProject\\images\\fulls";
		}
		
		while(itr.hasNext()) {
			MultipartFile mpf = multipart.getFile(itr.next());
			
			System.out.println(mpf);
			System.out.println("name:"+mpf.getName());
			System.out.println("content type:"+mpf.getContentType());
			System.out.println("original filename:"+mpf.getOriginalFilename());
			System.out.println("size:"+mpf.getSize());
			System.out.println("bytes:"+mpf.getBytes());
			System.out.println("resource:"+mpf.getResource());
			
			String orgFileNm = mpf.getOriginalFilename();
			String fileExt = orgFileNm.substring(orgFileNm.lastIndexOf('.')+1);
			String fileName =orgFileNm.substring(0, orgFileNm.lastIndexOf('.'));
			photoBoardVO.setType(fileExt);
			photoBoardVO.setRealNm(fileName);
			photoBoardVO.setSavePath(filePath);
			photoBoardVO.setSize(mpf.getSize());
		//	photoBoardVO.setBoardId(boardId);
			
			String fullFileName =fileName +"_"+ new SimpleDateFormat("yyyyMMddhhmm").format(new Date()) + "." + fileExt;
			
			mpf.transferTo(new File(filePath + File.separator + fullFileName));
			mpf.transferTo(new File(filePath2 + File.separator + fullFileName));
			System.out.println(fullFileName);
			
			photoBoardVO.setSaveNm(fullFileName);
			
			// db저장
		//	System.out.println(photoBoardVO.getTitle());
			String newPhotoId = userBoardService.selectNewPhotoBoardId();
			switch (newPhotoId.length()) {
			case 1:
				newPhotoId = "P-0000000" + newPhotoId;
				break;
			case 2:
				newPhotoId = "P-000000" + newPhotoId;
				break;
			case 3:
				newPhotoId = "P-00000" + newPhotoId;
				break;
			case 4:
				newPhotoId = "P-0000" + newPhotoId;
				break;
			case 5:
				newPhotoId = "P-000" + newPhotoId;
				break;
			case 6:
				newPhotoId = "P-00" + newPhotoId;
				break;
			case 7:
				newPhotoId = "P-0" + newPhotoId;
				break;
			case 8:
				newPhotoId = "P-" + newPhotoId;
				break;
			default:
				break;
			}
			photoBoardVO.setPhotoId(newPhotoId);
			userBoardService.insertPhotoUpload(photoBoardVO);
			
		}
		
		return "redirect:/photoUserBoardList.do?boardId="+photoBoardVO.getBoardId();
	}
	
	@RequestMapping(value="/videoUserBoardList.do")
	public String videoUserBoard() throws Exception {
		
		//FFmpeg ffmpeg = new FFmpeg("C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\EgovProject\\src\\test\\resources\\ffmpeg\\bin\\ffmpeg.exe");
		//FFprobe ffprobe = new FFprobe("C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\EgovProject\\src\\test\\resources\\ffmpeg\\bin\\ffprobe.exe");
		
		FFmpeg ffmpeg = new FFmpeg("C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\EgovProject\\src\\main\\resources\\ffmpeg\\bin\\ffmpeg.exe");
		FFprobe ffprobe = new FFprobe("C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\EgovProject\\src\\main\\resources\\ffmpeg\\bin\\ffprobe.exe");
		
		FFmpegProbeResult probeResult = ffprobe.probe("C:\\dev\\eGovFrameDev-4.1.0-64bit\\workspace\\EgovProject\\src\\main\\webapp\\video\\42898.mp4");
		System.out.println("비트레이드:"+probeResult.getStreams().get(0).bit_rate);
		
		return "user/board/videoUserBoardList";
	}
	
	
}
