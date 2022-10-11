package com.bowling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowling.domain.vo.AlleyMemberGradeVO;
import com.bowling.domain.vo.AlleyVO;
import com.bowling.domain.vo.AttachImageVO;
import com.bowling.domain.vo.BookingVO;
import com.bowling.domain.vo.Criteria;
import com.bowling.domain.vo.SearchVO;
import com.bowling.mapper.AlleyMapper;
import com.bowling.mapper.AttachMapper;

@Service
public class AlleyServiceImpl implements AlleyService {
	
	@Autowired
	private AlleyMapper alleyMapper;
	
	@Autowired
	private AttachMapper attachMapper; 

	@Override
	public void alleyRegister(AlleyVO alleyVO) throws Exception {
		alleyMapper.alleyRegister(alleyVO);
		
		if(alleyVO.getImageList() == null || alleyVO.getImageList().size() <= 0) {
			return;
		}
		
		System.out.println(alleyVO.getImageList());
		
		alleyVO.getImageList().forEach(attach ->{
			
			attach.setAlleySeq(alleyVO.getAlleySeq());
			alleyMapper.imageRegister(attach);
			
		});
	}

	@Override
	public List<AlleyVO> alleyList(Criteria cri) throws Exception {
		
		List<AlleyVO> list = alleyMapper.alleyList(cri);
		
		list.forEach(alley -> {
			int alleySeq = alley.getAlleySeq();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(alleySeq);
			
			alley.setImageList(imageList);
			
		});
		
		return list;
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
		int result = alleyMapper.alleyModify(alleyVO);
		
		if(result == 1 && alleyVO.getImageList() != null && alleyVO.getImageList().size() > 0) {
			
			alleyMapper.deleteImageAll(alleyVO.getAlleySeq());
			
			alleyVO.getImageList().forEach(attach -> {
				
				attach.setAlleySeq(alleyVO.getAlleySeq());
				alleyMapper.imageRegister(attach);
				
			});
			
		}
		
		return result;
	}

	@Override
	public int alleyDelete(int alleySeq) {
		return alleyMapper.alleyDelete(alleySeq);
	}

	@Override
	public String alleyMemberGrade(AlleyMemberGradeVO alleyMemberGradeVO) {
		return alleyMapper.alleyMemberGrade(alleyMemberGradeVO);
	}

	@Override
	public int MemberGradeCk(BookingVO bookingVO) {
		return alleyMapper.MemberGradeCk(bookingVO);
	}

	@Override
	public int bookingTotalCnt(SearchVO searchVO) {
		return alleyMapper.bookingTotalCnt(searchVO);
	}

	@Override
	public List<AlleyVO> searchAlleyInfo(SearchVO searchVO) {
		return alleyMapper.searchAlleyInfo(searchVO);
	}

}
