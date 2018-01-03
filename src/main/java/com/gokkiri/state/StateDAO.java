package com.gokkiri.state;

import java.util.List;

public interface StateDAO {

	
	
	public List<StateModel> StateList();
	
	public List<StateModel> stateSearchList(String keyword);
	
	
}
