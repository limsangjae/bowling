package com.bowling.mapper;

import java.util.List;

import com.bowling.domain.vo.AlleyVO;
import com.bowling.domain.vo.AttachImageVO;
import com.bowling.domain.vo.Criteria;

public interface AlleyMapper {
	
	
	//볼링장 등록
	public void alleyRegister(AlleyVO alleyVO);
	
	//볼링장 목록
	public List<AlleyVO> alleyList(Criteria cri);
	
	//볼링장 총 개수
	public int alleyTotal(Criteria cri);
	
	//볼링장 상세보기
	public AlleyVO alleyDetail(int alleySeq);
	
	//볼링장 수정
	public int alleyModify(AlleyVO alleyVO);
	
	//볼링장 삭제
	public int alleyDelete(int alleySeq);
	
	//이미지 등록
	public void imageRegister(AttachImageVO vo);
	
	//지정 볼링장 이미지 전체 삭제
	public void deleteImageAll(int alleySeq);
}
