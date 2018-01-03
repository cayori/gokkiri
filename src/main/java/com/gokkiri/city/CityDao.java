package com.gokkiri.city;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.gokkiri.area.AreaModel;
import com.gokkiri.area.AreaReviewModel;
import com.gokkiri.qna.QnAModel;

public interface CityDao {
	
	public List<CityModel> citySearchList(int state_no, String keyword);
	
	//스케쥴 - 도시 리스트 보기
	public List<CityModel> stateCityList(int state_no);
	
	//도시 리스트 보기
	public List<CityModel> cityList(int state_no);
	
	//도시 상세보기
	public CityModel cityDetail(int c_no);
	
	//도시 글쓰기폼 불러올때 state_name 불러오기
	public String stateSelect(int state_no);
	
	//도시 글쓰기
	public Object cityWrite(CityModel cityModel);
	
	//도시 글 수정할때 이미지 원본이름 같이 불러오기
	public List<CityModel> imgList(int c_no);
	
	//도시 글 수정하기
	public void cityModify(CityModel cityModel);
	
	//수정할때 이미지첨부파일이 새로 입력되면 기존의 이미지첨부파일 삭제하기
	public void fileDelete(int c_no);
	
	//도시 글 삭제하기
	public void cityDelete(int c_no);
	
	//파일 업로드 할때 c_no 보내주기
	public int selectSeq();
		
	//파일 업로드
	public void fileupload(String originalfileName, String saveFilename, int c_img_index, int c_no);

	//도시 상세보기 할때 이미지 리스트도 불러오기
	public List<CityModel> city_imgList(int c_no);
	
	public CityModel main_img(int c_no);
	
	//도시 상세보기 할때 여행지 리뷰리스트 모두 불러오기
	public List<AreaReviewModel> areaReviewList(int c_no);

	public List<QnAModel> cityqnaList(int c_no);

}
