package egovframework.user.web;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.user.service.MemberVO;
import egovframework.user.service.UserMemberService;

@Controller
public class UserMemberController {

	@Resource(name="userMemberService")
	private UserMemberService userMemberService;
	
	@RequestMapping(value = "/memberJoin.do")
	public String memberJoin(ModelMap model) throws Exception {
		
		return "user/member/memberJoin";
	}
	
	@RequestMapping(value = "/userLogin.do")
	public String userLogin(ModelMap model) throws Exception {
		
		return "user/member/login";
	}
	
	@RequestMapping(value = "/userIdDupChk.do")
	public void userIdDupChk(@RequestParam("userId") String userId, HttpServletResponse response) throws Exception {
		
		int cnt = userMemberService.userIdDupChk(userId);
		
		response.getWriter().print(cnt);
	}
	
	@RequestMapping(value = "/mobileNumDupChk.do")
	public void mobileNumDupChk(@RequestParam("mobileNum") String mobileNum, HttpServletResponse response) throws Exception {
		
		String authNum = "";
		int cnt = userMemberService.mobileNumDupChk(mobileNum);
		
		if(cnt == 0) {
			/* 미가입 전화번호일 경우 sms인증번호 발송 */
			
			Random random = new Random();
			for(int i=0; i<5; i++) {
				authNum += random.nextInt(9);
			}
			//System.out.println(authNum);
		}
		response.getWriter().print("{"
				  + "\"cnt\":\""+cnt+
				"\", \"authNum\":\""+authNum+
				"\"}");
	}
	
	@RequestMapping(value="/memberJoin.do", method = RequestMethod.POST)
	public String memberJoinSubmit(MemberVO memberVO) throws Exception {
		//System.out.println("user id:"+memberVO.getUserId());
		//System.out.println("mobile num:"+memberVO.getMobileNum());
		//System.out.println("user email:"+memberVO.getUserEmail());
		//System.out.println("gender:"+memberVO.getGender());
		userMemberService.memberInsert(memberVO);
		
		return "redirect:/userLogin.do";
	}
	
	@RequestMapping(value="/userLogin.do", method=RequestMethod.POST)
	public String userLogin(HttpServletRequest request, MemberVO memberVO) throws Exception {
		System.out.println(memberVO.getUserId());
		System.out.println(memberVO.getPasswd());
		String result = "";
		int cnt = userMemberService.userLogin(memberVO);
		if(cnt==1) {
			//request.getSession().getAttributeNames()
			request.getSession().setAttribute("userId", memberVO.getUserId());
			result = "redirect:/main.do";
		}else {
			result = "redirect:/userLogin.do";
		}
	//	System.out.println("===>"+request.getSession().getAttribute("userId"));
		return result;
	}
	
	@RequestMapping(value="/userLogout.do")
	public String userLogout(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("userId");
		return "redirect:/main.do";
	}
}
