package com.bowling.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;

@Service
public class AlleyServiceImpl implements AlleyService {
	String[] uuidArr = {};
	
	@Autowired
	private AlleyMapper alleyMapper;
	
	@Autowired
	private AttachMapper attachMapper; 

	@Override
	public void alleyRegister(AlleyVO alleyVO) throws Exception {
		alleyMapper.alleyRegister(alleyVO);
		
		
		if(alleyVO.getImageList() != null && alleyVO.getImageList().size() > 0) {
			
			Map<String, Object> Image = new HashMap<>();
			
			
			alleyVO.getImageList().forEach(attach ->{

				Image.put("alleySeq", alleyVO.getAlleySeq());
				Image.put("uploadPath",attach.getUploadPath().split(",")[0]);
				Image.put("uuid",attach.getUuid().split(",")[0]);
				Image.put("uuid1",attach.getUuid().split(",")[1]);
				Image.put("uuid2",attach.getUuid().split(",")[2]);
				Image.put("fileName",attach.getFileName().split(",")[0]);
				Image.put("fileName1",attach.getFileName().split(",")[1]);
				Image.put("fileName2",attach.getFileName().split(",")[2]);
				
				alleyMapper.imageRegister(Image);
			});
		} else {
			return;
		}
		
	}

	@Override
	public List<AlleyVO> alleyList() throws Exception {
		
		List<AlleyVO> list = alleyMapper.alleyList();
		
		list.forEach(alley -> {
			int alleySeq = alley.getAlleySeq();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(alleySeq);
			
			alley.setImageList(imageList);
			
		});
		
		return list;
		
	}
	
	@Override
	public List<AlleyVO> searchAlleyInfo(Criteria cri) {
		
		List<AlleyVO> list = alleyMapper.searchAlleyInfo(cri);
		
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
			
			Map<String, Object> Image = new HashMap<>();
			
			alleyVO.getImageList().forEach(attach ->{

				
				Image.put("uuid",attach.getUuid().split(",")[0]);
				Image.put("fileName",attach.getFileName().split(",")[0]);
				Image.put("uploadPath",attach.getUploadPath().split(",")[0]);
				Image.put("alleySeq", alleyVO.getAlleySeq());
				
				if(alleyVO.getImageList().size() > 1) {
					Image.put("uuid1",attach.getUuid().split(",")[1]);
					Image.put("fileName1",attach.getFileName().split(",")[1]);
				}
				if(alleyVO.getImageList().size() > 2) {
					Image.put("uuid2",attach.getUuid().split(",")[2]);
					Image.put("fileName2",attach.getFileName().split(",")[2]);
				}
				
				alleyMapper.imageRegister(Image);
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

	



}
