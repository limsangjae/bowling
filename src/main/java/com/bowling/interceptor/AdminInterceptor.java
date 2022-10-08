package com.bowling.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bowling.domain.vo.MemberVO;

public class AdminInterceptor implements HandlerInterceptor{

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//
//		HttpSession session = request.getSession();
//		
//		MemberVO lvo = (MemberVO)session.getAttribute("memberVO");
//		
//		if(lvo == null || lvo.getAdminCk() == 0) {
//			
//			response.sendRedirect("/");
//			
//			return false;
//			
//		}
//		
//		return true;
//	}

}
