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


	<div class="hero page-inner overlay" style="background-image: url('${path}/resources/images/bowling_logo.png');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up"><c:out value="${alleyInfo.alleyName}" /></h1>

					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item "><a href="index.jsp">Home</a></li>
							<li class="breadcrumb-item "><a href="detail.jsp">볼링장 목록</a></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page"><c:out value="${alleyInfo.alleyName}" /></li>
						</ol>
					</nav>


				</div>
			</div>


		</div>
	</div>


	<div class="section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-7">
					<div class="img-property-slide-wrap">
						<div class="img-property-slide">
							<img src="${path}/resources/images/hero_bg_3.jpg" alt="Image" class="img-fluid">
							<img src="${path}/resources/images/hero_bg_2.jpg" alt="Image" class="img-fluid">
							<img src="${path}/resources/images/hero_bg_1.jpg" alt="Image" class="img-fluid">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<h2 class="heading text-primary mb-4"><c:out value="${alleyInfo.alleyName}" /></h2>
					<div class="d-flex mb-3">
						<i class="bi bi-geo-alt-fill me-2"></i>
						<p class="meta"><c:out value="${alleyInfo.alleyAddr2}" /></p>
					</div>
					<div class="d-flex mb-3">
						<i class="bi bi-clock-fill me-2"></i> 
						<p class="text-black-50"><c:out value="${alleyInfo.openTime}시${alleyInfo.closeTime}시" /></p>
					</div>
					<div class="d-flex mb-3">
						<i class="bi bi-telephone-fill me-2"></i>
						<p class="text-black-50"><c:out value="${alleyInfo.alleyTel}" /></p>
					</div>
					<div class="d-flex mb-3">
						<i class="bi bi-currency-dollar me-2"></i>
						<p class="text-black-50"><c:out value="일반${alleyInfo.priceNomarl}원 클럽${alleyInfo.priceClub}원 학생${alleyInfo.priceStudent}원" /></p>
					</div>
					<p class="text-black-50"><c:out value="${alleyInfo.alleyContent}" escapeXml="false"/></p>
				</div>
				<div class="text-md-end">
					<button id="cancelBtn" class="btn btn-primary">목록</button>
					<button id="modifyBtn" class="btn btn-primary">수정</button>
				</div>
	            <form id="moveForm" action="/alley/list" method="get" >
					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
               	</form>
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
	/* 목록 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();	
	});	
	
	/* 수정 페이지 이동 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		let addInput = '<input type="hidden" name="alleySeq" value="${alleyInfo.alleySeq}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/alley/modify");
		$("#moveForm").submit();
	});
    </script>
  </body>
  </html>
