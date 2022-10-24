package com.bowling.service;

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
import com.bowling.mapper.AlleyMapper;
import com.bowling.mapper.AttachMapper;

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
			
			for(int i =0; i <alleyVO.getImageList().size(); i++) {
				
				String[] uuidArr = alleyVO.getImageList().get(0).getUuid().split(",");
				
				for(int j = 0; j < uuidArr.length; j++) {
					
					
					if( j == 0) {
						Image.put("uuid",alleyVO.getImageList().get(0).getUuid().split(",")[j]);
						Image.put("fileName",alleyVO.getImageList().get(0).getFileName().split(",")[j]);
						Image.put("uuid1", null);
						Image.put("fileName1", null);
						Image.put("uuid2", null);
						Image.put("fileName2", null);
					} else if ( j == 1) {
						Image.put("uuid1",alleyVO.getImageList().get(0).getUuid().split(",")[j]);
						Image.put("fileName1",alleyVO.getImageList().get(0).getFileName().split(",")[j]);
						Image.put("uuid2", null);
						Image.put("fileName2", null);
					} else {
						Image.put("uuid2",alleyVO.getImageList().get(0).getUuid().split(",")[j]);
						Image.put("fileName2",alleyVO.getImageList().get(0).getFileName().split(",")[j]);
					}
					
				}
			}
			Image.put("uploadPath", alleyVO.getImageList().get(0).getUploadPath().split(",")[0]);
			Image.put("alleySeq", alleyVO.getAlleySeq());
			
			
			alleyMapper.imageRegister(Image);
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
			
			
			for(int i =0; i <alleyVO.getImageList().size(); i++) {
				
				String[] uuidArr = alleyVO.getImageList().get(0).getUuid().split(",");
				
				for(int j = 0; j < uuidArr.length; j++) {
					
					
					if( j == 0) {
						Image.put("uuid",alleyVO.getImageList().get(0).getUuid().split(",")[j]);
						Image.put("fileName",alleyVO.getImageList().get(0).getFileName().split(",")[j]);
						Image.put("uuid1", null);
						Image.put("fileName1", null);
						Image.put("uuid2", null);
						Image.put("fileName2", null);
					} else if ( j == 1) {
						Image.put("uuid1",alleyVO.getImageList().get(0).getUuid().split(",")[j]);
						Image.put("fileName1",alleyVO.getImageList().get(0).getFileName().split(",")[j]);
						Image.put("uuid2", null);
						Image.put("fileName2", null);
					} else {
						Image.put("uuid2",alleyVO.getImageList().get(0).getUuid().split(",")[j]);
						Image.put("fileName2",alleyVO.getImageList().get(0).getFileName().split(",")[j]);
					}
					
				}
			}
			Image.put("uploadPath", alleyVO.getImageList().get(0).getUploadPath().split(",")[0]);
			Image.put("alleySeq", alleyVO.getAlleySeq());
			
			
			alleyMapper.imageRegister(Image);
			
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
