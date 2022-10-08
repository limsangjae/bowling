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
				</div>
			</div>
		</div>
	</div>


	<div class="section bg-light">
		<div class="container">
			<div class="row">
				<c:if test="${gradeInfoListCk != 'empty'}">
					<c:forEach items="${gradeInfoList}" var="gradeInfoList">
						<c:if test="${gradeInfoList.alleyMemberGrade == '일반'}">
							<div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="300">
								<div class="box-feature mb-4">
									<span class="flaticon-house mb-4 d-block"></span>
									<h3 class="text-black mb-3 font-weight-bold"><c:out value="볼링장 : ${gradeInfoList.alleyName}"/></h3>
									<h3 class="text-black mb-3 font-weight-bold"><c:out value="회원아이디 :${gradeInfoList.memberId}"/></h3>
									<p class="text-black-50"><c:out value="등급 : ${gradeInfoList.alleyMemberGrade}"/></p>
									<button class="gradeChange" onclick="gradeChange(<c:out value="${gradeInfoList.alleyMemberSeq}"/>)">승인</button>
								</div>
							</div>
						</c:if>
						<c:if test="${gradeInfoList.alleyMemberGrade == '클럽'}">
							<div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="300">
								<div class="box-feature mb-4 gradeUpOk">
									<span class="flaticon-house mb-4 d-block"></span>
									<h3 class="text-black mb-3 font-weight-bold"><c:out value="볼링장 : ${gradeInfoList.alleyName}"/></h3>
									<h3 class="text-black mb-3 font-weight-bold"><c:out value="회원아이디 :${gradeInfoList.memberId}"/></h3>
									<p class="text-black-50"><c:out value="등급 : ${gradeInfoList.alleyMemberGrade}"/></p>
									<p class="text-black-50">승인완료</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${gradeInfoListCk == 'empty'}">
					<div class="table_empty">
         				등급 변경 신청이 없습니다.
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
	
   
   function gradeChange(alleyMemberSeq){
	   
	   console.log(alleyMemberSeq);
	   
	   formdata ={
			   alleyMemberSeq : alleyMemberSeq
	   }
	   
	   $.ajax({
			url : '/admin/main/ok',
			data :formdata ,
			dataType : 'text',
			type:'post',
			success:function(){
				alert("승인되었습니다.");
				location.reload();
			},
			error : function(xhr, status, error){
           	alert("전송실패");
               console.log(xhr.status);           // 에러코드(404, 500 등)
               console.log(xhr.responseText); // html 포맷의 에러 메시지
               console.log(status);                // 'error'
               console.log(error);                 // 'Not Found'
       	}
				
		})
   }
   

	
   </script>
  </body>
  </html>
