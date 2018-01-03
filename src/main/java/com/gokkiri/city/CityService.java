package com.gokkiri.city;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.gokkiri.area.AreaModel;
import com.gokkiri.area.AreaReviewModel;
import com.gokkiri.qna.QnAModel;

@Service
public class CityService implements CityDao{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<CityModel> citySearchList(int state_no, String keyword) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("state_no", state_no);
		map.put("keyword", "%"+keyword+"%");
		
		return sqlSessionTemplate.selectList("city.citySearchList", map);
	}
	
	//스케쥴 - 도시 리스트 보기
	@Override
	public List<CityModel> stateCityList(int state_no) {
		return sqlSessionTemplate.selectList("city.stateCityList", state_no);
	}


	//도시 리스트 보기
	@Override
	public  List<CityModel> cityList(int state_no) {
		return sqlSessionTemplate.selectList("city.cityList", state_no);
	}
	
	//도시 글 상세보기
	@Override
	public CityModel cityDetail(int c_no) {
		return sqlSessionTemplate.selectOne("city.cityDetail", c_no);
	}
	
	//도시 글쓰기 폼 불러올때 state_name도 불러오기
	@Override
	public String stateSelect(int state_no) {
		return sqlSessionTemplate.selectOne("city.stateSelect", state_no);
	}

	//도시 글쓰기
	@Override
	public Object cityWrite(CityModel cityModel) {
		return sqlSessionTemplate.insert("city.cityWrite", cityModel);
	}
	
	//도시 글 수정할때 이미지 원본이름 같이 불러오기
	@Override
	public List<CityModel> imgList(int c_no) {
		return sqlSessionTemplate.selectList("city.imgList", c_no);
	}
	
	//도시 글 수정하기
	@Override
	public void cityModify(CityModel cityModel) {
		sqlSessionTemplate.update("city.cityModify",cityModel);
	}
	
	//수정할때 이미지첨부파일이 새로 입력되면 기존의 이미지첨부파일 삭제하기
	@Override
	public void fileDelete(int c_no) {
		sqlSessionTemplate.delete("city.fileDelete", c_no);
	}
	
	//도시 글 삭제하기
	@Override
	public void cityDelete(int c_no) {
		sqlSessionTemplate.delete("city.cityDelete", c_no);
	}
	
	//파일 업로드할때 c_no값 보내주기
	@Override
	public int selectSeq() {
		return sqlSessionTemplate.selectOne("city.selectSeq");
	}

	//파일 업로드
	@Override
	public void fileupload(String originalFilename, String saveFilename, int c_img_index, int c_no) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("c_img_org", originalFilename);
		hm.put("c_img_sav", saveFilename);
		hm.put("c_img_index", c_img_index);
		hm.put("c_no", c_no);
		
		sqlSessionTemplate.insert("city.fileupload", hm);
	}


	//도시 상세보기 할때 이미지 리스트 같이 불러오기
	@Override
	public List<CityModel> city_imgList(int c_no) {
		return sqlSessionTemplate.selectList("city.city_imgList", c_no);
	}


	@Override
	public CityModel main_img(int c_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//도시 상세보기 할때 여행지 리뷰리스트 모두 불러오기
	@Override
	public List<AreaReviewModel> areaReviewList(int c_no) {
		return sqlSessionTemplate.selectList("city.areaReviewList", c_no);
	}

	//도시 상세보기 할때 여행지 qna리스트 불러오기
	@Override
	public List<QnAModel> cityqnaList(int c_no) {
		return sqlSessionTemplate.selectList("qna.qnaList", c_no);
	}



}
