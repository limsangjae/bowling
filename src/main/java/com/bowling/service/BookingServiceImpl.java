package com.bowling.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bowling.domain.vo.BookingVO;
import com.bowling.mapper.BookingMapper;

@Service
public class BookingServiceImpl implements BookingService {

	
	@Autowired
	BookingMapper bookingMapper;

	@Override
	@Transactional
	public void bookingRegister(BookingVO vo) {
		bookingMapper.bookingRegister(vo);
	}

	@Override
	public Map<String, Object> bookingDetail(BookingVO vo) {
		
		return bookingMapper.bookingDetail(vo);
	}

	@Override
	public int bookingDelete(BookingVO vo) {
		return bookingMapper.bookingDelete(vo);
	}

	@Override
	public List<BookingVO> selectBooking(BookingVO vo) {
		return bookingMapper.selectBooking(vo);
	}


	@Override
	public String alley_grade_select(BookingVO vo) {
		return bookingMapper.alley_grade_select(vo);
	}

	@Override
	public void alley_grade_register(BookingVO vo) {
		bookingMapper.alley_grade_register(vo);
	}

	@Override
	public Integer bookingDetailOne(BookingVO vo) {
		return bookingMapper.bookingDetailOne(vo);
	}

	
	
	

}
