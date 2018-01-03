package com.gokkiri.area;

import java.util.Date;
import java.io.File;

public class AreaModel { 
	
	private int c_no;			//도시 번호
	
	//AREA 테이블
	private int a_no;			//여행지 번호
	private String a_name;		//여행지 이름
	private String a_con;		//여행지 설명
	private String a_addr;		//여행지 주소
	private String a_count;		//핫플레이스
	private int a_cate;			//카테고리
	private String a_way;		//여행지 가는 방법
	private String a_tel;		//여행지 전화번호
	private String a_hours;		//여행지 영업시간
	private String a_web;		//웹사이트
	
	//AREA_IMG 테이블
	private int a_img_no;		//여행지 사진 번호
	private String a_img_org;	//여행지 사진 원본 이름
	private String a_img_sav;	//여행지 사진 저장 이름
	private int a_img_index;	//여행지 리스트에 띄워줄 첫 이미지
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_con() {
		return a_con;
	}
	public void setA_con(String a_con) {
		this.a_con = a_con;
	}
	public String getA_addr() {
		return a_addr;
	}
	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}
	public String getA_count() {
		return a_count;
	}
	public void setA_count(String a_count) {
		this.a_count = a_count;
	}
	public int getA_cate() {
		return a_cate;
	}
	public void setA_cate(int a_cate) {
		this.a_cate = a_cate;
	}
	public String getA_way() {
		return a_way;
	}
	public void setA_way(String a_way) {
		this.a_way = a_way;
	}
	public String getA_tel() {
		return a_tel;
	}
	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}
	public String getA_hours() {
		return a_hours;
	}
	public void setA_hours(String a_hours) {
		this.a_hours = a_hours;
	}
	public String getA_web() {
		return a_web;
	}
	public void setA_web(String a_web) {
		this.a_web = a_web;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public int getA_img_no() {
		return a_img_no;
	}
	public void setA_img_no(int a_img_no) {
		this.a_img_no = a_img_no;
	}
	public String getA_img_org() {
		return a_img_org;
	}
	public void setA_img_org(String a_img_org) {
		this.a_img_org = a_img_org;
	}
	public String getA_img_sav() {
		return a_img_sav;
	}
	public void setA_img_sav(String a_img_sav) {
		this.a_img_sav = a_img_sav;
	}
	public int getA_img_index() {
		return a_img_index;
	}
	public void setA_img_index(int a_img_index) {
		this.a_img_index = a_img_index;
	}
	
	

}
