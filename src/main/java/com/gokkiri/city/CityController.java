package com.gokkiri.city;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gokkiri.area.AreaModel;
import com.gokkiri.qna.QnAModel;
import com.gokkiri.area.AreaReviewModel;
import com.gokkiri.area.AreaService;
import com.gokkiri.schedule.ScheduleModel;
import com.gokkiri.schedule.ScheduleService;

@Controller
@RequestMapping("/city")
public class CityController {
	
	@Resource(name="cityService")
	private CityService cityService;
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	private static final String uploadPath = "C:\\Users\\ChoiSuHyun\\workspace\\git\\Gokkiri\\src\\main\\webapp\\resources\\city_img\\";
	
	//도시 리스트 보기
	@RequestMapping("cityList.go")
	public ModelAndView cityList(HttpServletRequest request) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		List<CityModel> seoulList = cityService.cityList(1);
		List<CityModel> busanList = cityService.cityList(2);
		List<CityModel> daeguList = cityService.cityList(3);
		List<CityModel> incheonList = cityService.cityList(4);
		List<CityModel> gwangjuList = cityService.cityList(5);
		List<CityModel> daejeonList = cityService.cityList(6);
		List<CityModel> ulsanList = cityService.cityList(7);
		List<CityModel> gyeonggiList = cityService.cityList(8);
		List<CityModel> gangwonList = cityService.cityList(9);
		List<CityModel> chungbukList = cityService.cityList(10);
		List<CityModel> chungnamList = cityService.cityList(11);
		List<CityModel> jeonbukList = cityService.cityList(12);
		List<CityModel> jeonnamList = cityService.cityList(13);
		List<CityModel> gyeongbukList = cityService.cityList(14);
		List<CityModel> gyeongnamList = cityService.cityList(15);
		List<CityModel> jejuList = cityService.cityList(16);
		
		mav.addObject("seoulList", seoulList);
		mav.addObject("busanList", busanList);
		mav.addObject("daeguList", daeguList);
		mav.addObject("incheonList", incheonList);
		mav.addObject("gwangjuList", gwangjuList);
		mav.addObject("daejeonList", daejeonList);
		mav.addObject("ulsanList", ulsanList);
		mav.addObject("gyeonggiList", gyeonggiList);
		mav.addObject("gangwonList", gangwonList);
		mav.addObject("chungbukList", chungbukList);
		mav.addObject("chungnamList", chungnamList);
		mav.addObject("jeonbukList", jeonbukList);
		mav.addObject("jeonnamList", jeonnamList);
		mav.addObject("gyeongbukList", gyeongbukList);
		mav.addObject("gyeongnamList", gyeongnamList);
		mav.addObject("jejuList", jejuList);
		mav.setViewName("cityList");
		
		return mav;
		
		
	}
	
	//도시 글쓰기 폼 이동
	@RequestMapping("cityWriteForm.go")
	public ModelAndView cityWriteForm(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		int state_no = Integer.parseInt(request.getParameter("state_no"));
		String state_name = cityService.stateSelect(state_no);
		
		mav.addObject("state_name", state_name);
		mav.setViewName("cityWriteForm");
		return mav;
	}
	
	//도시 글쓰기
	@RequestMapping("cityWrite.go")
	public ModelAndView cityWrite(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, CityModel cityModel) throws Exception{
		
		//줄바꿈
		String c_con = cityModel.getC_con().replaceAll("\r\n", "<br/>");
		cityModel.setC_con(c_con);
		
		//첨부파일을 제외한 글쓰기 등록
		cityService.cityWrite(cityModel);
		int c_no = cityService.selectSeq();
		
		//첨부파일 등록↓↓↓
		File dir = new File(uploadPath);		
		//uploadPath 경로에 폴더가 없으면 새로 생성
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		
		int c_img_index;
	
		
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
				
				//이미지 슬라이드에서 보여줄 첫번째 이미지에 인덱스 부여
				if(i==0){
					c_img_index = 1;
				}else{
					c_img_index = 0;
				}
	
				cityService.fileupload(originalFilename, saveFilename, c_img_index, c_no);
			}		
		}
	
		return new ModelAndView("redirect:cityList.go");
	}

	// 도시 글 상세보기
	@RequestMapping("cityDetail.go")
	public ModelAndView cityDetail(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String keyword = request.getParameter("keyword");
		
		CityModel cityModel = cityService.cityDetail(c_no);
		List<CityModel> city_imgList = cityService.city_imgList(c_no);
		System.out.println(cityService.city_imgList(c_no));
		int img_count = city_imgList.size();
		List<AreaReviewModel> areaReviewList = cityService.areaReviewList(c_no);
		List<QnAModel> cityqnaList = cityService.cityqnaList(c_no);
		
		List<ScheduleModel> scheduleList =  scheduleService.scheduleSearchList(keyword);
		List<AreaModel> areaList = areaService.areaCountList();

		mav.addObject("scheduleList", scheduleList);
		mav.addObject("areaList", areaList);
		
		mav.addObject("areaReviewList", areaReviewList);
		mav.addObject("cityModel", cityModel);
		mav.addObject("city_imgList", city_imgList);
		mav.addObject("img_count", img_count);
		mav.addObject("cityqnaList", cityqnaList);
		
		if(request.getParameter("keyword").equals("info")){
			mav.setViewName("city/cityDetail");
			return mav;
		}else{
			mav.setViewName("cityDetail");
			return mav;
		}
	}
	
	//도시 글 수정하기 폼
		@RequestMapping("cityModifyForm.go")
		public ModelAndView cityModifyForm(HttpServletRequest request){
			
			ModelAndView mav = new ModelAndView();
			
			int c_no = Integer.parseInt(request.getParameter("c_no"));
			
			//함께 저장된 이미지 파일의 원본이름 불러오기
			List<CityModel> imgList = cityService.imgList(c_no); 
			
			CityModel cityModel = cityService.cityDetail(c_no);
			//줄바꿈 <br/> 다시 \r\n으로 바꾸기
			String c_con = cityModel.getC_con().replaceAll("<br/>", "\r\n");
			cityModel.setC_con(c_con);
			
			mav.addObject("imgList", imgList);
			mav.addObject("cityModel", cityModel);
			mav.setViewName("cityModifyForm");
			
			return mav;
			
		}
		
	//도시 글 수정하기
	@RequestMapping("cityModify.go")
	public String cityModify(HttpServletRequest request,MultipartHttpServletRequest multipartHttpServletRequest, CityModel cityModel) throws Exception{
		
		//줄바꿈
		String c_con = cityModel.getC_con().replaceAll("\r\n", "<br/>");
		cityModel.setC_con(c_con);
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		cityModel.setC_no(c_no);
		
		int c_img_index;
		
		//첨부파일 제외하고 수정하기
		cityService.cityModify(cityModel);
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");
		
		//첨부파일 수정하기(첨부파일 다시 등록이 안되어있으면 그냥 넘어가기)
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")){
			
		}else{
			
			//기존의 첨부파일들 삭제하기
			cityService.fileDelete(c_no);
			
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
					c_img_index = 1;
				}else{
					c_img_index = 0;
				}
				
				cityService.fileupload(originalFilename, saveFilename, c_img_index, c_no);
					
			}
		}
		
		String keyword = request.getParameter("keyword");
		
		return "redirect:cityDetail.go?c_no="+c_no+"&keyword="+URLEncoder.encode(keyword, "euc-kr");
	}
	
	//도시 글 삭제하기
	@RequestMapping("cityDelete.go")
	public String cityDelete(HttpServletRequest request){
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		
		cityService.cityDelete(c_no);
		
		return "redirect:cityList.go";
	}
}
