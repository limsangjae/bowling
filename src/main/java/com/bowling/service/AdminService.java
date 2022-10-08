package com.bowling.service;

import java.util.List;

import com.bowling.domain.vo.AlleyMemberGradeVO;

public interface AdminService {
	
	public void gradeUpReady(AlleyMemberGradeVO alleyMemberGradeVO);

	public List<AlleyMemberGradeVO> gradeInfoList();
	
	public void gradeUpOk(int alleyMemberSeq);
}
