package com.gokkiri.push;

import java.util.List;

import com.gokkiri.schedule.ScheduleModel;

public interface PushDao {
	
	//여행일정을 공유할친구 리스트
	public List<ScheduleModel> togetherList(int s_no);
	
	//알림리스트
	public List<ScheduleModel> pushList(String m_email);
	
	//수락/거절 후 상태값 변경
	public int updateTogether(String s_together, int s_no, int s_state);
	
	public void deleteTogether();
	
	//알림리스트 개수 구하기
	public int pushListCount(String m_email);
	

	
}
