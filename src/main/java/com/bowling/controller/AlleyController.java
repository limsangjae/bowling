package com.bowling.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bowling.domain.vo.AlleyVO;
import com.bowling.domain.vo.AttachImageVO;
import com.bowling.domain.vo.BookingVO;
import com.bowling.domain.vo.Criteria;
import com.bowling.domain.vo.PageDTO;
import com.bowling.service.AlleyService;
import com.bowling.service.AttachService;
import com.bowling.service.BookingService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/alley")
@Log4j
public class AlleyController {
	
	@Autowired
	private AlleyService alleyService;
	
	@Autowired
	private AttachService attachService;

	@Autowired
	private BookingService bookingService;
	
	
	
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
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		log.info("uploadAjaxActionPOST..........");
		
		//이미지 파일 체크
		for(MultipartFile multipartFile : uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath()); //probeContentType(파일의 MIME TYPE을 반환해주는 메서드)
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(!type.startsWith("image")){
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list,HttpStatus.BAD_REQUEST);
			}
			
		}
		
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
		
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : uploadFile) {
			
			//이미지 정보 객체
			AttachImageVO vo = new AttachImageVO();
			
			// 파일 이름  
			String uploadFileName = multipartFile.getOriginalFilename();	
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			// uuid 적용 파일 이름 
			String uuid = UUID.randomUUID().toString(); //UUID 는 고유 식별자, UUID타입이기때문에 toString 으로 String타입으로 변경
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			// 파일 위치, 파일 이름을 합친 File 객체
			// 원본 이미지
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 파일 저장 
			try {
				multipartFile.transferTo(saveFile);
				
				
				/* 썸네일 생성(ImageIO) */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
						
				BufferedImage bo_image = ImageIO.read(saveFile); //ImageIO(이미지를 읽어오거나 생성할 수 있음), BufferedImage(이미지 데이터를 처리하거나 조작에 필요한 값과 메서드 제공)
				
				/* 비율 */
				double ratio = 3;
				/*넓이 높이*/
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR); //넓이,높이,생성될 이미지 타입
				
				Graphics2D graphic = bt_image.createGraphics(); //Graphics2D(그림을 그리는데 필요한 설정값과 메서드를 제공)
				
				graphic.drawImage(bo_image, 0, 0, width, height, null); //원본 이미지를 썸네일에 지정한 크기로 변경하여 왼쪽 상단 "0,0"좌표부터 그려줌, 6번째 인자(이미지의 정보를 전달받아서 이미지를 업데이트시키는 역할 일반적으로 null)
				
				ImageIO.write(bt_image, "jpg", thumbnailFile);//("파일로 저장할 이미지","어떠한 이미지 형식으로 저장할지","썸네일 이미지가 저장될 경로와 이름")		
				
				
				/* thumbnail 라이브러리 */
				/*
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
		        */
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo);
		}//for
		
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list,HttpStatus.OK);
		
		return result;
		
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		File file = new File("C:\\springframework_lsj\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			//FileCopyUtils(파일과 stream복사에 사용할 수 있는 메서드를 재공)
			//copyToByteArray(파라미터로 부여하는 File객체 즉, 대상파일을 복사하여 Byte 배열로 반환해줌)
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		File file = null;
		
		try {
			//썸네일 파일 삭제
			file = new File("C:\\springframework_lsj\\upload\\" + URLDecoder.decode(fileName,"UTF-8"));
			
			file.delete();
			
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			file = new File(originFileName);
			file.delete();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail",HttpStatus.NOT_IMPLEMENTED);
		}//catch
		
		return new ResponseEntity<String>("succcess", HttpStatus.OK);
		
	}
	
	/*이미지 정보 반환*/
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int alleySeq){
		
		return new ResponseEntity<List<AttachImageVO>>(attachService.getAttachList(alleySeq),HttpStatus.OK);
	}
	
	
	@PostMapping("/reserve")
	@ResponseBody
	public String reservePOST(@ModelAttribute BookingVO vo) {
		
		String boTime = vo.getBoTime();
		
		bookingService.bookingDetail(vo);
		
		return boTime;
	}
	
	//성웅씨 코드
//	@PostMapping('/post')
//	@ResponseBody
//	public Stirng posttest(@RequestParam Map<String, Object> commandMap) {
//	public String posttest(@ModelAttribute BookingVO bookingvo){
//		
//			booking.getAlleyseq()
//			commandMap.get("data");
//			commandMap.get("name").toString();
//			Integer.parseInt(commandMap.get("age").toString());
//		
//	}
	
	//민성씨 코드
//	@GetMapping(value="/dupleCheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public String ss(HttpServletRequest request, RedirectAttributes rttr) {
//		
//		String test = (String) request.getParameter("param");
//		
//		return test;
//	}
	
}
