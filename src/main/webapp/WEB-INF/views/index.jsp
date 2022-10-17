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
<!-- 				<div class="col-lg-9 text-center"> -->
<!-- 					<h1 class="heading" data-aos="fade-up">볼링장 검색</h1> -->
<!-- 					<form action="#" class="narrow-w form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200"> -->
<!-- 						<input type="text" class="form-control px-4" placeholder="볼링장 이름"> -->
<!-- 						<button type="submit" class="btn btn-primary">Search</button> -->
<!-- 					</form> -->
<!-- 				</div> -->

				<div class="col-lg-6 text-center">
					<h1 class="heading" data-aos="fade-up">볼링장 검색</h1>
					<form id="searchForm" action="/alley/list" method="get" class="form-search mb-3"data-aos="fade-up" data-aos-delay="200">
						<div class="search_section">
							<input type="text" class="form-control px-4" name="keyword" id="keyword" placeholder="볼링장 이름" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
							<span class="search_section_span">or</span>
							<input type="text" class="form-control px-4" name="localName" id="localName" placeholder="지역명" value='<c:out value="${list.localName}"></c:out>'>
						</div>
						<div class="search_section">
							<input type="text" class="datepicker form-control px-4" name="boDate" id="boDate" readonly="readonly" placeholder="날짜" autocomplete='off' value='<c:out value="${list.boDate}"></c:out>'>
							<input type="text" class="form-control px-4" name="boTime" id="boTime" placeholder="시간(24시간)" oninput="boTimeInput()" maxlength="5" value='<c:out value="${list.boTime}"></c:out>'>
							<input type="text" class="form-control px-4" name="totalCnt" id="totalCnt" placeholder="인원" oninput="totalCntInput()" maxlength="2" value='<c:out value="${list.totalCnt}"></c:out>'>
							<input type="text" class="form-control px-4" name="boGame" id="boGame" placeholder="게임수" oninput="boGameInput()" maxlength="2" value='<c:out value="${list.boGame}"></c:out>'>
						</div>
						<div class="search_section">
							<button class='btn btn-primary search_buuton'>검색</button>
						</div>
							<input type="hidden" name="pageNum"value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
							<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"></c:out>'>
					</form>
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
		if(!$("#keyword").val() && !$("#localName").val()){
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
		if(!$("#totalCnt").val()){
			alert("인원수를 입력하십시오");
			return false;
		}
		if(!$("#boGame").val()){
			alert("게임수를 입력하십시오");
			return false;
		}
		var boTime = $("#boTime").val()
		boTime = boTime.replace(boTime,boTime + ":00");
		$("#boTime").val(boTime);
		
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.find("input[name='amount']").val("9");
		searchForm.submit();
		
	});
	
	
	
	function boTimeInput(){
		var onlyNum = /[0-9]/;
		var boTime = $("#boTime").val()
		
		if(!onlyNum.test(boTime)){
			$("#boTime").val("");
		}
	}
	
	function totalCntInput(){
		var onlyNum = /[0-9]/;
		var totalCnt = $("#totalCnt").val()
		
		if(!onlyNum.test(totalCnt)){
			$("#totalCnt").val("");
		}
	}
	
	function boGameInput(){
		var onlyNum = /[0-9]/;
		var boGame = $("#boGame").val()
		
		if(!onlyNum.test(boGame)){
			$("#boGame").val("");
		}
	}
	
	
    </script>
  </body>
  </html>
