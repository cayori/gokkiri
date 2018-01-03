package com.gokkiri.schedule;

import java.util.Date;

public class ScheduleModel {

	private String m_email;			//ȸ�� �̸���
	private int a_no;				//������ ��ȣ
	private String a_addr;			//������ �ּ�
	private String a_img_sav;		//������ �̹���
	private int a_cate;				//������ ī�װ�
	private String a_tel;			//������ ��ȭ��ȣ
	private String a_way;			//������ ���¹��
	
	//SCH ���̺�
	private int s_no;				//���� ��ȣ
	private Date s_date;			//���� ���� ��¥
	private String s_start_date;	//���� ���� ��¥
	private String s_end_date;		//���� �� ��¥
	private int s_hit;				//���� ��ȸ��
	private int s_private;			//���� ���� ����
	private String s_together;		//���� ������ ȸ��
	private String s_name;			//���� �̸�
	private int s_complete;         //���� �ϼ� Ȯ��
	private int s_state;			//���� ����/���� Ȯ��
	
	private int s_idx;
	
	//SCH_DETAIL ���̺�
	private int s_detail_no;		//�������� ��ȣ
	private String s_detail_memo;	//���� ��¥�� ���� �޸�
	private int s_detail_index;		//������ ����
	private int s_detail_turn;
	
	private String a_name;
	
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
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
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public String getS_start_date() {
		return s_start_date;
	}
	public void setS_start_date(String s_start_date) {
		this.s_start_date = s_start_date;
	}
	public String getS_end_date() {
		return s_end_date;
	}
	public void setS_end_date(String s_end_date) {
		this.s_end_date = s_end_date;
	}
	public int getS_hit() {
		return s_hit;
	}
	public void setS_hit(int s_hit) {
		this.s_hit = s_hit;
	}
	public int getS_private() {
		return s_private;
	}
	public void setS_private(int s_private) {
		this.s_private = s_private;
	}
	public String getS_together() {
		return s_together;
	}
	public void setS_together(String s_together) {
		this.s_together = s_together;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_detail_memo() {
		return s_detail_memo;
	}
	public void setS_detail_memo(String s_detail_memo) {
		this.s_detail_memo = s_detail_memo;
	}
	public int getS_detail_index() {
		return s_detail_index;
	}
	public void setS_detail_index(int s_detail_index) {
		this.s_detail_index = s_detail_index;
	}
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public int getS_detail_turn() {
		return s_detail_turn;
	}
	public void setS_detail_turn(int s_detail_turn) {
		this.s_detail_turn = s_detail_turn;
	}
	public int getS_detail_no() {
		return s_detail_no;
	}
	public void setS_detail_no(int s_detail_no) {
		this.s_detail_no = s_detail_no;
	}
	public String getA_addr() {
		return a_addr;
	}
	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}
	public String getA_img_sav() {
		return a_img_sav;
	}
	public void setA_img_sav(String a_img_sav) {
		this.a_img_sav = a_img_sav;
	}
	public int getA_cate() {
		return a_cate;
	}
	public void setA_cate(int a_cate) {
		this.a_cate = a_cate;
	}
	public int getS_complete() {
		return s_complete;
	}
	public void setS_complete(int s_complete) {
		this.s_complete = s_complete;
	}
	public String getA_tel() {
		return a_tel;
	}
	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}
	public String getA_way() {
		return a_way;
	}
	public void setA_way(String a_way) {
		this.a_way = a_way;
	}
	public int getS_state() {
		return s_state;
	}
	public void setS_state(int s_state) {
		this.s_state = s_state;
	}

}
