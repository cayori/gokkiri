package com.gokkiri.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;

import com.gokkiri.member.MemberModel;

@Service
public class MemberService implements MemberDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//로그인
	@Override
	public MemberModel memberLogin(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.login", member);
	}
	
	//이메일 뽑아오기
	@Override
	public MemberModel getMember(String email) {
		return sqlSessionTemplate.selectOne("member.getMember", email);
	}
	
	//이메일 중복체크
	@Override
	public MemberModel getEmailDuplChk(String email){
		return sqlSessionTemplate.selectOne("member.emailCheck", email);
	}
	
	//이름(닉네임) 중복체크
	@Override
	public MemberModel getNameDuplChk(String name){
		return sqlSessionTemplate.selectOne("member.nameCheck", name);
	}
	
	
	//이메일 검색
	@Override
	public MemberModel getEmail(MemberModel member){
		return sqlSessionTemplate.selectOne("member.searchEamil", member);
	}
	
	//이메일 찾기
	@Override
	public MemberModel emailFindByName(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.emailFind", member);
	}
	
	//비밀번호 찾기
	@Override
	public MemberModel pwFindByEmail(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.pwFind", member);
	}
	

	//회원가입
	@Override
	public Object insertMember(String m_email, String m_pw, String m_name, String m_auth) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_email", m_email);
		hm.put("m_pw", m_pw);
		hm.put("m_name", m_name);
		hm.put("m_auth", m_auth);
		return sqlSessionTemplate.insert("member.insertMem", hm);
	}
	
	//회원정보 수정
	@Override
	public void memberModify(String m_email, String m_pw, String m_name) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("m_email", m_email);
		hm.put("m_pw", m_pw);
		hm.put("m_name", m_name);
		sqlSessionTemplate.update("member.updateMem", hm);
	}
	
	//회원탈퇴
	@Override
	public void memberDelete(String email) {
		sqlSessionTemplate.delete("member.deleteMem", email);
	}
	
		//이메일 인증
		@Override
		public int emailAuth(String m_email, String m_auth) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("m_auth", m_auth);
			map.put("m_email", m_email);
			
			return sqlSessionTemplate.update("member.emailAuth", map);
		}
		@Override
		//인증번호 변경
		public int changeAuth(String m_email,String m_auth) {
			// TODO Auto-generated method stub
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("m_auth", m_auth);
			map.put("m_email", m_email);
			
			return sqlSessionTemplate.update("member.changeAuth", map);
		}
	
}
