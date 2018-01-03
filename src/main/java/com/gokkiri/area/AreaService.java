package com.gokkiri.area;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class AreaService implements AreaDao{ 
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<AreaModel> schAreaSearch(int c_no, String searchKeyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_no", c_no);
		map.put("searchKeyword", "%"+searchKeyword+"%");
		return sqlSessionTemplate.selectList("area.schAreaSearch", map);
	}
	
	@Override
	public List<AreaModel> schAreaList(int c_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.schAreaList", c_no);
	}

	@Override
	public List<AreaModel> schAreaCateList(int c_no, int a_cate) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("c_no", c_no);
		map.put("a_cate", a_cate);
		return sqlSessionTemplate.selectList("area.schAreaCateList", map);
	}
	
	//스케쥴
	@Override
	public List<AreaModel> markerAreaList(int c_no, int s_no, int s_idx) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("c_no", c_no);
		map.put("s_no", s_no);
		map.put("s_idx", s_idx);
			
		return sqlSessionTemplate.selectList("area.markerAreaList", map);
	}
	
	//스케쥴
	@Override
	public List<AreaModel> markerAreaCateList(int c_no, int a_cate, int s_no, int s_idx) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("c_no", c_no);
		map.put("a_cate", a_cate);
		map.put("s_no", s_no);
		map.put("s_idx", s_idx);
		
		return sqlSessionTemplate.selectList("area.markerAreaCateList", map);
	}
	
	//스케쥴 - 지역번호로 여행지 리스트 전체 불러오기
	@Override
	public List<AreaModel> cityAreaList(int c_no) {
		return sqlSessionTemplate.selectList("area.cityAreaList", c_no);
	}
	
	//스케쥴 - 지역번호, 카테고리번호로 여행지 리스트 불러오기
	@Override
	public List<AreaModel> cityAreaCateList(int c_no, int a_cate) {
	      
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("c_no", c_no);
		hm.put("a_cate", a_cate);
	      
		return sqlSessionTemplate.selectList("area.cityAreaCateList", hm);
		
	}

	//여행지 리스트 보기
	@Override
	public List<AreaModel> areaList(int a_cate, int c_no) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("a_cate", a_cate);
		hm.put("c_no", c_no);
		
		return sqlSessionTemplate.selectList("area.areaList", hm);
	}
	
	//여행지 리스트 - 검색
	@Override
	public List<AreaModel> areaSearch(String searchKeyword, int a_cate, int c_no) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchKeyword", "%" + searchKeyword + "%");
		hm.put("a_cate", a_cate);
		hm.put("c_no", c_no);
		
		return sqlSessionTemplate.selectList("area.areaSearch", hm);
		
	}
	
	//메인에서 인기 여행지 리스트 a_count로 불러오기
	@Override
	public List<AreaModel> areaCountList() {
		return sqlSessionTemplate.selectList("area.areaCountList");
	}

	//여행지 글쓰기
	@Override
	public int areaWrite(AreaModel areaModel){
		return sqlSessionTemplate.insert("area.areaWrite", areaModel);
	}
	
	//파일 업로드할때 a_no값 보내주기
	@Override
	public int selectSeq() {
		return sqlSessionTemplate.selectOne("area.selectSeq");
	}


	//파일 업로드
	@Override
	public void fileupload(String originalFilename, String saveFilename, int a_img_index, int a_no) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("a_img_org", originalFilename);
		hm.put("a_img_sav", saveFilename);
		hm.put("a_img_index", a_img_index);
		hm.put("a_no", a_no);
		
		sqlSessionTemplate.insert("area.fileupload", hm);
	}

	//여행지 글 상세보기
	@Override
	public AreaModel areaDetail(int a_no) {
		return sqlSessionTemplate.selectOne("area.areaDetail", a_no);
	}

	//여행지 상세보기 할때 이미지 리스트 같이 불러오기
	@Override
	public List<AreaModel> area_imgList(int a_no) {
		return sqlSessionTemplate.selectList("area.area_imgList", a_no);
	}

	//여행지 상세보기 할때 이미지 갤러리의 메인 이미지 불러오기
	@Override
	public String main_img(int a_no) {
		return sqlSessionTemplate.selectOne("area.main_img", a_no);
	}
	
	//여행지 상세보기 할때 리뷰 리스트 불러오기
	@Override
	public List<AreaReviewModel> areaReviewList(int a_no) {
		return sqlSessionTemplate.selectList("area.areaReviewList", a_no);
	}

	//여행지 글 수정할때 카테고리 구하기
	@Override
	public int areaCate(int a_no) {
		return sqlSessionTemplate.selectOne("area.areaCate", a_no);
	}
	
	//여행지 글 수정할때 이미지 원본이름 같이 불러오기
	@Override
	public List<AreaModel> imgList(int a_no) {
		return sqlSessionTemplate.selectList("area.imgList", a_no);
	}
	
	//여행지 글 수정하기
	@Override
	public void areaModify(AreaModel areaModel) {
		sqlSessionTemplate.update("area.areaModify",areaModel);
	}
	
	//수정할때 이미지첨부파일이 새로 입력되면 기존의 이미지첨부파일 삭제하기
	@Override
	public void fileDelete(int a_no) {
		sqlSessionTemplate.delete("area.fileDelete", a_no);
	}

	//여행지 글 삭제하기
	@Override
	public void areaDelete(int a_no) {
		sqlSessionTemplate.update("area.areaDelete", a_no);
	}

	//여행지 리뷰 쓰기
	@Override
	public void areaReviewList(AreaReviewModel areaReviewModel) {
		sqlSessionTemplate.insert("area.areaReview", areaReviewModel);
	}
	
	//여행지 리뷰 삭제하기
	@Override
	public void areaReviewDelete(int r_no) {
		sqlSessionTemplate.delete("area.araeReviewDelete", r_no );
	}

	//여행지 리뷰 개수 구하기
	@Override
	public int revCount(int a_no) {
		return sqlSessionTemplate.selectOne("area.revCount", a_no);
	}
	
	//여행지 리뷰 평점 구하기
	@Override
	public int revScoreAvg(int a_no) {
		
		int revScoreAvg;
		
		if(sqlSessionTemplate.selectOne("area.revScoreAvg", a_no) == null){
			revScoreAvg = 0;
		}else{
			revScoreAvg = sqlSessionTemplate.selectOne("area.revScoreAvg", a_no);
		}
		
		return revScoreAvg;
		
	}

	//여행지 QNA 개수 구하기
	@Override
	public int qnaCount(int a_no) {
		return sqlSessionTemplate.selectOne("area.qnaCount", a_no);
	}


	

}
