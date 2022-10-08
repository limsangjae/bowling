package com.bowling.mapper;

import java.util.List;

import com.bowling.domain.vo.AlleyMemberGradeVO;

public interface AdminMapper {
	
	public void gradeUpReady(AlleyMemberGradeVO alleyMemberGradeVO);
	
	public List<AlleyMemberGradeVO> gradeInfoList();
	
	public void gradeUpOk(int alleyMemberSeq);
	
}
