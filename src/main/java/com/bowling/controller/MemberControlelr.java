package com.bowling.controller;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bowling.domain.vo.BookingVO;
import com.bowling.domain.vo.MemberVO;
import com.bowling.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberControlelr {
	


	@Autowired
	private MemberService memberService;
	
	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private BCryptPasswordEncoder pwEncoder;
	
	//회원가입 페이지 이동
	@GetMapping("/join")
	public void joinGET() {
		
		log.info("회원가입 페이지 진입");
		
	}
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public void loginGET() {
		
		log.info("로그인 페이지 진입");
		
	}
	
	public int getAge(String InputAge) throws Exception {
		
		
		//현재 년도 구하기
		 Date now = new Date(); 
			 
		 //태어난년도를 위한 세팅
		 SimpleDateFormat format = new SimpleDateFormat("yyyy");
		 
 		 //전달받은값 Date로 변환
		 Date inputdate = format.parse(InputAge);
		 
		 //현재날짜를 'yyyy'로 변환
		 String currentYear = format.format(now);
		 
		 
		 String stringBirthYear = format.format(inputdate); //년도만받기
		 
		 //태어난 년도
		 Integer birthYear = Integer.parseInt(stringBirthYear);
		 
		 //현재년도
		 Integer nowYear = Integer.parseInt(currentYear);

		 // 현재 년도 - 태어난 년도 => 나이 (만나이X)
	     int age = (nowYear - birthYear +1);
	        
	 	 return age;
	}
	

	
	//회원가입
	@PostMapping("/join")
	public String joinPOST(MemberVO memberVO) throws Exception{
		
		String rawPw = "";    //인코딩 전 비밀번호
		String encodePw = ""; //인코딩 후 비밀번호
		
		int age = getAge(memberVO.getDateBirth());
		memberVO.setAge(age);
        
		if(age < 20) {
			memberVO.setMemberGrade("학생");
		}else {
			memberVO.setMemberGrade("성인");
		}
		
		rawPw = memberVO.getMemberPw();            // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        memberVO.setMemberPw(encodePw);            // 인코딩된 비밀번호 member객체에 다시 저장
		
        /* 회원가입 쿼리 실행 */
        memberService.memberJoin(memberVO);
        
        
		return "redirect:/member/login";
	}
	
	// 아이디 중복 검사
	@ResponseBody
	@PostMapping("/memberIdChk")
	public String memberIdChkPOST(String memberId) throws Exception{
		
//		log.info("memberIdChk() 진입");
		int result = memberService.idCheck(memberId);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}
		
	} // memberIdChkPOST() 종료
	
	@PostMapping("/login.do")
	public String loginPOST(HttpServletRequest request, MemberVO memberVO, RedirectAttributes rttr) throws Exception {
       
		HttpSession session = request.getSession();
        String rawPw = "";
        String encodePw = "";
        
        MemberVO lvo = memberService.memberLogin(memberVO);    // 제출한아이디와 일치하는 아이디 있는지 
        
         
        if(lvo != null) {            // 일치하는 아이디 존재시
            
            rawPw = memberVO.getMemberPw();        // 사용자가 제출한 비밀번호
            encodePw = lvo.getMemberPw();        // 데이터베이스에 저장한 인코딩된 비밀번호
            
            if(true == pwEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
                
                lvo.setMemberPw("");                    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("memberVO", lvo);     // session에 사용자의 정보 저장
                session.setMaxInactiveInterval(30*60); //세션 유지 시간 30분
                return "redirect:/";        // 메인페이지 이동
                
                
            } else {
 
                rttr.addFlashAttribute("result", 0);            
                return "redirect:/member/login";    // 로그인 페이지로 이동
                
            }
            
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            
            rttr.addFlashAttribute("result", 0);            
            return "redirect:/member/login";    // 로그인 페이지로 이동
            
        }
		
	}
	
	@GetMapping("/logout.do")
	public String logoutMainGET(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
		
	}

	//회원정보 조회,수정
	//예약내역조회
	@GetMapping({"/detail","/modify"})
	public void detailGET(String memberId, Model model,HttpServletRequest request) throws Exception {
		
		
		HttpSession session = request.getSession();
		
		MemberVO sessionMember = (MemberVO)session.getAttribute("memberVO");
		String sessionId = sessionMember.getMemberId();
		
		
		List<BookingVO> memberBook = memberService.memberBookingDetail(sessionId);
		
		if(!memberBook.isEmpty()) {
			model.addAttribute("memberBook", memberBook);
		}else {
			model.addAttribute("memberBookCheck", "empty");
		}
		
		model.addAttribute("memberInfo", memberService.memberDetail(sessionId));
		
		
	}
	
	//회원정보수정
	@PostMapping("/modify")
	public String modifyPOST(MemberVO memberVO, RedirectAttributes rttr) throws Exception {
		
		String rawPw = "";    //인코딩 전 비밀번호
		String encodePw = ""; //인코딩 후 비밀번호
		
        rawPw = memberVO.getMemberPw();            // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        memberVO.setMemberPw(encodePw);            // 인코딩된 비밀번호 member객체에 다시 저장
		
		
		int result = memberService.memberModify(memberVO);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/member/detail";
	}
	
	//회원정보삭제
	@PostMapping("/delete")
	public String memberDeletePOST(String memberId, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		
		memberService.memberDelete(memberId);
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
}
