package com.gokkiri.tip;

import java.util.ArrayList;
import java.util.List;

import com.gokkiri.area.AreaModel;

public interface TipDao {
	// 글목록
	public List<TipModel> tipList();
	
	//메인에서 인기 여행팁리스트 불러오기
	public List<TipModel> tipHitList();

	public List<TipModel> tipHList();

	// 글목록
	public List<TipModel> areaList();

	// 글 상세보기
	public TipModel tipDetail(int t_no);

	// 이미지 리스트 불러오기
	public TipModel tip_imgList(int t_no);

	// 글작성
	public int tipWrite(TipModel tipModel);
	
	//글작성하고 제일 최근 t_no 불러오기
	public int selectSeq();

	// 파일업로드
	public void fileupload(String originalfileName, String savefileName, int t_img_index, int t_no);

	// 글삭제
	public int tipDelete(int t_no);

	// 글수정
	public int tipModify(TipModel tipModel);
	
	//글수정할때 이미지파일 다시 첨부시 기존 이미지 파일 삭제
	public void fileDelete(int t_no);

	// 검색 (0=제목, 1=주소)
	public List<TipModel> tipSearchW(String sKeyword);

	public List<TipModel> tipSearchS(String sKeyword);

	// 검색 (0=이름, 1=주소)
	public List<TipModel> areaSearch(String aKeyword);

	public List<TipModel> areaSearch2(String aKeyword);

	// 조회수 증가
	public int tipUpdateReadHit(int t_no);

	// 댓글목록
	public List<TipCoModel> tipcommList(int t_no);

	// 댓글쓰기
	public int tipcommWrite(TipCoModel tipcoModel);

	// 댓글삭제
	public int tipcommDelete(TipCoModel tipcoModel);

	// 댓글수정
	public int tipcommModify(TipCoModel tipcoModel);

	/*
	 * public int countBoardList(TipModel tipModel);
	 * 
	 * public boolean writecomment(TipCommentModel tipCommentModel);
	 * 
	 * public List<TipModel> commentList(int tip_no);
	 * 
	 * public boolean deletecomment(TipCommentModel tipCommentModel);
	 * 
	 * public int cmtcount(int tip_no);
	 * 
	 * public Object readhit(int tip_no);
	 * 
	 * //검색 (0=지역, 1=제목, 2=내용) public List<TipModel> tipSearch0(String search);
	 * public List<TipModel> tipSearch1(String search); public List<TipModel>
	 * tipSearch2(String search);
	 */
}