package com.bowling.service;

import java.util.Map;

import com.bowling.domain.vo.BookingVO;

public interface BookingService {

	public void bookingRegister(BookingVO vo);
	
	public void alley_grade_register(BookingVO vo);
	
	public String alley_grade_select(BookingVO vo);
	
	public Map<String, Object> bookingDetail(BookingVO vo);
	
	public int bookingDelete(BookingVO vo);
	
	public Integer bookingDetailOne(BookingVO vo);
}
