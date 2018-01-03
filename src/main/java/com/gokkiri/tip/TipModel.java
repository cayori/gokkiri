package com.gokkiri.tip;

import java.util.Date;

public class TipModel {
	private int t_no;
	private String a_no;
	private String m_email;
	private String t_sub;
	private String t_con;
	private int t_hit;
	private Date t_date;
	private int t_index;
	private String t_add;

	private String a_name; // 여행지 이름

	private String a_addr; // 여행지 주소

	private int t_img_no;
	private String t_img_org;
	private String t_img_sav;
	private int t_img_index;

	private String t_co_con;
	private Date t_co_date;
	private int t_co_no;

	public String getA_addr() {
		return a_addr;
	}

	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getT_add() {
		return t_add;
	}

	public void setT_add(String t_add) {
		this.t_add = t_add;
	}

	public int getT_co_no() {
		return t_co_no;
	}

	public void setT_co_no(int t_co_no) {
		this.t_co_no = t_co_no;
	}

	public Date getT_co_date() {
		return t_co_date;
	}

	public void setT_co_date(Date t_co_date) {
		this.t_co_date = t_co_date;
	}

	public String getT_co_con() {
		return t_co_con;
	}

	public void setT_co_con(String t_co_con) {
		this.t_co_con = t_co_con;
	}

	public int getT_index() {
		return t_index;
	}

	public void setT_index(int t_index) {
		this.t_index = t_index;
	}

	public int getT_img_index() {
		return t_img_index;
	}

	public void setT_img_index(int t_img_index) {
		this.t_img_index = t_img_index;
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public String getA_no() {
		return a_no;
	}

	public void setA_no(String a_no) {
		this.a_no = a_no;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getT_sub() {
		return t_sub;
	}

	public void setT_sub(String t_sub) {
		this.t_sub = t_sub;
	}

	public String getT_con() {
		return t_con;
	}

	public void setT_con(String t_con) {
		this.t_con = t_con;
	}

	public int getT_hit() {
		return t_hit;
	}

	public void setT_hit(int t_hit) {
		this.t_hit = t_hit;
	}

	public Date getT_date() {
		return t_date;
	}

	public void setT_date(Date t_date) {
		this.t_date = t_date;
	}

	public int getT_img_no() {
		return t_img_no;
	}

	public void setT_img_no(int t_img_no) {
		this.t_img_no = t_img_no;
	}

	public String getT_img_org() {
		return t_img_org;
	}

	public void setT_img_org(String t_img_org) {
		this.t_img_org = t_img_org;
	}

	public String getT_img_sav() {
		return t_img_sav;
	}

	public void setT_img_sav(String t_img_sav) {
		this.t_img_sav = t_img_sav;
	}
}
