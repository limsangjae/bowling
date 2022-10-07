package com.bowling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bowling.domain.vo.AlleyMemberGradeVO;
import com.bowling.mapper.AdminMapper;
import com.bowling.service.AdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/main")
	public void adminMainGET(Model model) throws Exception{
		
		List<AlleyMemberGradeVO> gradeInfoList = adminService.gradeInfoList();
		if(!gradeInfoList.isEmpty()) {
			model.addAttribute("gradeInfoList", gradeInfoList);
		}else {
			model.addAttribute("gradeInfoListCk", "empty");
		}
		
	}
	
	
	@PostMapping("/main")
	public void adminMainPOST(AlleyMemberGradeVO alleyMemberGradeVO, Model model) {
		adminService.gradeUpReady(alleyMemberGradeVO);
		
	}
	
	@PostMapping("/main/ok")
	@ResponseBody
	public void gradeUpOk(int alleyMemberSeq) {
		
		adminService.gradeUpOk(alleyMemberSeq);
	}
	
}
