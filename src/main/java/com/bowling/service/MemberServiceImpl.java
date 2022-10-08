package com.bowling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowling.domain.vo.BookingVO;
import com.bowling.domain.vo.MemberVO;
import com.bowling.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public void memberJoin(MemberVO memberVO) throws Exception {
		memberMapper.memberJoin(memberVO);
	}

	@Override
	public int idCheck(String memberId) throws Exception {
		return memberMapper.idCheck(memberId);
	}

	@Override
	public MemberVO memberLogin(MemberVO memberVO) throws Exception {
		return memberMapper.memberLogin(memberVO);
	}

	@Override
	public MemberVO memberDetail(String memberId) throws Exception {
		return memberMapper.memberDetail(memberId);
	}
 
	@Override
	public int memberModify(MemberVO memberVO) throws Exception {
		return memberMapper.memberModify(memberVO);
	}

	@Override
	public int memberDelete(String memberId) throws Exception {
		return memberMapper.memberDelete(memberId);
	}

	@Override
	public List<BookingVO> memberBookingDetail(String memberId) throws Exception {
		return memberMapper.memberBookingDetail(memberId);
	}

}
