package com.gokkiri.push;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;

import com.gokkiri.qna.QnAModel;
import com.gokkiri.schedule.ScheduleModel;;

@Service
public class PushService implements PushDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//여행일정을 공유할친구 리스트
	@Override
	public List<ScheduleModel> togetherList(int s_no){
		return sqlSessionTemplate.selectList("push.togetherList", s_no);
	}
	
	//알림 리스트
	@Override
	public List<ScheduleModel> pushList(String m_email){
		return sqlSessionTemplate.selectList("push.pushList", m_email);
	}
		
	
	//수락/거절 후 상태값 변경
	@Override
	public int updateTogether(String s_together, int s_no, int s_state) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("s_together", s_together);
		hm.put("s_no", s_no);
		hm.put("s_state", s_state);
		return sqlSessionTemplate.update("push.updateTogether", hm);
	}
	
	public void deleteTogether(){
		sqlSessionTemplate.delete("push.deleteTogether");
	}
	
	public int pushListCount(String m_email){
		return sqlSessionTemplate.selectOne("push.pushListCount", m_email);
	}


}
