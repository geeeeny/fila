package edu.iot.fila.service;

import edu.iot.fila.exception.PasswordNotMatchException;
import edu.iot.fila.model.Member;

public interface MemberService {

	//로그인시 아이디와 비밀번호 일치여부 검사
	Member checkLogin(Member member);

	//회원가입
	void add(Member member);

	//회원가입시 아이디 중복검사
	boolean checkUserId(String userId);

	//회원정보 변경
	Member update(Member member) throws PasswordNotMatchException;

}