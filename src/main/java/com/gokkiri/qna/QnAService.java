package com.gokkiri.qna;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.gokkiri.qna.QnAModel;

@Service
public class QnAService implements QnADao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	// 글목록
	@Override
	public List<QnAModel> qnaList(int a_no) {
		return sqlSessionTemplate.selectList("qna.qnaList", a_no);
	}

	// 글쓰기
	@Override
	public int qnaWrite(QnAModel qnAModel) {
		return sqlSessionTemplate.insert("qna.qnaWrite", qnAModel);
	}

	// 글 상세보기
	@Override
	public QnAModel qnaView(int q_no) {
		return sqlSessionTemplate.selectOne("qna.qnaView", q_no);
	}

	// 글삭제
	@Override
	public int qnaDelete(int q_no) {
		return sqlSessionTemplate.update("qna.qnaDelete", q_no);
	}

	// 글수정
	@Override
	public int qnaModify(QnAModel qnAModel) {
		return sqlSessionTemplate.update("qna.qnaModify", qnAModel);
	}

	// 댓글목록
	@Override
	public List<QnAModel> qnacommList(int q_no) {
		return sqlSessionTemplate.selectList("qna.qnacommList", q_no);
	}

	// 댓글쓰기
	@Override
	public int qnacommWrite(QnAModel qnAModel) {
		return sqlSessionTemplate.insert("qna.qnacommWrite", qnAModel);
	}

	// 댓글삭제
	@Override
	public int qnacommDelete(QnAModel qnAModel) {
		return sqlSessionTemplate.delete("qna.qnacommDelete", qnAModel);
	}

	// 댓글개수
	@Override
	public int comCount(int a_no) {
		return sqlSessionTemplate.selectOne("qna.comCount", a_no);
	}
	
	//도시 상세보기에서 모든 여행지QnA리스트 보기
	@Override
	public List<QnAModel> cityqnaList(int c_no) {
		return sqlSessionTemplate.selectList("qna.cityqnaList", c_no);
	}


}
