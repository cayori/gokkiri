package com.gokkiri.mypage;

import java.util.List;
import com.gokkiri.area.AreaReviewModel;
import com.gokkiri.member.MemberModel;
import com.gokkiri.qna.QnAModel;
import com.gokkiri.schedule.ScheduleModel;
import com.gokkiri.tip.TipModel;
import com.gokkiri.area.AreaModel;

public interface MypageDao {
	
	
	//내가 쓴 리뷰 목록
	public List<AreaReviewModel> myAreaReviewList(String m_email);
		
	//내가 쓴 QnA 글목록
	public List<QnAModel> myQnaList(String m_email);
		
	//내가 쓴 QnA 댓글목록
	public List<QnAModel> myQnaCommList(String m_email);
	
	//완성된 일정 리스트/공개글
	public List<ScheduleModel> myComScheduleList(String m_email);
	
	//완성된 일정 리스트/비공개글
	public List<ScheduleModel> myComScheduleList_p(String m_email);
		
	//미완성된 일정 리스트/공개글
	public List<ScheduleModel> myIncomScheduleList(String m_email);
		
	//미완성된 일정 리스트/비공개글
	public List<ScheduleModel> myIncomScheduleList_p(String m_email);
	
	//찜한일정 리스트
	public List<ScheduleModel> zzimScheduleList(String m_email);
	
	//공유일정 리스트
	public List<ScheduleModel> sharedScheduleList(String m_email);
	
	//여행Tip리스트
	public List<TipModel> myTipList(String m_email);

		
}
