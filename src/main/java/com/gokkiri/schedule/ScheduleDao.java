package com.gokkiri.schedule;

import java.util.List;

import com.gokkiri.schedule.ScheduleModel;

public interface ScheduleDao {
	
	public List<ScheduleModel> togetherList(int s_no);
	
	public void scheduleShare(String s_together);
	
	public int writeMemo(ScheduleModel scheduleModel);
	
	public ScheduleModel selectPreTurn(ScheduleModel scheduleModel);
	public ScheduleModel selectNextTurn(ScheduleModel scheduleModel);
	public int preTurnUp(int turn, int s_no, int s_detail_turn, int s_idx);
	public int nextTurnDown(int s_no, int s_detail_turn, int s_detail_no, int s_idx);
	
	public int scheduleCompleteCount(int s_no);
	
	public int scheduleComplete(int s_no);
	
	public List<ScheduleModel> scheduleIncompleteList(String m_email);
	
	public List<ScheduleModel> scheduleAreaList(ScheduleModel scheduleModel);
	
	public void insertArea(ScheduleModel scheduleModel);
	
	public void deleteArea(ScheduleModel scheduleModel);
	
	public void scheduleWrite(ScheduleModel scheduleModel);
	
	public ScheduleModel scheduleLastWrite(String m_email);
	
	//일정 번호와 세션 아이디로 글 검색
	public ScheduleModel scheduleWriteSelect(ScheduleModel scheduleModel);
	
	//일정 게시판↓↓↓↓
	//일정게시판 리스트 보기
	public List<ScheduleModel> scheduleList();
	
	//일정게시판 출발지역으로 검색해서 리스트 보기
	public List<ScheduleModel> scheduleSearchList(String state_name);
	
	//메인에 인기조회수 일정리스트 불러오기
	public List<ScheduleModel> scheduleHitList();
	
	//일정게시판 글 상세보기 - 헤더
	public ScheduleModel scheduleDetail(int s_no);
	
	//일정게시판 글 상세보기/DAY선택
	public List<ScheduleModel> schDetail(int s_no);
	
	//일정게시판 글 상세보기/DAY별 일정리스트
	public List<ScheduleModel> DayList(int s_idx, int s_no);
	
	//일정 찜했는지 확인
	public int zzimCheck(String m_email, int s_no);
	
	//조회수 증가
	public int scheduleUpdateReadhit(int s_no);
	
	//댓글 총 개수
	public int sch_commCount(int s_no);
	
	//댓글 리스트 가져오기
	public List<SchCommentModel> sch_comList(int s_no);
	
	//댓글 쓰기
	public void schComment(SchCommentModel schCommentModel);
	
	//댓글 삭제
	public void schCommentDelete(int s_no);
	
	//해당 스케쥴의 여행지 총 개수
	public int areaCount(int s_no);
	
	//찜하기
	public void schZzim1(int s_no, String m_email);
	
	//찜하기 해제
	public void schZzim2(int s_no, String m_email);
	
	//다른사람 일정 디테일 가져오기
	public List<ScheduleModel> schDetailList(int s_no);
	
	//다른사람 일정 내 일정으로 저장하기
	public int schDownload(ScheduleModel scheduleModel);
	
	//다른사람 일정디테일 내 일정으로 저장하기
	public void schDownDetail(List<ScheduleModel> schDetailList, int ss_no);
	
	//지도에 마커로 표시할 여행지 리스트 불러오기
	public List<ScheduleModel> mapList(int s_no);
	
	//일정 공유중인 회원 이메일 리스트 불러오기
	public List<ScheduleModel> s_together(int s_no);
	
	//일정 수정하기 버튼에 값 넘겨주기 / s_idx
	public ScheduleModel selectS_idx(int s_no);
	
	//일정 수정하기 버튼에 값 넘겨주기 / state_no, city_no
	public ScheduleModel selectStateCity(int s_no);
	
	//일정 삭제하기
	public void deleteSchedule(int s_no);

}
