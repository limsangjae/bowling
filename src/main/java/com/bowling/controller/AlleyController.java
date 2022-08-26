package com.bowling.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bowling.domain.vo.AlleyVO;
import com.bowling.domain.vo.Criteria;
import com.bowling.domain.vo.PageDTO;
import com.bowling.service.AlleyService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/alley")
@Log4j
public class AlleyController {
	
	@Autowired
	private AlleyService alleyService;
	
	
	//볼링장 등록
	@GetMapping("/register")
	public void registerGET() throws Exception {
		log.info("볼링장 등록 페이지 접속");
	}
	
	@PostMapping("/register.do")
	public String registerPOST(AlleyVO alleyVO, RedirectAttributes rttr) throws Exception{
		log.info("register : " + alleyVO);
		
		alleyService.alleyRegister(alleyVO); //볼링장 등록 쿼리 수행
		
		rttr.addFlashAttribute("register_result", alleyVO.getAlleyName()); //등록 성공 메세지(볼링장이름)
		
		
		return "redirect:/alley/list";
	}
	
	
	//볼링장 목록
	@GetMapping("/list")
	public void listGET(Criteria cri, Model model) throws Exception {
		log.info("볼링장 목록 페이지 접속");
		
		//볼링장 목록 출력 데이터
		List list =  alleyService.alleyList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list",list);	
		} else {
			model.addAttribute("listCheck", "empty");	
		}		
		
		//페이지 이동 인터페이스 데이터
		int total = alleyService.alleyTotal(cri);
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//볼링장 상세보기, 수정
	@GetMapping({"/detail","/modify"})
	public void alleyDetailGET(int alleySeq, Criteria cri, Model model) throws Exception{
		
		//볼링장 리스트 페이지 정보
		model.addAttribute("cri", cri);
		
		//선택한 볼링장 정보
		model.addAttribute("alleyInfo", alleyService.alleyDetail(alleySeq));
	}
	
	
	//볼링장 수정
	@PostMapping("/modify")
	public String alleyModifyPOST(AlleyVO alleyVO, RedirectAttributes rttr) {
		
		int result = alleyService.alleyModify(alleyVO);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/alley/list";
	}
	
	//볼링장 정보 삭제
	@PostMapping("/delete")
	public String alleyDeletePOST(int alleySeq, RedirectAttributes rttr) {
		
		int result = alleyService.alleyDelete(alleySeq);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/alley/list";
	}
	
	//첨부 파일 업로드
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		log.info("uploadAjaxActionPOST..........");
		String uploadFolder = "C:\\springframework_lsj\\upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		
		Date date = new Date(); //오늘날짜
		
		String str = sdf.format(date); //오늘날짜를 지정된 형식의 문자열 데이터로 생성
		
		String datePath = str.replace("-", File.separator); // 년월일 사이에  "-" 를 윈도우 경로 구분자인 '\'로 변경   
		
		File uploadPath = new File(uploadFolder, datePath);

		//폴더 생성
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			// 파일 이름  
			String uploadFileName = multipartFile.getOriginalFilename();	
			
			// uuid 적용 파일 이름 
			String uuid = UUID.randomUUID().toString(); //UUID 는 고유 식별자, UUID타입이기때문에 toString 으로 String타입으로 변경
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			// 파일 위치, 파일 이름을 합친 File 객체 
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 파일 저장 
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
	}

	
	@GetMapping("/remove")
	public void removeGET() throws Exception {
		log.info("볼링장 삭제 페이지 접속");
	}
}
