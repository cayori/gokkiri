package com.gokkiri.member;

import java.util.List;


public interface MemberDao {
	
	//로그인
	public MemberModel memberLogin(MemberModel member);
	
	//이메일뽑아오기
	public MemberModel getMember(String email);
	
	//이메일 중복체크
	public MemberModel getEmailDuplChk(String email);
	

	
	//이메일 검색
	public MemberModel getEmail(MemberModel member);
	
	//이름(닉네임) 중복체크
	public MemberModel getNameDuplChk(String name);
	
	
	//이메일 찾기
	public MemberModel emailFindByName(MemberModel member);
	
	//비밀번호 찾기
	public MemberModel pwFindByEmail(MemberModel member);
	
	//회원가입
	public Object insertMember(String m_email, String m_pw, String m_name, String m_auth);
	
	//회원정보수정
	public void memberModify(String m_email, String m_pw, String m_name);
	
	//회원탈퇴
	public void memberDelete(String email);
	
	//이메일 인증
	public int emailAuth(String m_email,String m_auth);
	//인증번호 변경
	public int changeAuth(String m_auth, String m_email);
	
}
