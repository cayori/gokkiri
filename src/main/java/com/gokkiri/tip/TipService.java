package com.gokkiri.tip;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gokkiri.area.AreaModel;
import com.gokkiri.tip.TipModel;


@Service
public class TipService implements TipDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;



	// 글목록
	@Override
	public List<TipModel> tipList() {

		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("tip.tipList");
	}
	
	//메인에서 인기 여행팁리스트 불러오기
	@Override
	public List<TipModel> tipHitList() {
		return sqlSessionTemplate.selectList("tip.tipHitList");
	}
	
	@Override
	public List<TipModel> tipHList() {

		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("tip.tipHList");
	}
	

	@Override
	public List<TipModel> areaList() {

		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("tip.areaList");
	}



	// 글 상세보기
	@Override
	public TipModel tipDetail(int t_no) {
		return sqlSessionTemplate.selectOne("tip.tipDetail", t_no);
	}

	// 이미지 불러오기
	@Override
	public TipModel tip_imgList(int t_no) {
		return sqlSessionTemplate.selectOne("tip.tip_imgList", t_no);
	}

	// 글쓰기
	@Override
	public int tipWrite(TipModel tipModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("tip.tipWrite", tipModel);
	}

	// 글삭제
	@Override
	public int tipDelete(int t_no) {
		return sqlSessionTemplate.update("tip.tipDelete", t_no);
	}
	
	//글쓰기 하고 바로 최근 t_no 불러오기
	@Override
	public int selectSeq() {
		return sqlSessionTemplate.selectOne("tip.selectSeq");
	}


	// 글수정
	@Override
	public int tipModify(TipModel tipModel) {
		return sqlSessionTemplate.update("tip.tipModify", tipModel);
	}
	
	//글수정할때 이미지 다시 첨부시 기존 이미지 삭제하기
	@Override
	public void fileDelete(int t_no) {
		sqlSessionTemplate.delete("tip.fileDelete", t_no);
	}
	
	//조회수 증가
	@Override
	public int tipUpdateReadHit(int t_no) {
		return sqlSessionTemplate.update("tip.tipUpdateReadHit", t_no);
	}
	
	
	//제목으로 검색
	@Override
	public List<TipModel> tipSearchW(String sKeyword) {
		return sqlSessionTemplate.selectList("tip.tipSearchW", "%"+sKeyword+"%"); 
	}
	
	//내용으로 검색
	@Override
	public List<TipModel> tipSearchS(String sKeyword) {
		return sqlSessionTemplate.selectList("tip.tipSearchS", "%"+sKeyword+"%"); 
	}
	//이름으로 검색
	@Override
	public List<TipModel> areaSearch(String aKeyword) {
		return sqlSessionTemplate.selectList("tip.areaSearch", "%"+aKeyword+"%"); 
	}
	//주소로검색
	@Override
	public List<TipModel> areaSearch2(String aKeyword) {
		return sqlSessionTemplate.selectList("tip.areaSearch2", "%"+aKeyword+"%"); 
	}
	
	
	
	
	

	// 댓글목록
	@Override
	public List<TipCoModel> tipcommList(int t_no) {
		return sqlSessionTemplate.selectList("tip.tipcommList", t_no);
	}

	// 댓글쓰기
	@Override
	public int tipcommWrite(TipCoModel tipcoModel) {
		return sqlSessionTemplate.insert("tip.tipcommWrite", tipcoModel);
	}

	// 댓글삭제
	@Override
	public int tipcommDelete(TipCoModel tipcoModel) {
		return sqlSessionTemplate.delete("tip.tipcommDelete", tipcoModel);
	}


	// 파일업로드
	@Override
	public void fileupload(String originalfileName, String savefileName, int t_img_index, int t_no) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("t_img_org", originalfileName);
		hm.put("t_img_sav", savefileName);
		hm.put("t_img_index", t_img_index);
		hm.put("t_no", t_no);

		sqlSessionTemplate.insert("tip.fileupload", hm);
	}



	@Override
	public int tipcommModify(TipCoModel tipcoModel) {
		// TODO Auto-generated method stub
		return 0;
	}







}
