package com.bowling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowling.domain.vo.AttachImageVO;
import com.bowling.mapper.AttachMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttachServiceImpl implements AttachService {

	@Autowired
	private AttachMapper attachMapper;
	
	
	@Override
	public List<AttachImageVO> getAttachList(int alleySeq) {
		return attachMapper.getAttachList(alleySeq);
	}

}
