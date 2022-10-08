package com.bowling.service;

import java.util.List;

import com.bowling.domain.vo.AttachImageVO;

public interface AttachService {

	//이미지 데이터 반환
	public List<AttachImageVO> getAttachList(int alleySeq);
	
}
