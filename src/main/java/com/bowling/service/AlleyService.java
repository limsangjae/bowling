package com.bowling.service;

import java.util.List;

import com.bowling.domain.vo.AlleyMemberGradeVO;
import com.bowling.domain.vo.AlleyVO;
import com.bowling.domain.vo.BookingVO;
import com.bowling.domain.vo.Criteria;
import com.bowling.domain.vo.SearchVO;

public interface AlleyService {
	
	//볼링장 등록
	public void alleyRegister(AlleyVO alleyVO) throws Exception;
	
	//볼링장 목록
	public List<AlleyVO> alleyList(Criteria cri) throws Exception;
	
	//볼링장 총 수
	public int alleyTotal(Criteria cri) throws Exception;
	
	//볼링장 상세보기
	public AlleyVO alleyDetail(int alleySeq) throws Exception;
	
	//볼링장 수정
	public int alleyModify(AlleyVO alleyVO);
	
	//볼링장 삭제
	public int alleyDelete(int alleySeq);
	
	//볼링장별 회원등급조회
	public String alleyMemberGrade(AlleyMemberGradeVO alleyMemberGradeVO);
	
	//회원등급 조건 체크
	public int MemberGradeCk(BookingVO bookingVO);

	//사용자가 입력한 값에 해당되는 예약 횟수의 총합
	public int bookingTotalCnt(SearchVO searchVO);
	
	//사용자가 입력한 값으로 찾은 볼링장들의 목록
	public List<AlleyVO> searchAlleyInfo(SearchVO searchVO);
}
