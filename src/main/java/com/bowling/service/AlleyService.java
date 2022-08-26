package com.bowling.service;

import java.util.List;

import com.bowling.domain.vo.AlleyVO;
import com.bowling.domain.vo.Criteria;

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
}
