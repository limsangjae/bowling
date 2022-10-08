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

				<div class="col-lg-9 text-center">
					<h1 class="heading" data-aos="fade-up">볼링장 검색</h1>
					<form id="searchForm" action="/alley/list" method="get" class="narrow-w form-search d-flex align-items-stretch mb-3"data-aos="fade-up" data-aos-delay="200">
							<input type="text" class="form-control px-4" name="keyword" placeholder="볼링장 이름" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
							<input type="hidden" name="pageNum"value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
							<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"></c:out>'>
							<button class='btn btn-primary'>검색</button>
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
    
	let searchForm = $('#searchForm');
	let moveForm = $('#moveForm');
	$("#searchForm button").on("click", function(e){
		
		e.preventDefault();
		
		/* 검색 키워드 유효성 검사 */
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하십시오");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.find("input[name='amount']").val("9");
		searchForm.submit();
		
	});
	
	
	
    </script>
  </body>
  </html>
