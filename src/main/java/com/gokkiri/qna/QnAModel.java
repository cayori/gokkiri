package com.gokkiri.qna;
import java.util.Date;
public class QnAModel {
	
	private int q_no;
	private String q_con;
	private String q_sub;
	private Date q_date;
	private String m_email;
	
	private int a_no;
	private int c_no;
	private String a_name;
	
	private int q_co_no;
	private String q_co_con;
	private Date q_co_date;
	
	
	//qna게시판댓글
	public int getQ_co_no() {
		return q_co_no;
	}
	public void setQ_co_no(int q_co_no) {
		this.q_co_no = q_co_no;
	}

	public String getQ_co_con() {
		return q_co_con;
	}
	public void setQ_co_con(String q_co_con) {
		this.q_co_con = q_co_con;
	}
	public Date getQ_co_date() {
		return q_co_date;
	}
	public void setQ_co_date(Date q_co_date) {
		this.q_co_date = q_co_date;
	}
    //qna게시판
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_con() {
		return q_con;
	}
	public void setQ_con(String q_con) {
		this.q_con = q_con;
	}
	public String getQ_sub() {
		return q_sub;
	}
	public void setQ_sub(String q_sub) {
		this.q_sub = q_sub;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	
	
}
