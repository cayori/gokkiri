package com.gokkiri.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gokkiri.member.MemberModel;
import com.gokkiri.member.MemberService;
import com.gokkiri.push.PushService;
import com.gokkiri.schedule.ScheduleModel;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="pushService")
	private PushService pushService;
	
	ModelAndView mav = new ModelAndView();
	
	//회원가입 폼
	@RequestMapping(value="/joinForm.go", method=RequestMethod.GET)
	public String joinForm(){
		return "joinForm";
	}
	
	//회원가입
	@RequestMapping(value="/join.go", method=RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("member") MemberModel member, HttpServletRequest request) throws Exception {
		
		 int joinError;
		 
		 String m_email = (String)request.getParameter("m_email");
		 String m_pw = (String)request.getParameter("m_pw");
		 String m_name = (String)request.getParameter("m_name");
		 
		 Random rnd = new Random();
		 StringBuffer buf = new StringBuffer();
			for(int i=0;i<10;i++){
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+97));
			    }else{
			        buf.append((rnd.nextInt(10))); 
			    }
			}
			String m_auth = buf.toString();
			
			String message  = "<center>"
					+"<table cellspacing=\"0\" cellpadding=\"0\" width=\"620\" border=\"0\">"
					+"<!--title-->"
					+"<tbody><tr><td height=\"25\"></td></tr>"
					+"<tr><td align=\"left\" style=\"border-bottom:2px solid #0545b1;\"><a href=\"http://localhost:8080/gokkiri/main.go\" target=\"_blank\"><img src=\"http://postfiles7.naver.net/MjAxNzAxMTNfMzQg/MDAxNDg0Mjc3MDU4NTM3.gBL_URIIpmpwGlXyXlyB75w2E20AX8wrZKfnaxDGhAkg.6os_tlqs7Axoot-zwVg4J_46I2AR9VtnQjCG7K5Uixwg.JPEG.powart1992/welcome.jpg?type=w2\" style=\"height: 240px; width: 620px;\"></a></td></tr>"
					 +"<tr><td height=\"25\"></td></tr>"
					 +"<tr><td align=\"center\">"	
							+"<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"620\">"
							+"<tbody><tr><td height=\"20\"></td></tr>"
							+"<tr><td align=\"center\" valign=\"top\" style=\"text-align:center\"><img src=\"http://entrystatic.afreecatv.com/ems/1/img/join_welcome.gif\" border=\"0\" alt=\"통합회원 가입을 환영 합니다.\"></td></tr>"
							+"<tr><td height=\"20\"></td></tr>"
							+"<tr align=\"center\" valign=\"top\"><td style=\"font-size:15px;color:#000000;font-family:돋움,dotum;line-height:1.4em;text-align:center;\"><b>안녕하세요.</b> <font color=\"#46484a\"><b><font color=\"#0054e2\">"+m_name+"</font> 고객님!<br>"
							+"Go끼리 회원이 되어주셔서 감사합니다.<br>"
							+ "아래의 링크를 클릭하여 접속하시면 이메일주소가 <font color=\"#46484a\"><b><font color=\"#0054e2\">"+m_email+"</font> 이 맞음이 증명됩니다.</b></font></td></tr>"
							+"<tr align=\"center\" valign=\"top\"><td style=\"font-size:15px;color:#000000;font-family:돋움,dotum;line-height:1.4em;text-align:center;\"><a href=http://localhost:8080/gokkiri/member/emailAuth.go?m_email="+m_email+"&m_auth="+buf.toString()+">"
			    			+"<strong>인증하기</strong></font></a></td></tr>"
							+"<tr><td height=\"40\"></td></tr>"
							+"<tr><td height=\"50\"></td></tr>"
							+"<tr><td align=\"center\" style=\"font-size:12px;color:#777;font-family:돋움,dotum;line-height:18px;text-align:center;\">Go끼리는 모바일이나 데스크탑으로 여행 일정을 계획할 수 있는 사이트입니다.<br>"
							+"일정을 만들고 공유할 수 있는 곳, 바로 Go끼리 입니다.<br>앞으로 고객님께 보다 질 좋은 서비스를 보여드릴 수 있도록, 항상 노력하는 Go끼리가 되겠습니다. 감사합니다.</td></tr>"
							+"</tbody></table>"
							+"<map name=\"join_service\">"
							+"</map>"
						+"</td></tr>"
					+"<!--footer-->"
					+"<tr><td height=\"55\" bgcolor=\"#ffffff\"></td></tr>"
					+"<tr><td height=\"15\" bgcolor=\"#f1f1f1\"></td></tr>"
					+"<tr><td align=\"center\" height=\"64\" bgcolor=\"#f1f1f1\">"
							+"<table cellspacing=\"0\" cellpadding=\"0\" width=\"580\">"
							+"<tbody><tr valign=\"top\" bgcolor=\"#f1f1f1\"><td align=\"left\" width=\"10\"><img src=\"http://www.afreecatv.com/images/mail/common/bul1.gif\" alt=\"\"></td><td align=\"left\" width=\"570\" style=\"font-weight:bold;color:#333;font-size:12px;font-family:돋움,dotum\">본 메일은 발신 전용으로 회신하실 경우 답변 되지 않습니다.</td></tr>"
							+"<tr><td colspan=\"2\" height=\"5\"></td></tr>"
							+"<tr valign=\"top\" bgcolor=\"#f1f1f1\"><td align=\"left\" width=\"10\" style=\"padding-top:5px;\"><img src=\"http://www.afreecatv.com/images/mail/common/ico_dot2.gif\" alt=\"\"></td><td align=\"left\" width=\"570\" style=\"color:#333;font-size:11px;letter-spacing:-1px;font-family:돋움,dotum\">궁금하신 점이나 불편사항은 전화 <span style=\"letter-spacing:0;\">010-4425-0511</span> 또는 이메일(powart1992@naver.com)을 통하여 문의 주시기 바랍니다.</td></tr>"
							+"</tbody></table>"
						+"</td></tr>"
					+"<tr><td height=\"4\" bgcolor=\"#cbcbcb\"></td></tr>"
					+"</tbody></table>"
					+"</center>";
			
			new sendEmail(m_email, message);
		
			
		//이메일, 닉네임 중복되면 가입안되도록	
		MemberModel emailChk = memberService.getEmailDuplChk(m_email);
		MemberModel nameChk = memberService.getNameDuplChk(m_name);
		  	
		if(emailChk==null && nameChk==null){
		
		memberService.insertMember(m_email, m_pw, m_name, m_auth);
		
		mav.setViewName("join");
		 return mav;
	    
	    
		} else if(emailChk != null && nameChk==null){ 
			joinError =1;
			mav.addObject("joinError",joinError);
			mav.addObject("m_email",m_email);
		    mav.setViewName("member/joinError");
		    return mav;
		  
		} else if(nameChk != null && emailChk==null) {
			joinError=2;
			mav.addObject("joinError",joinError);
			mav.addObject("m_name",m_name);
		    mav.setViewName("member/joinError");
		    return mav;
		    
		} else if(emailChk != null && nameChk!=null) {
			joinError=3;
			mav.addObject("joinError",joinError);
			mav.addObject("m_email",m_email);
			mav.addObject("m_name",m_name);
		    mav.setViewName("member/joinError");
		    return mav;
		   
		}
		
		
		 return mav;
	   
				
	}
	
	@RequestMapping("/emailAuth.go")
	public ModelAndView emailAuth(HttpServletRequest request) throws Exception{
		
		String m_auth = request.getParameter("m_auth");
		String m_email = request.getParameter("m_email");
		int auth = memberService.emailAuth(m_email, m_auth);
		
		//인증 실패
		if (auth == 0) {
			System.out.println("1111");
			mav.setViewName("member/emailAuthFail");
		//인증됨	
		}else if (auth == 1) {
			Random rnd = new Random();
			StringBuffer buf = new StringBuffer();
			for(int i=0;i<10;i++){
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+97));
			    }else{
			        buf.append((rnd.nextInt(10))); 
			    }
			}
			m_auth = buf.toString();
		    memberService.changeAuth(m_email,m_auth);
		    mav.setViewName("member/emailAuthSuccess");
		}
		
		return mav;
	}
		
	//회원가입시 이메일 중복체크
	@RequestMapping("/duplChk.go")
	public ModelAndView emailDuplChk(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

		  int memberEmailChk;
		  		
		  String m_email = request.getParameter("m_email");
		  member = memberService.getEmailDuplChk(m_email);
		  		
		  		if (member == null) {
		  			
		  			memberEmailChk = 0; //사용가능 이메일
		  			mav.addObject("member", member);
		  			mav.addObject("memberEmailChk", memberEmailChk);
		  			mav.setViewName("member/idChk");
		  			return mav;

		  		} else {
		  			
		  			memberEmailChk = 1; // 사용불가능 이메일
		  			/*System.out.println("사용불가능이메일");*/
		  			mav.addObject("member", member);
		  			mav.addObject("memberEmailChk", memberEmailChk);
		  			mav.setViewName("member/idChk");
		  			return mav;
		  		}
		  	}
	
	//이름(닉네임)중복체크
	@RequestMapping("/nameDuplChk.go")
	public ModelAndView getEmailDuplChk(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {
		
			  int memberNameChk;
			  		
			  String m_name = request.getParameter("m_name");
			  member = memberService.getNameDuplChk(m_name);
			  		
			  		if (member == null) {
			  			
			  			memberNameChk = 0; //사용가능 닉네임
			  			mav.addObject("member", member);
			  			mav.addObject("memberNameChk", memberNameChk);
			  			mav.setViewName("member/nameChk");
			  			return mav;

			  		} else {
			  			
			  			memberNameChk = 1; // 사용불가능 닉네임
			  			System.out.println("사용불가능닉네임");
			  			mav.addObject("member", member);
			  			mav.addObject("memberNameChk", memberNameChk);
			  			mav.setViewName("member/nameChk");
			  			return mav;
			  		}
			  	}
	
	
	
	//로그인 폼- 모달로함
	/*@RequestMapping(value="/loginForm.go", method=RequestMethod.GET)
	public String loginForm() {
	     return "";
	  }*/

	 //로그인동작 및 세션 생성
	 @RequestMapping(value="/login.go", method=RequestMethod.POST)
	 public ModelAndView memberLogin(HttpServletRequest request, MemberModel member) throws Exception{
		 
		  int memberLoginChk;
	      MemberModel result = memberService.memberLogin(member);
	      
	      if(result==null){
	    	  memberLoginChk=3;
				
				mav.addObject("memberLoginChk",memberLoginChk);
				mav.setViewName("login");
			    return mav;
			    
	      } else{
	      String m_email = result.getM_email();
	      /*String m_email = (String)request.getParameter("m_email");*/
	      System.out.println("m_email : "+m_email);
	      String m_auth = result.getM_auth();
	      System.out.println("m_auth : "+m_auth);
	      
	      
	      //멤버 존재하고 이메일 인증한경우 admin=1로 변경됨.
	      memberService.emailAuth(m_email, m_auth);
	      
	      int m_admin = result.getM_admin();
	      System.out.println("m_admin : "+m_admin);

	      if(result!=null && m_admin==1) { //회원이고 이메일인증 함
	         
	    	 memberLoginChk = 0; //로그인 성공
	         HttpSession session = request.getSession();        
	   
	         
	         session.setAttribute("member", result);
	         session.setAttribute("session_m_email", result.getM_email());
	         session.setAttribute("session_m_name", result.getM_name());
	    	
	         
	         //-------------------------알림 헤더에 넣기----------------------------//
	    
	         List<ScheduleModel> pushList = pushService.pushList(m_email); // 알림리스트 보여줌
			 int pushCount = pushService.pushListCount(m_email);
	         
	         session.setAttribute("session_pushList", pushList);
	         session.setAttribute("session_pushCount", pushCount);
	         
	         
		     
		     
		     

	        
	         //-------------------------알림 헤더에 넣기 끝----------------------------//
	         
	        
	         
	                 
	         mav.addObject("memberLoginChk", memberLoginChk);
	         mav.setViewName("login");
	         return mav;
	         
	      } else if(result != null && m_admin==0){ //회원이고 이메일 인증 안함
	    	  	memberLoginChk =1;
				mav.addObject("memberLoginChk",memberLoginChk);
			    mav.setViewName("login");
			    return mav;
			  
			    
			} else if(result != null && m_admin==2) { //관리자
				memberLoginChk=2;
				mav.addObject("memberLoginChk",memberLoginChk);
				mav.setViewName("login");
			    return mav;
			   
			}
	      }
			
			
			
			 return mav;
	      
	      
	      
	      



	         
	   }
	 
	  //로그아웃
	  @RequestMapping("/logout.go")
	  public ModelAndView memberLogout(HttpServletRequest request, MemberModel member){
	      
	      HttpSession session = request.getSession(false);
	      
	      if(session!=null){
	         session.invalidate();
	      }
	      mav.addObject("member", new MemberModel());
	      mav.setViewName("logout");
	      return mav;
	   }
      
	 
	 //이메일/비밀번호 찾기 폼
	 @RequestMapping(value = "/findForm.go", method = RequestMethod.GET)
	 public ModelAndView memberFindForm() {
	  		mav.setViewName("emailpwFindForm");
	  		return mav;
	  	}
	
	 //이메일 찾기
	 @RequestMapping(value = "/emailFind.go", method = RequestMethod.POST)
	 public ModelAndView memberEmailFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

	  		int memberFindChk;
	  		member = memberService.emailFindByName(member);
	  		
	  		if (member == null) {
	  			memberFindChk = 0; // 비회원;
	  			mav.addObject("memberFindChk", memberFindChk);
	  			mav.setViewName("findError");
	  			return mav;

	  		} else {
	  		
	  				mav.addObject("member", member);
	  				mav.setViewName("emailFind");
	  				return mav;
	  		}
	  	}
	 
	 
	/* //비밀번호찾기 폼
	 @RequestMapping(value = "/pwFindForm.go", method = RequestMethod.GET)
	 public ModelAndView memberPwFindForm() {
	  		mav.setViewName("emailpwFindForm");
	  		return mav;
	  	}*/
	 
	 //비밀번호 찾기
	 @RequestMapping(value = "/pwFind.go", method = RequestMethod.POST)
	 public ModelAndView memberPwFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

	  		int memberFindChk;
	  		member = memberService.pwFindByEmail(member);
	  		
	  		if (member== null) {
	  			memberFindChk = 0; // 비회원;
	  			mav.addObject("memberFindChk", memberFindChk);
	  			mav.setViewName("findError");
	  			return mav;

	  		} else {
	  			
	  			if (member.getM_name().equals(member.getM_name()) || member.getM_email().equals(member.getM_email())) {
	  				memberFindChk = 1; // 회원, 이름/이메일 일치
	  				mav.addObject("member", member);
	  				mav.addObject("memberFindChk", memberFindChk);
	  				mav.setViewName("pwFind");
	  				return mav;
	  			} else {
	  				memberFindChk = -1; // 이름/이메일 불일치
	  				mav.addObject("memberFindChk", memberFindChk);
	  				mav.setViewName("findError");
	  				return mav;
	  			}
	  		}
	  	}
	  	
	 
	 
	 //회원정보수정 폼
	 @RequestMapping("/memberModifyForm.go")
	 public ModelAndView memberModifyForm(HttpSession session) {
		 
	  		session.getAttribute("session_m_email");

	  		if (session.getAttribute("session_m_email") != null) {
	  			String m_email = (String) session.getAttribute("session_m_email");
	  			MemberModel member = memberService.getMember(m_email);

	  			mav.addObject("member", member);
	  			mav.setViewName("memberModifyForm");
	  			return mav;
	  			
	  		} else {

	  			mav.setViewName("loginConfirm");
	  			return mav;
	  		}
	  	}

	 //회원정보 수정 완료
	 @RequestMapping("/memberModify.go")
	 public ModelAndView memberModify(HttpServletRequest request, HttpSession session,@ModelAttribute("member") MemberModel member) {
		 
		if(session.getAttribute("session_m_email") != null) { 
			
		/*String m_email = (String) request.getParameter("m_email");*/
		String m_email = (String) session.getAttribute("session_m_email");
		String m_pw = (String) request.getParameter("m_pw");
		String m_name = (String) request.getParameter("m_name");

		//이메일, 닉네임 중복되면 가입안되도록	
		MemberModel nameChk = memberService.getNameDuplChk(m_name);
				  	
			if(nameChk==null){
				//회원정보 수정
				memberService.memberModify(m_email, m_pw, m_name);
				
				// 회원정보 수정 후 헤더의 세션 이름 바뀌도록.
				MemberModel result = memberService.memberLogin(member);
				session.setAttribute("session_m_name", result.getM_name());
				
				mav.setViewName("memberModify");
				 return mav;
			    
			    
				} else {
					int joinError=2;
					mav.addObject("joinError",joinError);
					mav.addObject("m_name",m_name);
				    mav.setViewName("member/joinError");
				    return mav;
				   
				}
		
		 } else{
				mav.setViewName("loginConfirm"); //로그인x
				return mav;
		 }

	}
	 
	 
	 
	 //회원 탈퇴 폼
	 @RequestMapping("/memberDeleteForm.go")
		public ModelAndView memberDeleteForm(){
		 	mav.setViewName("memberDeleteForm");
			return mav;
		}
	 
	 //회원 탈퇴
	 @RequestMapping("/memberDelete.go")
  	 public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, BindingResult result, HttpSession session, HttpServletRequest request) {
		
		
  		MemberModel memberModel; // 쿼리 결과 값을 저장할 객체
  		
  		String m_email;
  		String m_pw;
  		m_pw = request.getParameter("m_pw");
  		int deleteCheck;
  		
  		//해당 이메일의 정보를 가져온다
  		m_email = session.getAttribute("session_m_email").toString();
  		memberModel = (MemberModel) memberService.getMember(m_email);
  		
  		
  		if(session.getAttribute("session_m_email") != null) { 
  		if(memberModel.getM_pw().equals(m_pw)) {
  			
  			deleteCheck = 1; //패스워드 일치
  			
  			//삭제 쿼리 수행
  			memberService.memberDelete(m_email);
  			session.removeAttribute("session_m_email");
  			session.removeAttribute("session_m_name");
  		
  		} else {
  			deleteCheck = -1; //패스워드 불일치
  		}
  		
  		mav.addObject("deleteCheck", deleteCheck);
  		mav.setViewName("memberDelete");
  		return mav;
  	}
  		else {

			mav.setViewName("loginConfirm"); //로그인x
			return mav;
	}
	  	

}
}
