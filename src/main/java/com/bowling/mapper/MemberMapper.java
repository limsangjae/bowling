package com.bowling.mapper;

import java.util.List;

import com.bowling.domain.vo.BookingVO;
import com.bowling.domain.vo.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberVO memberVO);
	
	// 아이디 중복 검사
	public int idCheck(String memberId);
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO);
	
	//회원정보조회
	public MemberVO memberDetail(String memberId);
	
	//회원정보수정
	public int memberModify(MemberVO memberVO);
	
	//회원정보삭제
	public int memberDelete(String memberId);
	
	//예약정보조회
	public List<BookingVO> memberBookingDetail(String memberId);
}
