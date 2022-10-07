package com.bowling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowling.domain.vo.AlleyMemberGradeVO;
import com.bowling.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	
	@Override
	public void gradeUpReady(AlleyMemberGradeVO alleyMemberGradeVO) {
		adminMapper.gradeUpReady(alleyMemberGradeVO);
	}

	@Override
	public List<AlleyMemberGradeVO> gradeInfoList() {
		return adminMapper.gradeInfoList();
	}


	@Override
	public void gradeUpOk(int alleyMemberSeq) {
		adminMapper.gradeUpOk(alleyMemberSeq);
	}


	

}
