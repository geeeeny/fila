package edu.iot.fila.service;

import edu.iot.fila.dao.MemberDao;
import edu.iot.fila.dao.MemberDaoImpl;
import edu.iot.fila.exception.PasswordNotMatchException;
import edu.iot.fila.model.Member;

public class MemberServiceImpl implements MemberService {
	MemberDao dao;
	
	private MemberServiceImpl() {
		dao = new MemberDaoImpl();
	}

	private static MemberServiceImpl instance = new MemberServiceImpl();

	public static MemberServiceImpl getInstance() {
		return instance;
	}
	
	@Override
	public Member checkLogin(Member member) {
		try {
			Member m = dao.selectOne(member.getUserId());
			if(m==null) {	//userId가 없음
				return null;
			}
			if(!m.getPassword().equals(member.getPassword())) {
				return null;
			}
			return m;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void add(Member member) {
		try {
			int result = dao.insert(member);
			System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean checkUserId(String userId) {
		try {
			return dao.selectOne(userId)!=null;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Member update(Member member) throws PasswordNotMatchException {
		try {
			int result = dao.update(member); //dao에서 비밀번호 검사까지 진행
			if(result == 0) {
				throw new PasswordNotMatchException("비밀번호가 일치하지 않습니다.");
			}
			return member;	//사용자 정보를 세션에 저장해놓기 위해 리턴
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
