package com.gokkiri.mypage;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;

import com.gokkiri.area.AreaModel;
import com.gokkiri.area.AreaReviewModel;
import com.gokkiri.qna.QnAModel;
import com.gokkiri.schedule.ScheduleModel;
import com.gokkiri.tip.TipModel;

@Service
public class MypageService implements MypageDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//내가쓴 리뷰목록
	@Override
	public List<AreaReviewModel> myAreaReviewList(String m_email){
		return sqlSessionTemplate.selectList("mypage.myAreaReviewList",m_email);
	}
	
	//내가쓴 QnA 글목록
	@Override
	public List<QnAModel> myQnaList(String m_email){
		return sqlSessionTemplate.selectList("mypage.myQnaList", m_email);
	}
			
	//내가쓴 QnA 댓글목록
	@Override
	public List<QnAModel> myQnaCommList(String m_email){
		return sqlSessionTemplate.selectList("mypage.myQnaCommList", m_email);
	}
		
	//완성된 일정 리스트/공개글
	@Override
	public List<ScheduleModel> myComScheduleList(String m_email) {
		return sqlSessionTemplate.selectList("mypage.myComScheduleList", m_email);
	}
	
	//완성된 일정 리스트/비공개글
	@Override
	public List<ScheduleModel> myComScheduleList_p(String m_email) {
		return sqlSessionTemplate.selectList("mypage.myComScheduleList_p", m_email);
	}
		
	//미완성된 일정 리스트/공개글
	@Override
	public List<ScheduleModel> myIncomScheduleList(String m_email) {
		return sqlSessionTemplate.selectList("mypage.myIncomScheduleList", m_email);
	}
		
		
	//미완성된 일정 리스트/비공개글
	@Override
	public List<ScheduleModel> myIncomScheduleList_p(String m_email) {
		return sqlSessionTemplate.selectList("mypage.myIncomScheduleList_p", m_email);
	}
		
	//찜한일정 리스트 보기
	public List<ScheduleModel> zzimScheduleList(String m_email){
		return sqlSessionTemplate.selectList("mypage.zzimScheduleList", m_email);
	}
	
	public List<ScheduleModel> sharedScheduleList(String m_email){
		return sqlSessionTemplate.selectList("mypage.sharedScheduleList", m_email);
	}
	
	//여행Tip리스트
	public List<TipModel> myTipList(String m_email){
		return sqlSessionTemplate.selectList("mypage.myTipList", m_email);
	}
	


	

}
