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
	
	//������ - ���� ����Ʈ ����
	@Override
	public List<CityModel> stateCityList(int state_no) {
		return sqlSessionTemplate.selectList("city.stateCityList", state_no);
	}


	//���� ����Ʈ ����
	@Override
	public  List<CityModel> cityList(int state_no) {
		return sqlSessionTemplate.selectList("city.cityList", state_no);
	}
	
	//���� �� �󼼺���
	@Override
	public CityModel cityDetail(int c_no) {
		return sqlSessionTemplate.selectOne("city.cityDetail", c_no);
	}
	
	//���� �۾��� �� �ҷ��ö� state_name�� �ҷ�����
	@Override
	public String stateSelect(int state_no) {
		return sqlSessionTemplate.selectOne("city.stateSelect", state_no);
	}

	//���� �۾���
	@Override
	public Object cityWrite(CityModel cityModel) {
		return sqlSessionTemplate.insert("city.cityWrite", cityModel);
	}
	
	//���� �� �����Ҷ� �̹��� �����̸� ���� �ҷ�����
	@Override
	public List<CityModel> imgList(int c_no) {
		return sqlSessionTemplate.selectList("city.imgList", c_no);
	}
	
	//���� �� �����ϱ�
	@Override
	public void cityModify(CityModel cityModel) {
		sqlSessionTemplate.update("city.cityModify",cityModel);
	}
	
	//�����Ҷ� �̹���÷�������� ���� �ԷµǸ� ������ �̹���÷������ �����ϱ�
	@Override
	public void fileDelete(int c_no) {
		sqlSessionTemplate.delete("city.fileDelete", c_no);
	}
	
	//���� �� �����ϱ�
	@Override
	public void cityDelete(int c_no) {
		sqlSessionTemplate.delete("city.cityDelete", c_no);
	}
	
	//���� ���ε��Ҷ� c_no�� �����ֱ�
	@Override
	public int selectSeq() {
		return sqlSessionTemplate.selectOne("city.selectSeq");
	}

	//���� ���ε�
	@Override
	public void fileupload(String originalFilename, String saveFilename, int c_img_index, int c_no) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("c_img_org", originalFilename);
		hm.put("c_img_sav", saveFilename);
		hm.put("c_img_index", c_img_index);
		hm.put("c_no", c_no);
		
		sqlSessionTemplate.insert("city.fileupload", hm);
	}


	//���� �󼼺��� �Ҷ� �̹��� ����Ʈ ���� �ҷ�����
	@Override
	public List<CityModel> city_imgList(int c_no) {
		return sqlSessionTemplate.selectList("city.city_imgList", c_no);
	}


	@Override
	public CityModel main_img(int c_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//���� �󼼺��� �Ҷ� ������ ���丮��Ʈ ��� �ҷ�����
	@Override
	public List<AreaReviewModel> areaReviewList(int c_no) {
		return sqlSessionTemplate.selectList("city.areaReviewList", c_no);
	}

	//���� �󼼺��� �Ҷ� ������ qna����Ʈ �ҷ�����
	@Override
	public List<QnAModel> cityqnaList(int c_no) {
		return sqlSessionTemplate.selectList("qna.qnaList", c_no);
	}



}
