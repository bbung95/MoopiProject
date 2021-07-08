package com.moopi.mvc.service.meeting.impl;

import java.util.List;
import java.util.Map;

import com.moopi.mvc.common.Search;
import com.moopi.mvc.service.meeting.MeetingDao;
//import com.moopi.mvc.service.board.impl.SqlSession;
import com.moopi.mvc.service.domain.Meeting;

public class MeetingDaoImpl implements MeetingDao{

	//@Autowired
	//@Qualifier("sqlSessionTemplate")
	//private SqlSession sqlSession;
	
//	public void setSqlSession(SqlSession sqlSession) {
//	this.sqlSession = sqlSession;
//}
	
	public MeetingDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void insertMeeting(Meeting meeting) throws Exception {
		//sqlSession.insert("MeetingMapper.insertMeeting", meeting);
		
	}

	@Override
	public List<Meeting> getMeetingList(Search search) throws Exception {
		//return sqlSession.selectList("MeetingMapper.getMeetingList", search);
		return null;
	}

	@Override
	public Meeting findMeeting(int mtNo) throws Exception {
		//return sqlSession.selectOne("MeetingMapper.getMeeting", mtNo);
		return null;
	}

	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		//sqlSession.update("MeetingMapper.updateMeeting", meeting);
		
	}

	@Override
	public int getTotalCOunt(Search search) throws Exception {
		//return sqlSession.selectOne("MeetingMapper.getTotalCount", search);
		return 0;
	}

}
