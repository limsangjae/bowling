package com.bowling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowling.domain.vo.BookingVO;
import com.bowling.mapper.BookingMapper;

@Service
public class BookingServiceImpl implements BookingService {

	
	@Autowired
	BookingMapper bookingMapper;

	@Override
	public void bookingDetail(BookingVO vo) {
		
	}
	
	

}
