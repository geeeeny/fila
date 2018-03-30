package edu.iot.fila.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import edu.iot.fila.db.ConnectionFactory;
import edu.iot.fila.model.Member;

public class MemberDaoImpl implements MemberDao {
	private SqlSessionFactory sqlSessionFactory = null;
	
	static final String namespace="edu.iot.fila.dao.MemberDao.";
	
	public MemberDaoImpl() {
		sqlSessionFactory = ConnectionFactory.getSqlSessionFactory();
	}
	
	@Override
	public int getCount() throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne(namespace + "getCount");
		}
	}

	@Override
	public List<Member> selectList(Map map) throws Exception {
		//단 하나의 매개변수만 전달할 수 있으므로 여러 개의 매개변수를 전달해야 한다면 Map을 이용
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList(namespace + "selectList", map); //없을 경우 비어있는 리스트 리턴
		}
	}

	@Override
	public Member selectOne(String userId) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne(namespace + "selectOne", userId); //없을 경우 null 리턴
		}	
	}

	@Override
	public int insert(Member member) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			int result = session.insert(namespace + "insert", member);
			session.commit();
			return result;
			
		}		
	}

	@Override
	public int update(Member member) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			int result = session.update(namespace + "update", member);
			session.commit();
			return result;

		}	
	}

	@Override
	public int delete(String userId) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			int result = session.delete(namespace + "delete", userId);
			session.commit();
			return result;

		}		
	}

}
