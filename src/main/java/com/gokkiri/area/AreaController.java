package com.gokkiri.area;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gokkiri.schedule.ScheduleModel;
import com.gokkiri.schedule.ScheduleService;

import org.apache.commons.io.FilenameUtils;

@Controller
@RequestMapping("/area")
public class AreaController { 
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	private static final String uploadPath = "C:\\Users\\ChoiSuHyun\\workspace\\git\\Gokkiri\\src\\main\\webapp\\resources\\area_img\\";
	int totalCount;
	int a_cate;
	int a_img_index;
	
	//여행지 리스트 보기
	@RequestMapping("areaList.go")
	public ModelAndView areaList(HttpServletRequest request) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		List<AreaModel> areaList = null;
		
		String searchKeyword = request.getParameter("searchKeyword");
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String keyword = request.getParameter("keyword");
		
		//검색 로직
		if(searchKeyword != null){
			searchKeyword = new String(searchKeyword);
			
			a_cate = Integer.parseInt(request.getParameter("a_cate"));
			
			areaList = areaService.areaSearch(searchKeyword, a_cate, c_no);

			totalCount = areaList.size();
			
			List<ScheduleModel> scheduleList =  scheduleService.scheduleSearchList(keyword);
			
			mav.addObject("scheduleList", scheduleList);
			mav.addObject("areaList", areaList);
			mav.addObject("totalCount", totalCount);
			mav.addObject("searchKeyword", searchKeyword);
			mav.setViewName("areaList");
			
			return mav;
		}
		
		a_cate = Integer.parseInt(request.getParameter("a_cate"));
		
		areaList = areaService.areaList(a_cate, c_no);

		totalCount = areaList.size();
		List<ScheduleModel> scheduleList =  scheduleService.scheduleSearchList(keyword);
		
		mav.addObject("scheduleList", scheduleList);
		mav.addObject("areaList", areaList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("areaList");
		
		return mav;
	}
	
	//여행지 글쓰기 폼 이동
	@RequestMapping("areaWriteForm.go")
	public ModelAndView areaWriteForm(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("areaWriteForm");
		return mav;
	}
	
	//여행지 글쓰기 폼에서 주소검색 폼 불러오기
	@RequestMapping("areaSearchMap.go")
	public String areaSearchMap(HttpServletRequest request){
		return "area/areaSearchMap";
	}
	
	//여행지 글쓰기
	@RequestMapping("areaWrite.go")
	public ModelAndView areaWrite(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, AreaModel areaModel) throws Exception{
		
		//줄바꿈
		String a_con = areaModel.getA_con().replaceAll("\r\n", "<br/>");
		areaModel.setA_con(a_con);
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String keyword = request.getParameter("keyword");
		
		//첨부파일을 제외한 글쓰기 등록
		areaService.areaWrite(areaModel);
		int a_no = areaService.selectSeq();
		//첨부파일 등록↓↓↓
		
		File dir = new File(uploadPath);		
		//uploadPath 경로에 폴더가 없으면 새로 생성
		if(!dir.isDirectory()){
			dir.mkdir();
		}
	
		
		//콘솔에 uploadPath 출력
		System.out.println("uploadPath : "+ uploadPath);
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");

		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
            
        } else {
			//첨부파일이 없으면 글쓰기가 안되도록 수정해야함
			for(int i=0; i<mf.size(); i++){
				//파일 중복명 처리
				String genId = UUID.randomUUID().toString();
				//본래 파일명
				String originalFilename = mf.get(i).getOriginalFilename();
				//저장되는 파일 이름
				String saveFilename = genId + "." + FilenameUtils.getExtension(originalFilename);
				//저장될 파일경로 + 파일 이름
				String savePath = uploadPath + saveFilename;
				//파일 저장
				mf.get(i).transferTo(new File(savePath));
				
				//리스트에서 보여줄 첫번째 이미지에 인덱스 부여
				if(i==0){
					a_img_index = 1;
				}else{
					a_img_index = 0;
				}
				
				areaService.fileupload(originalFilename, saveFilename, a_img_index, a_no);
			}	
		}
	
		return new ModelAndView("redirect:areaList.go?c_no="+c_no+"&a_cate="+areaModel.getA_cate()+"&keyword="+URLEncoder.encode(keyword, "euc-kr"));
	}
	
	//여행지 글 상세보기
	@RequestMapping("areaDetail.go")
	public ModelAndView areaDetail(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		String keyword = request.getParameter("keyword");
		
		AreaModel areaModel = areaService.areaDetail(a_no);
		List<AreaModel> area_imgList = areaService.area_imgList(a_no);
		String main_img = areaService.main_img(a_no);
		int img_count = area_imgList.size();
		List<AreaReviewModel> areaReviewList = areaService.areaReviewList(a_no);
		List<ScheduleModel> scheduleList =  scheduleService.scheduleSearchList(keyword);
		
		int revScoreAvg = areaService.revScoreAvg(a_no);
		int revCount = areaService.revCount(a_no);
		int qnaCount = areaService.qnaCount(a_no);
		
		mav.addObject("scheduleList", scheduleList);
		mav.addObject("areaModel", areaModel);
		mav.addObject("area_imgList", area_imgList);
		mav.addObject("main_img", main_img);
		mav.addObject("img_count", img_count);
		mav.addObject("areaReviewList", areaReviewList);
		mav.addObject("revCount", revCount);
		mav.addObject("revScoreAvg", revScoreAvg);
		mav.addObject("qnaCount", qnaCount);
		
		if(request.getParameter("keyword").equals("info")){
			mav.setViewName("area/areaDetail");
			return mav;
		}else{
			mav.setViewName("areaDetail");
			return mav;
		}
	}
	
	//여행지 글 수정하기 폼
	@RequestMapping("areaModifyForm.go")
	public ModelAndView areaModifyForm(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		
		//카테고리 확인
		int a_cate = areaService.areaCate(a_no);
		//함께 저장된 이미지 파일의 원본이름 불러오기
		List<AreaModel> imgList = areaService.imgList(a_no);
		
		AreaModel areaModel = areaService.areaDetail(a_no);
		//줄바꿈 <br/> 다시 \r\n으로 바꾸기
		String a_con = areaModel.getA_con().replaceAll("<br/>", "\r\n");
		areaModel.setA_con(a_con);
		
		mav.addObject("imgList", imgList);
		mav.addObject("a_cate", a_cate);
		mav.addObject("areaModel", areaModel);
		mav.setViewName("areaModifyForm");
		
		return mav;
		
	}
	
	//여행지 글 수정하기
	@RequestMapping("areaModify.go")
	public String areaModify(HttpServletRequest request,MultipartHttpServletRequest multipartHttpServletRequest, AreaModel areaModel) throws Exception{
		
		//줄바꿈
		String a_con = areaModel.getA_con().replaceAll("\r\n", "<br/>");
		areaModel.setA_con(a_con);
		
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		areaModel.setA_no(a_no);
		
		//첨부파일 제외하고 수정하기
		areaService.areaModify(areaModel);
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");
		
		//첨부파일 수정하기(첨부파일 다시 등록이 안되어있으면 그냥 넘어가기)
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")){
			
		}else{
	
			//기존의 첨부파일들 삭제하기
			areaService.fileDelete(a_no);
			
			File dir = new File(uploadPath);		
			//uploadPath 경로에 폴더가 없으면 새로 생성
			if(!dir.isDirectory()){
				dir.mkdir();
			}
		
			
			//콘솔에 uploadPath 출력
			System.out.println("uploadPath : "+ uploadPath);
		
			//첨부파일이 없으면 글쓰기가 안되도록 수정해야함
			for(int i=0; i<mf.size(); i++){
				//파일 중복명 처리
				String genId = UUID.randomUUID().toString();
				//본래 파일명
				String originalFilename = mf.get(i).getOriginalFilename();
				//저장되는 파일 이름
				String saveFilename = genId + "." + FilenameUtils.getExtension(originalFilename);
				//저장될 파일경로 + 파일 이름
				String savePath = uploadPath + saveFilename;
				//파일 저장
				mf.get(i).transferTo(new File(savePath));
				
				//리스트에서 보여줄 첫번째 이미지에 인덱스 부여
				if(i==0){
					a_img_index = 1;
				}else{
					a_img_index = 0;
				}
				
				areaService.fileupload(originalFilename, saveFilename, a_img_index, a_no);
					
			}
		}
		
		String keyword = request.getParameter("keyword");
		
		return "redirect:areaDetail.go?a_no="+a_no+"&keyword="+URLEncoder.encode(keyword, "euc-kr");
	}
	
	//여행지 글 삭제하기
	@RequestMapping("areaDelete.go")
	public String areaDelete(HttpServletRequest request) throws UnsupportedEncodingException{
		
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		
		areaService.areaDelete(a_no);
		String keyword = request.getParameter("keyword");
		
		return "redirect:areaList.go?a_cate=0&c_no="+c_no+"&keyword="+URLEncoder.encode(keyword, "euc-kr");
	}
	
	//여행지 리뷰 쓰기
	@RequestMapping("areaReview.go")
	public String areaReview(HttpServletRequest request, AreaReviewModel areaReviewModel) throws UnsupportedEncodingException{
		
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		areaReviewModel.setA_no(a_no);
		System.out.println("a_no : "+a_no);
		
		int r_score = Integer.parseInt(request.getParameter("r_score"));
		areaReviewModel.setR_score(r_score);
		System.out.println("r_score : "+ r_score);
		
		areaService.areaReviewList(areaReviewModel);
		String keyword = request.getParameter("keyword");
		
		return "redirect:areaDetail.go?a_no="+a_no+"&keyword="+URLEncoder.encode(keyword, "euc-kr");
		
		
	}
	
	//여행지 리뷰 삭제
	@RequestMapping("areaReviewDelete.go")
	public String areaReviewDelete(HttpServletRequest request) throws UnsupportedEncodingException{
		
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		String keyword = request.getParameter("keyword");
		
		areaService.areaReviewDelete(r_no);
		
		return "redirect:areaDetail.go?a_no="+a_no+"&keyword="+URLEncoder.encode(keyword, "euc-kr");
	}

  
	
  
}
