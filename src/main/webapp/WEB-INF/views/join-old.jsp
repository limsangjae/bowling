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
<%@ include file = "./include/head.jsp" %>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<%@ include file = "./include/nav.jsp" %>

	<div class="hero page-inner overlay" style="background-image: url('${path}/resources/images/hero_bg_1.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up">회원가입</h1>

					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item "><a href="index.jsp]">Home</a></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page">회원가입</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<div class="section">
		<div class="container">
			<div class="row ">
				<div class="col-lg-12" data-aos="fade-up" data-aos-delay="200">
					<form id="join_form" method="post">
						<div class="row">
							<div class="col-6 mb-3">
								<input type="text" class="form-control id_input" name="memberId" placeholder="아이디">
								<span class="id_input_re_1">사용 가능한 아이디 입니다.</span>
								<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
							</div>
							<div class="col-6 mb-3">
								<input type="text" class="form-control" name="memberPw" placeholder="비밀번호">
							</div>
							<div class="col-6 mb-3">
								<input type="email" class="form-control" name="memberEmail" placeholder="이메일">
							</div>
							<div class="col-3 mb-3">
								<input type="email" class="form-control" name="memberEmail" placeholder="이메일">
							</div>
							<div class="col-6 mb-3">
								<input type="email" class="form-control" name="memberName" placeholder="이름">
							</div>
							<div class="col-6 mb-3">
								<input type="email" class="form-control" name="memberAge" placeholder="나이">
							</div>
							<div class="col-6 mb-3">
								<input type="email" class="form-control" name="memberTel" placeholder="전화번호">
							</div>
							<div class="col-6 mb-3">
								<input type="email" class="form-control" name="memberAddr" placeholder="주소">
							</div>
							<div class="col-6 text-lg-end">
								<input type="button" value="가입하기" class="join_button btn btn-primary">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div> <!-- /.untree_co-section -->

	<!-- footer -->
	<%@ include file = "./include/footer.jsp" %>


    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
    	<div class="spinner-border" role="status">
    		<span class="visually-hidden">Loading...</span>
    	</div>
    </div>


    <!-- script -->
	<%@ include file = "./include/js.jsp" %>
	<script>

	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
		$(".join_button").click(function(){
			$("#join_form").attr("action", "/member/join");
			$("#join_form").submit();
		});
	});
	
	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){
		var memberId = $('.id_input').val();			// .id_input에 입력되는 값
		var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");				
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");				
				}			
			}// success 종료
		}); //

	});// function 종료
	
	

	</script>
  </body>
  </html>
