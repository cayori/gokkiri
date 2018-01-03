package com.gokkiri.schedule;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gokkiri.area.AreaModel;
import com.gokkiri.area.AreaService;
import com.gokkiri.city.CityModel;
import com.gokkiri.city.CityService;
import com.gokkiri.main.Paging;
import com.gokkiri.member.MemberModel;
import com.gokkiri.member.MemberService;
import com.gokkiri.state.StateModel;
import com.gokkiri.state.StateService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	ModelAndView mav = new ModelAndView();

	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name="stateService")
	private StateService stateService;
	
	@Resource(name="cityService")
	private CityService cityService;
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	private String pagingHtml;
	private Paging page;
	
	//일정게시판 ↓↓↓↓
		//일정게시판 리스트 보기
		@RequestMapping("scheduleList.go")
		public ModelAndView scheduleList(HttpServletRequest request) throws Exception{
			
			String keyword = request.getParameter("keyword");
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			if(keyword != null){
				List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
				
				int totalCount = scheduleList.size();
				
				page = new Paging("schedule/scheduleList",currentPage,totalCount, 20, 5, keyword);
				pagingHtml = page.getPagingHtml().toString();
				
				int lastCount = totalCount;
				
				if(page.getEndCount() < totalCount){
					lastCount = page.getEndCount() + 1;
				}
				
				scheduleList = scheduleList.subList(page.getStartCount(), lastCount);
				
				mav.addObject("scheduleList", scheduleList);
			}else{
				List<ScheduleModel> scheduleList = scheduleService.scheduleList();
				mav.addObject("scheduleList", scheduleList);
				
				int totalCount = scheduleList.size();
				
				page = new Paging("schedule/scheduleList",currentPage,totalCount, 20, 5, keyword);
				pagingHtml = page.getPagingHtml().toString();
				
				int lastCount = totalCount;
				
				if(page.getEndCount() < totalCount){
					lastCount = page.getEndCount() + 1;
				}
				
				scheduleList = scheduleList.subList(page.getStartCount(), lastCount);
				
				mav.addObject("scheduleList", scheduleList);
			}
			
			List<ScheduleModel> bestScheduleList = scheduleService.scheduleHitList();
			
			mav.addObject("bestScheduleList",bestScheduleList);
			mav.addObject("pagingHtml", pagingHtml);
			mav.setViewName("scheduleList");
			
			return mav;
		}
	
	@RequestMapping("scheduleWriteForm.go")
	public ModelAndView scheduleWriteForm(HttpServletRequest request, HttpSession session) throws Exception{
		
		if(session.getAttribute("session_m_email") == null){
			mav.setViewName("member/loginConfirm");
			return mav;
		}else{
			//미완성 리스트 가져오기
			List<ScheduleModel> scheduleIncompleteList = 
					scheduleService.scheduleIncompleteList((String)session.getAttribute("session_m_email"));
			mav.addObject("scheduleIncompleteList",scheduleIncompleteList);
			
			mav.setViewName("scheduleWriteForm");
			return mav;
		}
	}
	
	@RequestMapping("scheduleState.go")
	public ModelAndView scheduleState(HttpServletRequest request, ScheduleModel scheduleModel, HttpSession session) throws Exception{
        		
		scheduleModel.setM_email((String)session.getAttribute("session_m_email"));
		
		if(request.getParameter("s_no") == null && request.getParameter("keyword") == null){
			scheduleService.scheduleWrite(scheduleModel);
			
			if(request.getParameter("s_together") != ""){
				String together = request.getParameter("s_together");
				String[] toArr = together.split(" / ");
				for (int i = 0; i < toArr.length; i++) {
					scheduleService.scheduleShare(toArr[i]);
				}
			}
			
			scheduleModel = scheduleService.scheduleLastWrite((String)session.getAttribute("session_m_email"));
			
		}else if (request.getParameter("s_no") == null && request.getParameter("keyword") != null) {
			scheduleModel = scheduleService.scheduleLastWrite((String)session.getAttribute("session_m_email"));
			
			String keyword = request.getParameter("keyword");
			List<StateModel> stateSearchList = stateService.stateSearchList(keyword);
			mav.addObject("stateSearchList", stateSearchList);
			
		}else if (request.getParameter("s_no") != null && request.getParameter("keyword") == null) {
			scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
			scheduleModel = scheduleService.scheduleWriteSelect(scheduleModel);
			
		}else if (request.getParameter("s_no") != null && request.getParameter("keyword") != null) {
			scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
			scheduleModel = scheduleService.scheduleWriteSelect(scheduleModel);
			
			String keyword = request.getParameter("keyword");
			List<StateModel> stateSearchList = stateService.stateSearchList(keyword);
			mav.addObject("stateSearchList", stateSearchList);
		}
		
		List<StateModel> stateList = stateService.StateList();

		mav.addObject("sch", scheduleModel);
		mav.addObject("stateList",stateList);
		mav.setViewName("scheduleState");
		
		return mav;
	}
	

	@RequestMapping("scheduleArea.go")
	public ModelAndView scheduleArea(HttpServletRequest request, HttpSession session, ScheduleModel scheduleModel1, ScheduleModel scheduleModel2) throws Exception{
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int s_idx = Integer.parseInt(request.getParameter("s_idx"));
		
		//같이하는 친구 리스트
		List<ScheduleModel> togetherList = scheduleService.togetherList(s_no);
		
		scheduleModel1.setS_no(s_no);
		//일정 번호와 세션 아이디로 글 검색
		scheduleModel1 = scheduleService.scheduleWriteSelect(scheduleModel1);
		
		//마커 리스트
		List<AreaModel> areaList = areaService.markerAreaList(c_no, s_no, s_idx);
		
		scheduleModel2.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
		scheduleModel2.setS_no(s_no);
		
		//일정 리스트
		List<ScheduleModel> scheduleList = scheduleService.scheduleAreaList(scheduleModel2);

		if(request.getParameter("a_cate") != null){
			int a_cate = Integer.parseInt(request.getParameter("a_cate"));
			//마커 구분 리스트
			List<AreaModel> areaCateList = areaService.markerAreaCateList(c_no, a_cate, s_no, s_idx);
			mav.addObject("areaCateList", areaCateList);
			
			List<AreaModel> schAreaCateList = areaService.schAreaCateList(c_no, a_cate);
			mav.addObject("schAreaList", schAreaCateList);
		}else{
			List<AreaModel> schAreaList = areaService.schAreaList(c_no);
			mav.addObject("schAreaList", schAreaList);
		}
		
		if(request.getParameter("searchKeyword")!=null){
			String searchKeyword = request.getParameter("searchKeyword");
			
			List<AreaModel> schAreaSearch = areaService.schAreaSearch(c_no, searchKeyword);
			mav.addObject("schAreaSearch",schAreaSearch);
		}

		mav.addObject("togetherList", togetherList);
		mav.addObject("scheduleList", scheduleList);
		mav.addObject("sch", scheduleModel1);
		mav.addObject("areaList",areaList);
		mav.setViewName("scheduleArea");
		
		return mav;
	}
	
	@RequestMapping("scheduleComplete.go")
	public ModelAndView scheduleComplete(HttpServletRequest request, ScheduleModel scheduleModel) throws Exception{
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		
		scheduleService.scheduleComplete(s_no);
		scheduleService.scheduleCompleteCount(s_no);
		
		mav.setViewName("schedule/scheduleComplete");
		
		return mav;
	}
	
	@RequestMapping("insertArea.go")
	public ModelAndView insertArea(HttpServletRequest request, ScheduleModel scheduleModel) throws Exception{
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_idx = Integer.parseInt(request.getParameter("s_idx"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		int state_no = Integer.parseInt(request.getParameter("state_no"));

		scheduleModel.setS_no(s_no);
		scheduleModel.setS_idx(s_idx);
		scheduleModel.setA_no(a_no);
		
		scheduleService.insertArea(scheduleModel);
		
		if(request.getParameter("a_cate")!=null){
			int a_cate = Integer.parseInt(request.getParameter("a_cate"));
			mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
		}else{
			mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
		}
		
		return mav;
	}
	
	@RequestMapping("deleteArea.go")
	public ModelAndView deleteArea(HttpServletRequest request, ScheduleModel scheduleModel) throws Exception{
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_idx = Integer.parseInt(request.getParameter("s_idx"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		int state_no = Integer.parseInt(request.getParameter("state_no"));
		int s_detail_turn = Integer.parseInt(request.getParameter("s_detail_turn"));
		
		scheduleModel.setS_no(s_no);
		scheduleModel.setS_idx(s_idx);
		scheduleModel.setA_no(a_no);
		scheduleModel.setS_detail_turn(s_detail_turn);
		
		scheduleService.deleteArea(scheduleModel);
		
		if(request.getParameter("a_cate")!=null){
			int a_cate = Integer.parseInt(request.getParameter("a_cate"));
			mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
		}else{
			mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
		}
		
		return mav;
	}
	
	@RequestMapping("scheduleCity.go")
	public ModelAndView scheduleCity(HttpServletRequest request, ScheduleModel scheduleModel, HttpSession session) throws Exception{
		
		int state_no = Integer.parseInt(request.getParameter("state_no"));
		
		scheduleModel.setM_email((String)session.getAttribute("session_m_email"));
		scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
		
		scheduleModel = scheduleService.scheduleWriteSelect(scheduleModel);
		
		List<CityModel> cityList = cityService.stateCityList(state_no);
		
		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			List<CityModel> citySearchList = cityService.citySearchList(state_no, keyword);
			mav.addObject("citySearchList",citySearchList);
		}
		
		mav.addObject("sch", scheduleModel);
		mav.addObject("cityList",cityList);
		mav.setViewName("scheduleCity");
		
		return mav;
	}
	
	//일정 순서 변경
		@RequestMapping("turnUp.go")
		public ModelAndView turnUp(HttpServletRequest request, ScheduleModel scheduleModel){
			
			int state_no = Integer.parseInt(request.getParameter("state_no"));
			int c_no = Integer.parseInt(request.getParameter("c_no"));
			int s_idx = Integer.parseInt(request.getParameter("s_idx"));
			
			scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
			scheduleModel.setS_detail_turn(Integer.parseInt(request.getParameter("s_detail_turn")));
			scheduleModel.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
			scheduleModel = scheduleService.selectNextTurn(scheduleModel);
			
			int turn = scheduleModel.getS_detail_turn();
			int s_detail_turn = Integer.parseInt(request.getParameter("s_detail_turn"));
			int s_no = Integer.parseInt(request.getParameter("s_no"));
			scheduleService.preTurnUp(turn, s_no, s_detail_turn, s_idx);
			
			int s_detail_no = scheduleModel.getS_detail_no();
			scheduleService.nextTurnDown(s_no, s_detail_turn, s_detail_no, s_idx);
			
			if(request.getParameter("a_cate")!=null){
				int a_cate = Integer.parseInt(request.getParameter("a_cate"));
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
			}else{
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
			}
			
			return mav;
		}
		
		//일정 순서 변경
		@RequestMapping("turnDown.go")
		public ModelAndView turnDown(HttpServletRequest request, ScheduleModel scheduleModel){
			
			int state_no = Integer.parseInt(request.getParameter("state_no"));
			int c_no = Integer.parseInt(request.getParameter("c_no"));
			int s_idx = Integer.parseInt(request.getParameter("s_idx"));
			
			scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
			scheduleModel.setS_detail_turn(Integer.parseInt(request.getParameter("s_detail_turn")));
			scheduleModel.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
			scheduleModel = scheduleService.selectPreTurn(scheduleModel);
			
			int turn = scheduleModel.getS_detail_turn();
			int s_detail_turn = Integer.parseInt(request.getParameter("s_detail_turn"));
			int s_no = Integer.parseInt(request.getParameter("s_no"));
			scheduleService.preTurnUp(turn, s_no, s_detail_turn, s_idx);
			
			int s_detail_no = scheduleModel.getS_detail_no();
			scheduleService.nextTurnDown(s_no, s_detail_turn, s_detail_no, s_idx);
			
			if(request.getParameter("a_cate")!=null){
				int a_cate = Integer.parseInt(request.getParameter("a_cate"));
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
			}else{
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
			}
			
			return mav;
		}
		
		//일정 메모
		@RequestMapping("writeMemo.go")
		public ModelAndView writeMemo(HttpServletRequest request, ScheduleModel scheduleModel){
			
			int state_no = Integer.parseInt(request.getParameter("state_no"));
			int c_no = Integer.parseInt(request.getParameter("c_no"));
			int s_idx = Integer.parseInt(request.getParameter("s_idx"));
			int s_no = Integer.parseInt(request.getParameter("s_no"));
			
			scheduleService.writeMemo(scheduleModel);
			
			if(request.getParameter("a_cate")!=null){
				int a_cate = Integer.parseInt(request.getParameter("a_cate"));
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
			}else{
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
			}
			
			return mav;
		}
	
	@RequestMapping("emailExist.go")
	public ModelAndView idCheck(HttpServletRequest request) throws Exception{
		int chk;	
		
		MemberModel member = new MemberModel();
		
		member = memberService.getEmailDuplChk(request.getParameter("emailExist"));
		
		//아이디 없음
		if(member==null){
			chk = 0;
			mav.addObject("chk", chk);
			mav.setViewName("schedule/emailExist");
			return mav;
		//아이디 있음
		}else{
			chk = 1;
			mav.addObject("chk", chk);
			mav.setViewName("schedule/emailExist");
			return mav;
		}
	}
	
	//일정게시판 글 상세보기
	@RequestMapping("scheduleDetail.go")
	public ModelAndView scheduleDetail0(HttpServletRequest request, HttpSession session){
	
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_cate = Integer.parseInt(request.getParameter("s_cate"));
		int zzim = 0;
		
		//일정을 찜했는지 안했는지 보여주기위해
		if(session.getAttribute("session_m_email") != null){
			String m_email = (String)session.getAttribute("session_m_email");
			zzim = (Integer)(scheduleService.zzimCheck(m_email, s_no));
		}
		
			
		//리스트에서 상세보기로 갈때만 조회수 오르도록 조건달기
		//내부카테고리(상세보기/일정표/코멘트) 이동시에는 조회수 올라가지 않도록
		//s_count 의 디폴트값 0 이고, 1일떄만 조회수 상승
		int s_count = 0;
		if(request.getParameter("s_count") != null){
			s_count = Integer.parseInt(request.getParameter("s_count"));
		}
		
		//공통부분
		ScheduleModel scheduleModel = scheduleService.scheduleDetail(s_no);
		int areaCount = scheduleService.areaCount(s_no);
		int sch_commCount = scheduleService.sch_commCount(s_no);
		ScheduleModel s_idx = scheduleService.selectS_idx(s_no);
		ScheduleModel state_city = scheduleService.selectStateCity(s_no);
		
		//상세보기 일때
		if(s_cate == 0){
			//리스트->상세보기 일때 조회수 올리기
			if(s_count == 0){
				scheduleService.scheduleUpdateReadhit(s_no);
			}
			s_count = 1;
			
			//상세보기/Day
			List<ScheduleModel> schDetailDay = scheduleService.schDetail(s_no);
			mav.addObject("schDetailDay", schDetailDay);
			
			List<Object> dayList = new ArrayList<Object>();
			
			//상세보기/Day별 일정리스트
			for(int i = 1; i <= schDetailDay.size(); i++){
				List<ScheduleModel> day = scheduleService.DayList(i, s_no);
				dayList.add(day);
			}
			mav.addObject("dayList", dayList);
			
		}
		//일정표 일떄
		else if(s_cate == 1){
			s_count = 1;
		}
		//코멘트 일때
		else if(s_cate == 2){
			List<SchCommentModel> schCommentList = scheduleService.sch_comList(s_no);
			s_count = 1;
			
			mav.addObject("schCommentList", schCommentList);
		}
		
		//일정 공유중인 회원이메일 리스트 불러오기
		List<ScheduleModel> s_together = scheduleService.s_together(s_no);
		
		//지도에 마커로 표시할 여행지 리스트 불러오기
		List<ScheduleModel> mapList = scheduleService.mapList(s_no);
		
		mav.addObject("s_idx", s_idx);
		mav.addObject("state_city", state_city);
		mav.addObject("s_together", s_together);
		mav.addObject("mapList", mapList);
		mav.addObject("zzim", zzim);
		mav.addObject("scheduleModel", scheduleModel);
		mav.addObject("s_cate", s_cate);
		mav.addObject("sch_commCount", sch_commCount);
		mav.addObject("areaCount", areaCount);
		mav.addObject("s_count", s_count);
		mav.setViewName("scheduleDetail");
		
		return mav;
	}
	
	//일정게시판 글 삭제하기
	@RequestMapping("scheduleDelete.go")
	public String scheduleDelete(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		scheduleService.deleteSchedule(s_no);
		
		return "redirect:scheduleList.go?currentPage="+currentPage;
	}
	
	//일정게시판 코멘트 쓰기
	@RequestMapping("schComment.go")
	public String schComment(HttpServletRequest request, SchCommentModel schCommentModel){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		schCommentModel.setS_no(s_no);
		String m_email = request.getParameter("m_email");
		schCommentModel.setM_email(m_email);
		
		scheduleService.schComment(schCommentModel);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=2&s_count=1";
		
	}
	
	//일정게시판 코멘트 삭제
	@RequestMapping("schCommentDelete.go")
	public String schCommentDelete(HttpServletRequest request){
		
		int s_co_no = Integer.parseInt(request.getParameter("s_co_no"));
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		scheduleService.schCommentDelete(s_co_no);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=2&s_count=1";
	}
	
	//찜하기
	@RequestMapping("schZzim1.go")
	public String schZzim1(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		
		scheduleService.schZzim1(s_no, m_email);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
	}
	
	//찜 하기 해제
	@RequestMapping("schZzim2.go")
	public String schZzim2(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		
		scheduleService.schZzim2(s_no, m_email);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
	}
	
	//내 일정으로 가져오기
	@RequestMapping("schDownload.go")
	public String schDownload(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		String s_name = (String) request.getParameter("s_name");
		
		//선택한 일정 불러오기
		ScheduleModel scheduleModel = scheduleService.scheduleDetail(s_no);
		//선택한 일정의 디테일리스트 불러오기
		List<ScheduleModel> schDetailList = scheduleService.schDetailList(s_no);
		
		//내 일정으로 복사하기(m_email 바꿔서 insert 하기)
		scheduleModel.setM_email(m_email);
		scheduleModel.setS_name(s_name);
		String subject = scheduleModel.getS_name();
		scheduleModel.setS_name("<스크랩>"+subject);
		
		//sch테이블에 새로 넣은 일정의 s_no받아오기
		int ss_no = scheduleService.schDownload(scheduleModel);
		System.out.println("ss_no : "+ss_no);
		
		//받은 ss_no값 넘겨주기
		scheduleService.schDownDetail(schDetailList, ss_no);
		
		//마이페이지 - 내 일정 보기 페이지로 넘어가기
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
		
		
	}


}
