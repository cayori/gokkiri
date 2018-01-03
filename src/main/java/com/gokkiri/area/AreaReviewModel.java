package com.gokkiri.area;

import java.util.Date;

public class AreaReviewModel {
	
	private int a_no;			//여행지 번호
	private int a_cate; 		//여행지 카테고리
	private String m_email;		//회원 이메일
	private String a_name;		//여행지 이름
	
	//REVIEW 테이블
	private int r_no;			//리뷰 번호
	private String r_con;		//리뷰 내용
	private Date r_date;		//리뷰 작성일
	private int r_score;		//리뷰 별점
	
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_con() {
		return r_con;
	}
	public void setR_con(String r_con) {
		this.r_con = r_con;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getR_score() {
		return r_score;
	}
	public void setR_score(int r_score) {
		this.r_score = r_score;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public int getA_cate() {
		return a_cate;
	}
	public void setA_cate(int a_cate) {
		this.a_cate = a_cate;
	}

}
