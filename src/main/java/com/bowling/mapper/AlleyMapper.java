package com.bowling.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bowling.domain.vo.AlleyMemberGradeVO;
import com.bowling.domain.vo.AlleyVO;
import com.bowling.domain.vo.AttachImageVO;
import com.bowling.domain.vo.BookingVO;
import com.bowling.domain.vo.Criteria;
import com.bowling.domain.vo.SearchVO;

public interface AlleyMapper {
	
	
	//볼링장 등록
	public void alleyRegister(AlleyVO alleyVO);
	
	//볼링장 목록
	public List<AlleyVO> alleyList();
	
	//볼링장 총 개수
	public int alleyTotal(Criteria cri);
	
	//볼링장 상세보기
	public AlleyVO alleyDetail(int alleySeq);
	
	//볼링장 수정
	public int alleyModify(AlleyVO alleyVO);
	
	//볼링장 삭제
	public int alleyDelete(int alleySeq);
	
	//이미지 등록
	public void imageRegister(Map attach);
	
	//지정 볼링장 이미지 전체 삭제
	public void deleteImageAll(int alleySeq);
	
	//볼링장별 회원등급조회
	public String alleyMemberGrade(AlleyMemberGradeVO alleyMemberGradeVO);
	
	//회원등급 조건 체크
	public int MemberGradeCk(BookingVO bookingVO);
	
	
	//사용자가 입력한 값으로 찾은 볼링장들의 목록
	public List<AlleyVO> searchAlleyInfo(Criteria cri);
}
