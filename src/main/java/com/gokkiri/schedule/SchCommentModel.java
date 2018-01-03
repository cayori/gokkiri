package com.gokkiri.schedule;

import java.util.Date;

public class SchCommentModel {
	
	private String m_email;			//회원 이메일
	private int s_no;				//일정 번호
	
	//SCH_CO 테이블
	private int s_co_no;			//일정 댓글 번호
	private String s_co_con;		//일정 댓글 내용
	private Date s_co_date;			//일정 댓글 날짜
	
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getS_co_no() {
		return s_co_no;
	}
	public void setS_co_no(int s_co_no) {
		this.s_co_no = s_co_no;
	}
	public String getS_co_con() {
		return s_co_con;
	}
	public void setS_co_con(String s_co_con) {
		this.s_co_con = s_co_con;
	}
	public Date getS_co_date() {
		return s_co_date;
	}
	public void setS_co_date(Date s_co_date) {
		this.s_co_date = s_co_date;
	}

}
