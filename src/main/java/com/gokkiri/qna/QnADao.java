package com.gokkiri.qna;

import java.util.List;

public interface QnADao {

	// 글목록
	public List<QnAModel> qnaList(int a_no);

	// 글쓰기
	public int qnaWrite(QnAModel qnAModel);

	// 글 상세보기
	public QnAModel qnaView(int q_no);

	// 글삭제
	public int qnaDelete(int q_no);

	// 글수정
	public int qnaModify(QnAModel qnAModel);

	// 댓글목록
	public List<QnAModel> qnacommList(int q_no);

	// 댓글쓰기
	public int qnacommWrite(QnAModel qnAModel);

	// 댓글삭제
	public int qnacommDelete(QnAModel qnAModel);
	
	// 댓글 개수
	public int comCount(int a_no);
	
	//도시에서 모든 여행지 QnA리스트 보기
	List<QnAModel> cityqnaList(int c_no);

}
