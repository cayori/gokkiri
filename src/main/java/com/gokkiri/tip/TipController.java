package com.gokkiri.tip;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.io.FileOutputStream;
import java.util.List;
import java.net.URLEncoder;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gokkiri.tip.TipModel;
import com.gokkiri.main.Paging;
import com.gokkiri.schedule.ScheduleModel;
import com.gokkiri.area.AreaModel;

import com.gokkiri.tip.TipCoModel;

import org.apache.commons.io.FilenameUtils;

@Controller
@RequestMapping("/tip")
public class TipController {

	String session_member_email;
	private static final String uploadPath = "C:\\Users\\js\\Desktop\\gokkiri\\src\\main\\webapp\\resources\\tip_img\\";
	int totalCount2;
	int t_no_index;
	int t_img_index;
	int t_no;
	private String m_email;

	private String pagingHtml;
	private Paging page;
	private int currentPage;

	private String isSearch;
	private int searchNum;

	private String isSearch2;
	private int searchNum2;

	@Resource
	private TipService tipService;

	// tip 리스트
	@RequestMapping("/tipList.go")
	public ModelAndView tipList(HttpServletRequest request, TipModel tipModel) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<TipModel> tipList = tipService.tipList();

		tipList = tipService.tipList();
		
		
		List<TipModel> tipHList = tipService.tipHList();

		tipHList = tipService.tipHList();

		/* 게시판 검색 */

		String keyword = request.getParameter("keyword");
		if (keyword != null)
			keyword = new String(keyword);

		if (keyword != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 0) {
				tipList = tipService.tipSearchW(keyword);
			} else if (searchNum == 1) {
				tipList = tipService.tipSearchS(keyword);
			}
		}
        /* 페이징  */
		int totalCount = tipList.size();
		page = new Paging("tip/tipList",currentPage, totalCount, 5, 5, keyword);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		tipList = tipList.subList(page.getStartCount(), lastCount);

		totalCount2 = tipList.size();

		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("totalCount2", totalCount2);
		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum", searchNum);
		mav.addObject("tipList", tipList);
		mav.addObject("tipHList", tipHList);
		mav.setViewName("tipList");

		return mav;
	}

	@RequestMapping("areaList.go")
	public ModelAndView areaList(HttpServletRequest request, TipModel tipModel) {
		ModelAndView mav = new ModelAndView();

		List<TipModel> areaList = tipService.areaList();

		areaList = tipService.areaList();

		mav.addObject("areaList", areaList);
		mav.setViewName("areaList");

		return mav;
	}

	// tip 상세보기
	@RequestMapping("/tipDetail.go")
	public ModelAndView tipDetail(HttpServletRequest request, HttpSession session, TipCoModel tipcoModel) {

		ModelAndView mav = new ModelAndView();

		int t_no = Integer.parseInt(request.getParameter("t_no"));

		TipModel tipModel = tipService.tipDetail(t_no);
		TipModel tip_imgList = tipService.tip_imgList(t_no);
		int t_hit = 0;
		if(request.getParameter("t_hit") != null){
			t_hit = Integer.parseInt(request.getParameter("t_hit"));
		}
	
		int t_cate = 0;
		//상세보기 일때
		if(t_cate == 0){
			//리스트->상세보기 일때 조회수 올리기
			if(t_hit == 0){
				tipService.tipUpdateReadHit(t_no);
				           
			}
			t_hit = 1;
			

		}
		
		

		List<TipCoModel> tipcommList;
		tipcommList = tipService.tipcommList(t_no);

		mav.addObject("tipcommList", tipcommList);
		mav.addObject("tipModel", tipModel);
		mav.addObject("tipcoModel", tipcoModel);
		mav.addObject("tip_imgList", tip_imgList);
		mav.setViewName("tipDetail");

		return mav;
	}

	// tip글수정
	@RequestMapping("tipModify.go")
	public ModelAndView tipModify(HttpServletRequest request, TipModel tipModel) {
		ModelAndView mav = new ModelAndView();
		tipModel = tipService.tipDetail(tipModel.getT_no());
		String t_con = tipModel.getT_con().replaceAll("\r\n", "<br>");
		tipModel.setT_con(t_con);

		mav.addObject("tipModel", tipModel);
		mav.setViewName("tipModify");

		return mav;
	}

	@RequestMapping("tipModifySuccess.go")
	public ModelAndView tipModify(@ModelAttribute("tipModel") TipModel tipModel, MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		String t_con = tipModel.getT_con().replaceAll("\r\n", "<br>");
		tipModel.setT_con(t_con);

		tipService.tipModify(tipModel);
		
		int t_no = Integer.parseInt(request.getParameter("t_no"));
		
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");

		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")){
			
		}else{
			
			tipService.fileDelete(tipModel.getT_no());
			
			for (int i = 0; i < mf.size(); i++) {
				String genId = UUID.randomUUID().toString();
				String originalfileName = mf.get(i).getOriginalFilename();
				String savefileName = genId + "." + FilenameUtils.getExtension(originalfileName);
				String savePath = uploadPath + savefileName;
	
				mf.get(i).transferTo(new File(savePath));
	
				if (i == 0) {
					t_img_index = 1;
				} else {
					t_img_index = 0;
				}
				tipService.fileupload(originalfileName, savefileName, t_img_index, t_no);
	
			}
		}

		mav.setViewName("redirect:/tip/tipList.go");
		return mav;

	}

	// tip 글쓰기
	@RequestMapping("tipWriteForm.go")
	public ModelAndView tipWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("tipWriteForm");
		return mav;
	}

	@RequestMapping("tipWrite.go")
	public ModelAndView tipWrite(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest,
			TipModel tipModel, HttpSession session) throws Exception {

		String t_con = tipModel.getT_con().replaceAll("\r\n", "<br>");
		tipModel.setT_con(t_con);

		m_email = (String) session.getAttribute("session_m_email");

		tipService.tipWrite(tipModel);
		int t_no = tipService.selectSeq();
		System.out.println("t_no : "+ t_no);
		
		File dir = new File(uploadPath);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		System.out.println("uploadPath : " + uploadPath);

		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");

		for (int i = 0; i < mf.size(); i++) {
			String genId = UUID.randomUUID().toString();
			String originalfileName = mf.get(i).getOriginalFilename();
			String savefileName = genId + "." + FilenameUtils.getExtension(originalfileName);
			String savePath = uploadPath + savefileName;

			mf.get(i).transferTo(new File(savePath));

			if (i == 0) {
				t_img_index = 1;
			} else {
				t_img_index = 0;
			}
			tipService.fileupload(originalfileName, savefileName, t_img_index, t_no);

		}
		return new ModelAndView("redirect:tipList.go");

	}

	// area검색
	@RequestMapping("areaSearch.go")
	public ModelAndView areaSearch(TipModel tipModel, HttpServletRequest request) throws UnsupportedEncodingException {

		ModelAndView mav = new ModelAndView();

		List<TipModel> areaList = tipService.areaList();
		areaList = tipService.areaList();

		String isSearch2 = request.getParameter("isSearch2");
		if (isSearch2 != null)
			isSearch2 = new String(isSearch2);

		if (isSearch2 != null) {
			searchNum2 = Integer.parseInt(request.getParameter("searchNum2"));

			if (searchNum2 == 0) {
				areaList = tipService.areaSearch(isSearch2);
			} else if (searchNum2 == 1) {
				areaList = tipService.areaSearch2(isSearch2);
			}

		}

		totalCount2 = areaList.size();

		mav.addObject("totalCount2", totalCount2);
		mav.addObject("isSearch2", isSearch2);
		mav.addObject("searchNum2", searchNum2);
		mav.addObject("areaList", areaList);
		mav.setViewName("tip/areaSearch");

		return mav;

	}

	// tip글 삭제하기
	@RequestMapping("tipDelete.go")
	public String tipDelete(HttpServletRequest request) {

		int t_no = Integer.parseInt(request.getParameter("t_no"));

		tipService.tipDelete(t_no);

		return "redirect:tipList.go?a_cate=0";
	}

	// 댓글작성
	@RequestMapping("tipcommWrite.go")
	public ModelAndView tipcommWrite(TipCoModel tipcoModel, HttpServletRequest request, HttpSession session) {

		int t_no = tipcoModel.getT_no();

		m_email = tipcoModel.getM_email();
		System.out.println(m_email);
		ModelAndView mav = new ModelAndView();
		String t_co_con = tipcoModel.getT_co_con().replaceAll("\r\n", "<br />");
		tipcoModel.setT_co_con(t_co_con);

		tipcoModel.setT_no(t_no);

		tipcoModel.setM_email(m_email);

		tipService.tipcommWrite(tipcoModel);

		mav.setViewName("redirect:/tip/tipDetail.go?t_no=" + tipcoModel.getT_no());

		return mav;
	}

	// 댓글삭제
	@RequestMapping("tipcommDelete.go")
	public ModelAndView tipcommDelete(HttpServletRequest request, TipCoModel tipcoModel, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		int t_co_no = Integer.parseInt(request.getParameter("t_co_no"));

		tipService.tipcommDelete(tipcoModel);
		// 지우는SQL 실행

		tipService.tipDetail(tipcoModel.getT_no());
		m_email = (String) session.getAttribute("session_m_email");

		mav.setViewName("redirect:/tip/tipDetail.go?t_no=" + tipcoModel.getT_no());

		return mav;
	}

}
