package edu.iot.fila.service;

import java.util.HashMap;
import java.util.Map;

import edu.iot.fila.exception.PasswordNotMatchException;
import edu.iot.fila.model.Member;

//dao가 아닌 map으로 구현한 것(데이터베이스 연동x)
public class MemberServiceMapImpl implements MemberService {

	Map<String, Member> map;
	
	private MemberServiceMapImpl() {
		map = new HashMap<>();
		
		for(int i=1; i<4; i++) {
			Member member = Member.builder()
						.userId("hong"+i)
						.password("1234")
						.name("홍길동"+i)
						.build();
			map.put(member.getUserId(), member);
		}
	}

	private static MemberService instance = new MemberServiceMapImpl();

	public static MemberService getInstance() {
		return instance;
	}

	@Override
	public Member checkLogin(Member member) {
		Member m = map.get(member.getUserId());
		if(m==null) {	//userId가 없음
			return null;
		}
		if(!m.getPassword().equals(member.getPassword())) {	//비밀번호 불일치
			return null;
		}
		//로그인 성공
		return m;
	}

	@Override
	public void add(Member member) {
		map.put(member.getUserId(), member);
	}

	@Override
	public boolean checkUserId(String userId) {
		return map.get(userId)!=null;	//map에 아이디가 있으면 true 리턴
	}

	@Override
	public Member update(Member member) throws PasswordNotMatchException {
		Member orgMember = map.get(member.getUserId());
		if(orgMember.getPassword().equals(member.getPassword())) {
			//비밀번호 일치하는 경우 갱신
			orgMember.setCellPhone(member.getCellPhone());
			orgMember.setEmail(member.getEmail());
			orgMember.setAddress(member.getAddress());
			orgMember.setName(member.getName());
		}else {
			//비밀번호가 일치하지 않는 경우 에러 처리
			throw new PasswordNotMatchException("비밀번호가 일치하지 않습니다.");
		}
		return orgMember;
	}
}
