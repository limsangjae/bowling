package com.bowling.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bowling.domain.vo.BookingVO;
import com.bowling.service.BookingService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/booking")
public class BookingController {
	
	@Autowired
	private BookingService bookingService;

	@PostMapping("/reserve")
	@ResponseBody
	public int reservePOST(@ModelAttribute BookingVO vo) {
		
		String grade = bookingService.alley_grade_select(vo);
		
		if(grade == null) {
			bookingService.alley_grade_register(vo);
		}

		Integer result = bookingService.bookingDetailOne(vo); //사용자가 선택한 날짜와 시간에 존재하는 예약횟수의 총합
		if(result == null) {
			result = 0;
		}
		
		int totalCnt = vo.getTotalCnt(); // 사용자가 입력한 예약인원의 총합
		int maxPerson = vo.getMaxPerson(); // 볼링장별 최대 수용가능인원
		int allowPerson = maxPerson - result;
		int gameCnt = vo.getBoGame();
		
		int gameTime = (int) Math.ceil((gameCnt * totalCnt * 15)/60);
		
		String getTime = vo.getBoTime().substring(0,2); 
		int startTime = Integer.parseInt(getTime); // 사용자가 입력한 시작 시간
		int endTime = startTime + gameTime;
		
		
		if(!(totalCnt>allowPerson)) {
			for(int i=startTime; i <= endTime; i++) {
				vo.setBoTime(i+":00");
				bookingService.bookingRegister(vo);
			}
		}
		
		
		
		return result;
	}
	
	@GetMapping("/detail")
	@ResponseBody
	public Map<String, Object >bookingDetail(@ModelAttribute BookingVO vo) {
		
		
		Map<String, Object> result = bookingService.bookingDetail(vo);
		

		System.out.println(result);
		
		
		return result;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public int bookingDelete(@ModelAttribute BookingVO vo) {
		return bookingService.bookingDelete(vo);
	}
	
//	@PostMapping(value="/selectBooking",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public List<BookingVO> selectBooking(@ModelAttribute BookingVO vo) {
//
//		return bookingService.selectBooking(vo);
//	}
//	
//	
	
	
}
