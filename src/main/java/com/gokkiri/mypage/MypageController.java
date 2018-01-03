package com.gokkiri.mypage;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

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

/*import com.gokkiri.member.MemberModel;
import com.gokkiri.member.MemberService;*/
import com.gokkiri.mypage.MypageService;

import com.gokkiri.qna.QnAModel;
import com.gokkiri.qna.QnAService;
import com.gokkiri.schedule.ScheduleModel;
import com.gokkiri.schedule.ScheduleService;
import com.gokkiri.area.AreaModel;
import com.gokkiri.area.AreaReviewModel;
import com.gokkiri.area.AreaService;
import com.gokkiri.main.Paging;
import com.gokkiri.member.MemberModel;
import com.gokkiri.tip.TipModel;
import com.gokkiri.tip.TipService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Resource(name="mypageService")
	private MypageService mypageService;
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name="qnAService")
	private QnAService qnAService;
	
	/*@Resource(name="memberService")
	private MemberService memberService;*/

	ModelAndView mav = new ModelAndView();
	int a_cate;
	int a_img_index;
	
	//페이징
	private String pagingHtml;
	private Paging page;
	private int currentPage;
	
	// tip 리스트
		@RequestMapping("myTipList.go")
		public ModelAndView myTipList(HttpSession session, HttpServletRequest request, TipModel tipModel) throws UnsupportedEncodingException {

			if(session.getAttribute("session_m_email") != null) { //로그인o
			if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
				currentPage = 1;
				
			} else {
				
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			String m_email = (String) session.getAttribute("session_m_email");
			List<TipModel> tipList = mypageService.myTipList(m_email);

	        /* 페이징  */
			int totalCount = tipList.size();
			page = new Paging("mypage/myTipList",currentPage, totalCount, 8, 5, null);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount) {
				lastCount = page.getEndCount() + 1;
			}
			
			tipList = tipList.subList(page.getStartCount(), lastCount);

			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("tipList", tipList);
			mav.setViewName("myTipList");

			return mav;
			} else{
				mav.setViewName("loginConfirm"); //로그인x
				return mav;
			}
		}
	
	//내가쓴 리뷰 목록
	@RequestMapping("/myAreaReviewList.go")
	public ModelAndView myAreaReview(HttpSession session, HttpServletRequest request) throws Exception {
		
		session.getAttribute("session_m_email");
		
		if(session.getAttribute("session_m_email") != null) { //로그인o

			String m_email = (String) session.getAttribute("session_m_email");
			List<AreaReviewModel> areaReviewList = mypageService.myAreaReviewList(m_email);

			mav.addObject("areaReviewList", areaReviewList);
			mav.setViewName("myReviewList");
			return mav;
				
		} else {
			mav.setViewName("loginConfirm"); //로그인x
			return mav;
		}
	}
	
	
	
	//내가쓴 QnA글 목록
	@RequestMapping("myQnaList.go")
	public ModelAndView myQnaList(HttpSession session, HttpServletRequest request) throws Exception{

	session.getAttribute("session_m_email");
	
	if(session.getAttribute("session_m_email") != null) { //로그인o
		
		String m_email = (String) session.getAttribute("session_m_email");
		
		List<QnAModel> qnaList = mypageService.myQnaList(m_email);//QnA글 
		
		mav.addObject("qnaList", qnaList);
		mav.setViewName("myQnAList");
		return mav;
			
		} else {

			mav.setViewName("loginConfirm"); //로그인x
			return mav;
	}
	
}
	
	//내가쓴 QnA 댓글 목록
	@RequestMapping("myQnaCoList.go")
	public ModelAndView myQnaCoList(HttpSession session, HttpServletRequest request) throws Exception{

	session.getAttribute("session_m_email");
	
	if(session.getAttribute("session_m_email") != null) { //로그인o
		
		String m_email = (String) session.getAttribute("session_m_email");

		List<QnAModel> qnaCommList = mypageService.myQnaCommList(m_email);//QnA 댓글

		mav.addObject("qnaCommList", qnaCommList);
		mav.setViewName("myQnACoList");
		return mav;
			
		} else {

			mav.setViewName("loginConfirm"); //로그인x
			return mav;
	}
	
}

	

	//내 일정 리스트 보기
		@RequestMapping("myScheduleList.go")
		public ModelAndView myComScheduleList(HttpSession session, HttpServletRequest request) throws Exception{

			session.getAttribute("session_m_email");
			
			if(session.getAttribute("session_m_email") != null) { //로그인o
				
				String m_email = (String) session.getAttribute("session_m_email");
				
				List<ScheduleModel> comScheduleList = mypageService.myComScheduleList(m_email); //완성글&공개
				List<ScheduleModel> comScheduleList_p = mypageService.myComScheduleList_p(m_email); //완성글&비공개
				
				List<ScheduleModel> IncomScheduleList = mypageService.myIncomScheduleList(m_email); //미완성글&공개
				List<ScheduleModel> IncomScheduleList_p = mypageService.myIncomScheduleList_p(m_email); //미완성글&비공개
				
				
				mav.addObject("comScheduleList", comScheduleList);
				mav.addObject("comScheduleList_p", comScheduleList_p);
				
				mav.addObject("IncomScheduleList", IncomScheduleList);
				mav.addObject("IncomScheduleList_p", IncomScheduleList_p);
				
				mav.setViewName("myScheduleList");
				return mav;
					
				} else {

					mav.setViewName("loginConfirm"); //로그인x
					return mav;
			}
			
		}
	
	//찜한일정 리스트 보기
	@RequestMapping("zzimScheduleList.go")
	public ModelAndView zzimScheduleList(HttpSession session, HttpServletRequest request) throws Exception{

		session.getAttribute("session_m_email");
		
		if(session.getAttribute("session_m_email") != null) { //로그인o
			
			if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
				currentPage = 1;
				
			} else {
				
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			String m_email = (String) session.getAttribute("session_m_email");
			List<ScheduleModel> zzimScheduleList = mypageService.zzimScheduleList(m_email); 

	        /* 페이징  */
			int totalCount = zzimScheduleList.size();
			page = new Paging("mypage/zzimScheduleList",currentPage, totalCount, 8, 5, null);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount) {
				lastCount = page.getEndCount() + 1;
			}
			
			zzimScheduleList = zzimScheduleList.subList(page.getStartCount(), lastCount);

			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("zzimScheduleList", zzimScheduleList);
			mav.setViewName("zzimScheduleList");
			return mav;

			
			} else {

				mav.setViewName("loginConfirm"); //로그인x
				return mav;
		}
			
		}
	
	
	//공유일정 리스트 보기
	@RequestMapping("sharedScheduleList.go")
	public ModelAndView sharedScheduleList(HttpSession session, HttpServletRequest request) throws Exception{

			session.getAttribute("session_m_email");
			
			if(session.getAttribute("session_m_email") != null) { //로그인o
				
				
				
				if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
					currentPage = 1;
					
				} else {
					
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				String m_email = (String) session.getAttribute("session_m_email");
				List<ScheduleModel> sharedScheduleList = mypageService.sharedScheduleList(m_email);

		        /* 페이징  */
				int totalCount = sharedScheduleList.size();
				page = new Paging("mypage/sharedScheduleList",currentPage, totalCount, 8, 5, null);
				pagingHtml = page.getPagingHtml().toString();

				int lastCount = totalCount;

				if (page.getEndCount() < totalCount) {
					lastCount = page.getEndCount() + 1;
				}
				
				sharedScheduleList = sharedScheduleList.subList(page.getStartCount(), lastCount);

				mav.addObject("pagingHtml", pagingHtml);
				mav.addObject("sharedScheduleList", sharedScheduleList);
				 mav.setViewName("sharedScheduleList");
				 return mav;
				 
			}else {

					mav.setViewName("loginConfirm"); //로그인x
					return mav;
			}
			
		}
	

	


	
	
	
	
	
	
	
	

}
