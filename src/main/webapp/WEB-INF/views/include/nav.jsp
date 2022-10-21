<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
crossorigin="anonymous"
referrerpolicy="no-referrer">
</script>
</head>
<body>
<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<a href="/" class="logo m-0 float-start">볼링어때</a>

					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li class="has-children">
							<a href="/alley/list">볼링장</a>
							<ul class="dropdown">
								<c:if test="${memberVO.adminCk == 1 }">
									<li><a href="/alley/register">볼링장 등록</a></li>
								</c:if>
								<li><a href="/alley/list">볼링장 목록</a></li>
							</ul>
						</li>
						
						<!-- 관리자로 로그인했을때 -->
						<c:if test="${memberVO.adminCk == 1}">
							<li><a href="/admin/main">관리자페이지</a></li>
						</c:if>
						
						<!-- 로그인 하지 않은 상태 -->
						<c:if test="${memberVO == null}">
							<li><a href="/member/login">로그인</a></li>
						</c:if>
						
						<!-- 로그인한 상태 -->
						<c:if test="${ memberVO != null}">
							<c:if test="${memberVO.adminCk != 1}">							
								<li class="has-children">
									<a href="/member/detail">${memberVO.memberName}님</a>
									<ul class="dropdown">
										<li><a href="/member/detail">예약내역</a></li>
										<li><a href="/member/modify">회원정보수정</a></li>
									</ul>
								</li>						
							</c:if>	
							<li><a href="/member/logout.do">로그아웃</a></li>
						</c:if>
					</ul>

					<a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>

				</div>
			</div>
		</div>
	</nav>


</body>
</html>