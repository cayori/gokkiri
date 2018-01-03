package com.gokkiri.area;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface AreaDao {
	
	public List<AreaModel> schAreaSearch(int c_no, String searchKeyword);
	
	public List<AreaModel> schAreaList(int c_no);
	
	public List<AreaModel> schAreaCateList(int c_no, int a_cate);
	
	//스케쥴 - 지역번호로 여행지 리스트 전체 불러오기
	public List<AreaModel> markerAreaList(int c_no, int s_no, int s_idx);
	
	//스케쥴 - 카테고리 구분
	public List<AreaModel> markerAreaCateList(int c_no, int a_cate, int s_no, int s_idx);
	
	//스케쥴 - 지역번호로 여행지 리스트 전체 불러오기
	public List<AreaModel> cityAreaList(int c_no);
	
	//스케쥴 - 지역번호, 카테고리로 여행지 리스트 불러오기
	public List<AreaModel> cityAreaCateList(int c_no, int a_cate);
	
	//여행지 리스트 보기
	public List<AreaModel> areaList(int a_cate, int c_no); 
	
	//여행지 리스트 - 검색
	public List<AreaModel> areaSearch(String searchKeyword, int a_cate, int c_no);
	
	//메인에서 인기 여행지 리스트 불러오기
	public List<AreaModel> areaCountList();
	
	//여행지 글쓰기
	public int areaWrite(AreaModel areaModel);
	
	//파일 업로드 할때 a_no 보내주기
	public int selectSeq();
	
	//파일 업로드
	public void fileupload(String originalfileName, String saveFilename, int a_img_index, int a_no);

	//여행지 상세보기
	public AreaModel areaDetail(int a_no);
	
	//여행지 상세보기 할때 이미지 리스트도 불러오기
	public List<AreaModel> area_imgList(int a_no);
	
	//여행지 상세보기 할때 이미지 갤러리의 메인 이미지 불러오기
	public String main_img(int a_no);
	
	//여행지 상세보기 할때 리뷰 리스트 불러오기
	public List<AreaReviewModel> areaReviewList(int a_no);
	
	//여행지 상세보기 할때 리뷰 평점 불러오기
	public int revScoreAvg(int a_no);
	
	//여행지 글 수정할때 카테고리 구하기
	public int areaCate(int a_no);
	
	//여행지 글 수정할때 이미지 원본이름 같이 불러오기
	public List<AreaModel> imgList(int a_no);
	
	//여행지 글 수정하기
	public void areaModify(AreaModel areaModel);
	
	//수정할때 이미지첨부파일이 새로 입력되면 기존의 이미지첨부파일 삭제하기
	public void fileDelete(int a_no);
	
	//여행지 글 삭제하기
	public void areaDelete(int a_no);
	
	//여행지 리뷰 쓰기
	public void areaReviewList(AreaReviewModel areaReviewModel);
	
	//여행지 리뷰 삭제하기
	public void areaReviewDelete(int r_no);
	
	//여행지 리뷰 개수 구하기
	public int revCount(int a_no);
	
	//여행지 QNA 개수 구하기
	public int qnaCount(int a_no);


}
