package com.bowling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {

	@GetMapping("/main")
	public void adminMainGET() throws Exception{
		log.info("관리자 페이지 이동");
	}
	
	
	
}
