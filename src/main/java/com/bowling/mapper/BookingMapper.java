package com.bowling.mapper;

import java.util.List;
import java.util.Map;

import com.bowling.domain.vo.BookingVO;

public interface BookingMapper {

	public void bookingRegister(BookingVO vo);
	
	public void alley_grade_register(BookingVO vo);
	
	public String alley_grade_select(BookingVO vo);
	
	public Map<String, Object> bookingDetail(BookingVO vo);
	
	public int bookingDelete(BookingVO vo);
	
	public List<BookingVO> selectBooking(BookingVO vo);
	
	public Integer bookingDetailOne(BookingVO vo);
}
