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

	<div class="hero page-inner overlay"
		style="background-image: url('${path}/resources/images/hero_bg_3.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					
					<div class="col-lg-9 text-center search_wrap">
						<form id="searchForm" action="/alley/list" method="get" class="narrow-w form-search d-flex align-items-stretch mb-3"data-aos="fade-up" data-aos-delay="200">
								<input type="text" class="form-control px-4" name="alleyName" placeholder="볼링장 이름" value='<c:out value="${pageMaker.cri.alleyName}"></c:out>'>
								<input type="text" class="form-control px-4" name="alleyAddr1" placeholder="지역" value='<c:out value="${pageMaker.cri.alleyAddr1}"></c:out>'>
								<input type="hidden" name="pageNum"value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
								<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"></c:out>'>
								<c:if test="${not empty pageMaker.cri.boDate}">
									<input type="hidden" name="boDate" value='<c:out value="${pageMaker.cri.boDate }"></c:out>'>
									<input type="hidden" name="boRain" value='<c:out value="${pageMaker.cri.boRain }"></c:out>'>
									<input type="hidden" name="boTime" value='<c:out value="${pageMaker.cri.boTime }"></c:out>'>
								</c:if>
								<button class='btn btn-primary' style="width: 170px;">검색</button>
						</form>
					</div>
					
					<nav aria-label="breadcrumb" data-aos="fade-up"
						data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>




	<div class="section section-properties">
		<div class="container">
			<div class="row">
				<c:if test="${listCheck != 'empty' }">
					<c:forEach items="${list}" var="list">
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
							<div class="property-item mb-30">
								<div class="image_wrap img" data-alleyseq="${list.imageList[0].alleySeq}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}"> 
									<a href='<c:out value="${list.alleySeq}"/>' class="move">
										<img alt="Image" class="img-fluid">
									</a>
								</div>
								<div class="property-content content_wrap">
									<div class="price mb-2">
										<span><c:out value="${list.alleyName}" /></span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><c:out value="${list.alleyAddr1},${list.alleyAddr2}" /></span>
										<span class="city d-block mb-3"></span>
	
										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
											 <i class="bi bi-telephone-fill me-2"></i>
											 <span class="caption"><c:out value="${list.alleyTel}" /></span>
											</span>
											 <span class="d-block d-flex align-items-center">
											  <i class="bi bi-clock-fill me-2"></i> 
											  <span class="caption"><c:out value="${fn:substring(list.openTime,0,5)}~${fn:substring(list.closeTime,0,5)}" /></span>
											</span>
										</div>
	
										<a href='<c:out value="${list.alleySeq}"/>' class="btn btn-primary py-2 px-3 move">예약하기</a>
									</div>
								</div>
							</div>
							<!-- .item -->
						</div>
					</c:forEach>
				</c:if>
           		<c:if test="${listCheck == 'empty'}">
         			<div class="table_empty">
         				예약 가능한 볼링장이 없습니다.
         			</div>
             	</c:if>  
			</div>
		</div>
		<c:if test="${memberVO.adminCk == 1 }">
			<div class="btn_wrap">
				<a href="/alley/register" class="btn btn-primary py-2 px-3">등록하기</a>
			</div>
		</c:if>
		<!-- 페이지 이동 인터페이스 영역 -->
		<div class="pageMaker_wrap">

			<ul class="pageMaker">

				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageMaker_btn prev"><a
						href="${pageMaker.pageStart - 1}">이전</a></li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}"
					var="num">
					<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next"><a
						href="${pageMaker.pageEnd + 1 }">다음</a></li>
				</c:if>

			</ul>

		</div>
		<form id="moveForm" action="/alley/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="alleyName" value="${pageMaker.cri.alleyName}">
			<input type="hidden" name="alleyAddr1" value="${pageMaker.cri.alleyAddr1}">
			<c:if test="${not empty pageMaker.cri.boDate}">
				<input type="hidden" name="boDate" value='<c:out value="${pageMaker.cri.boDate }"></c:out>'>
				<input type="hidden" name="boRain" value='<c:out value="${pageMaker.cri.boRain }"></c:out>'>
				<input type="hidden" name="boTime" value='<c:out value="${pageMaker.cri.boTime }"></c:out>'>
			</c:if>
		</form>
		
		<form id="detailForm">
			
		</form>
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
		$(document).ready(function(){
			
			
			
			/* 등록 성공 이벤트 */
			let eResult = '<c:out value="${register_result}"/>';
			checkResult(eResult);
			function checkResult(result){
				
				if(result === ''){
					return;
				}
				
				alert("볼링장'"+ eResult +"'을 등록하였습니다.");
				
			}
			
			/* 수정 성공 이벤트 */
			let modify_result = '${modify_result}';
			
			if(modify_result == 1){
				alert("수정 완료");
			}	
			
			/* 삭제 결과 경고창 */
			let delete_result = '${delete_result}';
		
		
			/* 이미지 삽입 */
			$(".image_wrap").each(function(i, obj){
				
				const aobj = $(obj);
				
				if(aobj.data("alleyseq")){
					const uploadPath = aobj.data("path");
					const uuid = aobj.data("uuid");
					const fileName = aobj.data("filename");
					
					const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
					
					$(this).find("img").attr('src', 'display?fileName=' + fileCallPath);
				} else{
					$(this).find("img").attr('src', '${path}/resources/images/Noimg.png');
				}
				
			});
		
		});
	
		let detailForm = $("#detailForm");
		let moveForm = $('#moveForm');
		let searchForm = $('#searchForm');

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();
		});
		
		/* 볼링장 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			
			e.preventDefault();
					
			searchForm.find("input[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});
		/* 볼링장 조회 페이지 */
		$(".move").on("click", function(e){
			
			e.preventDefault();
			
			const user = "${memberVO.memberId}";
			if(user != ""){
				detailForm.append("<input type='hidden' name='alleySeq' value='"+$(this).attr("href") + "'>");
				detailForm.attr("action", "/alley/detail");
				detailForm.submit();
			}else{
				detailForm.attr("action", "/member/login");
				detailForm.submit();
			}
			
			
		});
		
		
		
	</script>
</body>
</html>
