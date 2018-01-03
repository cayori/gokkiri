package com.gokkiri.city;

import java.util.Date;
import java.io.File;

public class CityModel {
	
	private int c_no;			//도시 번호
	private String c_name;		//도시 이름
	private String c_con;		//도시 설명
	private String c_addr;		//도시 주소
	private String c_like;		//도시 선호도
	private int state_no;		//도 번호
	private String state_name;	//도 이름
		
	//AREA_IMG 테이블
	private int c_img_no;		//도시 사진 번호
	private String c_img_org;	//도시 사진 원본 이름
	private String c_img_sav;	//도시 사진 저장 이름
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_con() {
		return c_con;
	}
	public void setC_con(String c_con) {
		this.c_con = c_con;
	}
	public String getC_addr() {
		return c_addr;
	}
	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}
	public String getC_like() {
		return c_like;
	}
	public void setC_like(String c_like) {
		this.c_like = c_like;
	}
	public int getState_no() {
		return state_no;
	}
	public void setState_no(int state_no) {
		this.state_no = state_no;
	}
	public int getC_img_no() {
		return c_img_no;
	}
	public void setC_img_no(int c_img_no) {
		this.c_img_no = c_img_no;
	}
	public String getC_img_org() {
		return c_img_org;
	}
	public void setC_img_org(String c_img_org) {
		this.c_img_org = c_img_org;
	}
	public String getC_img_sav() {
		return c_img_sav;
	}
	public void setC_img_sav(String c_img_sav) {
		this.c_img_sav = c_img_sav;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	

}
