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

<%@ include file = "include/head.jsp" %>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<%@ include file = "include/nav.jsp" %>

	<div class="hero">


		<div class="hero-slide">
			<div class="img overlay" style="background-image: url('${path}/resources/images/hero_bg_3.jpg')"></div>
			<div class="img overlay" style="background-image: url('${path}/resources/images/hero_bg_2.jpg')"></div>
			<div class="img overlay" style="background-image: url('${path}/resources/images/hero_bg_1.jpg')"></div>
		</div>

		<div class="container">
			<div class="row justify-content-center align-items-center">

				<div class="col-lg-5 text-center"style="background-color: #F8F7F9; border-radius: 3rem; padding: 33px;" data-aos="fade-up">
					<h1 class="heading" data-aos="fade-up">예약가능 볼링장 검색</h1>
					<form id="searchForm" action="/alley/list" method="get" class="form-search mb-3"data-aos="fade-up" data-aos-delay="200">
						<div class="search_section">
							<input type="text" class="form-control px-4" name="alleyName" id="alleyName" placeholder="볼링장 이름" autocomplete="off">
							<input type="text" class="form-control px-4" name="alleyAddr1" id="alleyAddr1" placeholder="지역명" autocomplete="off">
						</div>
						<div class="search_section">
							<input type="text" class="datepicker form-control px-4" name="boDate" id="boDate" readonly="readonly" placeholder="날짜" autocomplete='off'>
							<select id="boTime" name="boTime" class="form-control px-4" style="margin-left: 0px;">
									<option selected disabled>시간</option>
								<c:forEach var="i" begin="9" end="24">
									<option>${i}:00</option>
								</c:forEach>
							</select>
							<input type="text" class="form-control px-4" name="boRain" id="boRain" placeholder="레인개수" oninput="boRainInput()" maxlength="2" autocomplete="off" >
						</div>
						<div class="search_section">
							<button class='btn btn-primary search_buuton'>검색</button>
						</div>
							<input type="hidden" name="pageNum"value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
							<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"></c:out>'>
					</form>
					<a href="/alley/list" data-aos="fade-up" style="color: #A68C67;">모든 볼링장 목록</a>
				</div>

			</div>
		</div>

	</div>

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
    	<div class="spinner-border" role="status">
    		<span class="visually-hidden">Loading...</span>
    	</div>
    </div>

	<!-- script -->
	<%@ include file = "include/js.jsp" %>
	
    <script>
    
    $.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    minDate:0
	});
    
    $('.datepicker').datepicker()
    
    
	let searchForm = $('#searchForm');
	let moveForm = $('#moveForm');
	$("#searchForm button").on("click", function(e){
		
		e.preventDefault();
		
		/* 검색 키워드 유효성 검사 */
		if(!$("#alleyName").val() && !$("#alleyAddr1").val()){
			alert("볼링장이름 혹은 지역명을 입력하십시오");
			return false;
		}
		
		if(!$("#boDate").val()){
			alert("날짜를 입력하십시오");
			return false;
		}
		if(!$("#boTime").val()){
			alert("시간를 입력하십시오");
			return false;
		}
		if(!$("#boRain").val()){
			alert("레인개수를 입력하십시오");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.find("input[name='amount']").val("9");
		searchForm.submit();
		
	});
	
	
	
	
	function boRainInput(){
		var onlyNum = /[0-9]/;
		var boRain = $("#boRain").val()
		
		if(!onlyNum.test(boRain)){
			$("#boRain").val("");
		}
	}

	
	
    </script>
  </body>
  </html>
