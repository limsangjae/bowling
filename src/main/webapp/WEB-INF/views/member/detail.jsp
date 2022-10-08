<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<%@ include file="../include/head.jsp"%>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<%@ include file="../include/nav.jsp"%>

	<div class="hero page-inner overlay" style="background-image: url('${path}/resources/images/hero_bg_3.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mycenter">
					<h1 class="heading" data-aos="fade-up">${memberVO.memberName}의 페이지</h1>

					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item active text-white-50" aria-current="page"><c:out value="분류 : ${memberInfo.memberGrade}"/></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page"><c:out value="닉네임 : ${memberInfo.memberName}"/></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page"><c:out value="전화번호 : ${memberInfo.memberTel}"/></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page"><c:out value="주소 : ${memberInfo.memberAddr1},${memberInfo.memberAddr2}"/></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page"><c:out value="생년월일 : ${memberInfo.dateBirth}"/></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page"><c:out value="이메일 : ${memberInfo.memberEmail}"/></li>
						</ol>
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item active text-white-50">*회원등급은 등급을 변경하고자 하는 볼링장에 3개월간 4회이상 예약한 이력이 있어야 합니다.</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<div class="section bg-light">
		<div class="container">
			<div class="row">
				<c:if test="${memberBookCheck != 'empty'}">
					<c:forEach items="${memberBook}" var="memberBook">
						<div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="300">
							<div class="box-feature mb-4">
								<span class="flaticon-house mb-4 d-block"></span>
								<h3 class="text-black mb-3 font-weight-bold" id="boNum"><c:out value="예약번호 : ${memberBook.boNum}"/></h3>
								<h3 class="text-black mb-3 font-weight-bold"><c:out value="예약한 볼링장 :${memberBook.alleyName}"/></h3>
								<p class="text-black-50"><c:out value="예약시간 : ${memberBook.boTime}"/></p>
								<p class="text-black-50"><c:out value="예약날짜 : ${memberBook.boDate}"/></p>
								<p class="text-black-50"><c:out value="예약게임수 : ${memberBook.boGame}"/></p>
								<c:set var="total" value="${memberBook.publicCnt+memberBook.clubCnt+memberBook.studentCnt}"/>
								<p class="text-black-50"><c:out value="총 인원 : ${total}"/></p>
								<button class="btn btn-primary bookingDelete" id="bookingDelete" onclick="bookingDelete(<c:out value="${memberBook.boNum}"/>)">예약취소</button>
							</div>
						</div>					
					</c:forEach>
				</c:if>
				<c:if test="${memberBookCheck == 'empty'}">
					<div class="table_empty">
         				예약 내역이 없습니다.
         			</div>
				</c:if>	
			</div>
		</div>
	</div>



	<%@ include file="../include/footer.jsp"%>


    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
    	<div class="spinner-border" role="status">
    		<span class="visually-hidden">Loading...</span>
    	</div>
    </div>


   <%@ include file="../include/js.jsp"%>
   <script>
   $(function(){
		
	
	   
		
   })
   
   function bookingDelete(boNum){
			console.log(boNum);
			
			formdata = {
					boNum : boNum,
			}
			
			$.ajax({
				url:'/booking/delete',
				data:formdata,
				dataType:'text',
				type:'post',
				success:function(){
					
					let answer = confirm("예약을 취소하시겠습니까?");
					
					if(answer){
						alert("예약이 취소되었습니다.");
						location.reload();
					}
				},
				error : function(xhr, status, error){
	            	alert("취소실패");
	                console.log(xhr.status);           // 에러코드(404, 500 등)
	                console.log(xhr.responseText); // html 포맷의 에러 메시지
	                console.log(status);                // 'error'
	                console.log(error);                 // 'Not Found'
	        	}
			});
			
		}
   
   </script>
  </body>
  </html>
