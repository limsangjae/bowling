package com.bowling.service;

import java.util.List;

import com.bowling.domain.vo.BookingVO;
import com.bowling.domain.vo.MemberVO;

public interface MemberService {
	
	//회원가입
	public void memberJoin(MemberVO memberVO) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;	
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;
	
	//회원정보조회
	public MemberVO memberDetail(String memberId) throws Exception;
	
	//회원정보수정
	public int memberModify(MemberVO memberVO) throws Exception;
	
	//회원정보삭제
	public int memberDelete(String memberId) throws Exception;
	
	//예약정보조회
	public List<BookingVO> memberBookingDetail(String memberId) throws Exception;
}
