package com.bowling.mapper;

import java.util.List;

import com.bowling.domain.vo.AttachImageVO;

public interface AttachMapper {
	
	//이미지 데이터 변환
	public List<AttachImageVO> getAttachList(int alleySeq);

}
