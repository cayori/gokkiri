package com.gokkiri.push;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gokkiri.member.MemberModel;
import com.gokkiri.member.MemberService;
import com.gokkiri.schedule.ScheduleModel;
import com.gokkiri.schedule.ScheduleService;
import com.gokkiri.push.PushService;

@Controller
@RequestMapping("/push")
public class PushController {
	
	@Resource(name="pushService")
	private PushService pushService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	ModelAndView mav = new ModelAndView();
	
	
	 //알림 리스트
	 @RequestMapping("/pushList.go")
	 public ModelAndView pushList(HttpServletRequest request, HttpSession session) {
		 
		 if(session.getAttribute("session_m_email") != null){ //로그인o
			 
		 String m_email = (String) session.getAttribute("session_m_email");
		 System.out.println(m_email);
		 List<ScheduleModel> pushList = pushService.pushList(m_email); // 알림리스트 보여줌
		 int pushListCount = pushService.pushListCount(m_email);
		
		 
			 mav.addObject("pushList", pushList);
			 mav.addObject("pushListCount", pushListCount);
			 mav.setViewName("push/pushList");
			 return mav;
			 
		 } else{ //로그인x
			 mav.setViewName("loginConfirm"); 
			return mav;
		 }

	 
	 }
	 
	 
	 //친구신청 수락/거절
	 @RequestMapping("/updateTogether.go")
	 public ModelAndView updateTogether(HttpServletRequest request, HttpSession session) {

		 //상태 변경
		 String s_together = (String)request.getParameter("s_together");
		 int s_no = Integer.parseInt(request.getParameter("s_no"));
		 int s_state = Integer.parseInt(request.getParameter("s_state"));
		 pushService.updateTogether(s_together, s_no, s_state);//상태값 업데이트. 수락이면 1 거절이면 2
		 pushService.deleteTogether(); //상태값이 2면 sch_share테이블에서 값 사라짐
		 
		 //업데이트 후 헤더의 세션값 변경
		 String m_email = (String) session.getAttribute("session_m_email");
		 List<ScheduleModel> pushList = pushService.pushList(m_email); // 알림리스트
		 int pushCount = pushService.pushListCount(m_email); //알림 갯수
	     session.setAttribute("session_pushList", pushList);
	     session.setAttribute("session_pushCount", pushCount);

	    
		
		 
		 if(s_state==1){
		 
		 mav.addObject("s_state", s_state);
		 mav.setViewName("push/pushState");}
		 
		 else if(s_state==2){
			 mav.addObject("s_state", s_state);
			 mav.setViewName("push/pushState");
		 }
		 return mav;
		 
	 
	 }
	 
	 
	 
	
	 
	
	 

}