package com.gokkiri.state;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class StateService implements StateDAO{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<StateModel> StateList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("state.stateList");
	}
	
	@Override
	public List<StateModel> stateSearchList(String keyword) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("state.stateSearchList","%"+keyword+"%");
	}	
	
	
	
	
	

}
