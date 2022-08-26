package com.bowling.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//회원가입
	@PostMapping("/join")
	public String joinPOST(MemberVO memberVO) throws Exception{
		
		String rawPw = "";    //인코딩 전 비밀번호
		String encodePw = ""; //인코딩 후 비밀번호
		
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
                //session.setMaxInactiveInterval(10); 세션 유지 시간 10초
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

	
	
}
