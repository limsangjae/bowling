package com.bowling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowling.domain.vo.AlleyVO;
import com.bowling.domain.vo.Criteria;
import com.bowling.mapper.AlleyMapper;

@Service
public class AlleyServiceImpl implements AlleyService {
	
	@Autowired
	AlleyMapper alleyMapper;

	@Override
	public void alleyRegister(AlleyVO alleyVO) throws Exception {
		alleyMapper.alleyRegister(alleyVO);
	}

	@Override
	public List<AlleyVO> alleyList(Criteria cri) throws Exception {
		return alleyMapper.alleyList(cri);
	}

	@Override
	public int alleyTotal(Criteria cri) throws Exception {
		return alleyMapper.alleyTotal(cri);
	}

	@Override
	public AlleyVO alleyDetail(int alleySeq) throws Exception {
		return alleyMapper.alleyDetail(alleySeq);
	}

	@Override
	public int alleyModify(AlleyVO alleyVO) {
		return alleyMapper.alleyModify(alleyVO);
	}

	@Override
	public int alleyDelete(int alleySeq) {
		return alleyMapper.alleyDelete(alleySeq);
	}

}
