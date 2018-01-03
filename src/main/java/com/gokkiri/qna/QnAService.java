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

	// �۸��
	@Override
	public List<QnAModel> qnaList(int a_no) {
		return sqlSessionTemplate.selectList("qna.qnaList", a_no);
	}

	// �۾���
	@Override
	public int qnaWrite(QnAModel qnAModel) {
		return sqlSessionTemplate.insert("qna.qnaWrite", qnAModel);
	}

	// �� �󼼺���
	@Override
	public QnAModel qnaView(int q_no) {
		return sqlSessionTemplate.selectOne("qna.qnaView", q_no);
	}

	// �ۻ���
	@Override
	public int qnaDelete(int q_no) {
		return sqlSessionTemplate.update("qna.qnaDelete", q_no);
	}

	// �ۼ���
	@Override
	public int qnaModify(QnAModel qnAModel) {
		return sqlSessionTemplate.update("qna.qnaModify", qnAModel);
	}

	// ��۸��
	@Override
	public List<QnAModel> qnacommList(int q_no) {
		return sqlSessionTemplate.selectList("qna.qnacommList", q_no);
	}

	// ��۾���
	@Override
	public int qnacommWrite(QnAModel qnAModel) {
		return sqlSessionTemplate.insert("qna.qnacommWrite", qnAModel);
	}

	// ��ۻ���
	@Override
	public int qnacommDelete(QnAModel qnAModel) {
		return sqlSessionTemplate.delete("qna.qnacommDelete", qnAModel);
	}

	// ��۰���
	@Override
	public int comCount(int a_no) {
		return sqlSessionTemplate.selectOne("qna.comCount", a_no);
	}
	
	//���� �󼼺��⿡�� ��� ������QnA����Ʈ ����
	@Override
	public List<QnAModel> cityqnaList(int c_no) {
		return sqlSessionTemplate.selectList("qna.cityqnaList", c_no);
	}


}
