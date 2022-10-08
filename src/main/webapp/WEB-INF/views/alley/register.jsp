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
<%@ include file = "../include/head.jsp" %>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<%@ include file = "../include/nav.jsp" %>

	<div class="hero page-inner overlay" style="background-image: url('${path}/resources/images/hero_bg_3.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up">볼링장 등록</h1>
					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item "><a href="index.jsp">Home</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<div class="section">
		<div class="container">
			<div class="row">
				<div data-aos="fade-up" data-aos-delay="200">
					<form action="/alley/register.do" method="post" id="registerForm">
						<div class="row justify-content-between">
							<div class="col-lg-7">
								<div class="col-10 mb-3">
									<b>볼링장 이름</b>
									<input name="alleyName" class="form-control" placeholder="볼링장 이름">
								</div>
								<div class="col-10 mb-3">
									<input name="alleyZipCode" class="form-control address_input_1" placeholder="우편번호" readonly="readonly">
									<button onclick="execution_daum_address()" type="button" class="btn btn-primary addrBtn">주소 찾기</button>
								</div>
								<div class="col-10 mb-3">
									<input name="alleyAddr1" class="form-control address_input_2" placeholder="주소" readonly="readonly">
								</div>
								<div class="col-10 mb-3">
									<input name="alleyAddr2" class="form-control address_input_3" placeholder="상세주소" readonly="readonly">
								</div>
								<div class="col-10 mb-3">
									<input name="alleyTel" class="form-control" placeholder="전화번호">
								</div>
								<div class="col-10 mb-3">
									<input name="openTime" class="form-control" placeholder="오픈시간">
								</div>
								<div class="col-10 mb-3">
									<input name="closeTime" class="form-control" placeholder="마감시간">
								</div>
								<div class="col-10 mb-3">
									<input name="priceNomarl" class="form-control" placeholder="일반가격">
								</div>
								<div class="col-10 mb-3">
									<input name="priceClub" class="form-control" placeholder="클럽가격">
								</div>
								<div class="col-10 mb-3">
									<input name="priceStudent" class="form-control" placeholder="학생가격">
								</div>
								<div class="col-10 mb-3">
									<input name="alleyRain" class="form-control" placeholder="레인개수">
								</div>
								<div class="col-10 mb-3">
									<textarea name="alleyContent" id="alleyContent_textarea" class="form-control" placeholder="볼링장 소개"></textarea>
								</div> 
								<div class="col-10 mb-3">
									<input type="file" multiple="multiple" id ="fileItem" name="uploadFile" class="form-control">
								</div>
								<input type="hidden" name="firstRegistId" value="${memberVO.memberId}">
								<input type="hidden" name="lastUpdtId" value="${memberVO.memberId}">
							</div>
						<div class="col-lg-5 mb-5 mb-lg-0 order-lg-2">
							<div class="img-about" id="uploadResult">

							</div>
						</div>
						</div>
						
					</form>
					<div class="col-10">
						<button id ="cancelBtn" class = "btn btn-primary">취소</button>
						<button id ="registerBtn" class = "btn btn-primary">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- /.untree_co-section -->

	<%@ include file = "../include/footer.jsp" %>


    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
    	<div class="spinner-border" role="status">
    		<span class="visually-hidden">Loading...</span>
    	</div>
    </div>


    <%@ include file = "../include/js.jsp" %>
    
    <script>
    	var registerForm = $("#registerForm")
    	
    	/* 볼링장 등록 버튼 */
    	$("#registerBtn").on("click",function(e){
    		
    		e.preventDefault();
    		
    		registerForm.submit();
    	});
    	
    	/* 취소 버튼 */
		$("#cancelBtn").click(function(){
			
			location.href="/alley/list"
			
		});
    	 /* 다음 주소 연동 */
    	 function execution_daum_address(){
    	 	 
    	     new daum.Postcode({
    	         oncomplete: function(data) {
    	             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
    	         	 
    	         	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
    	             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    	             var addr = ''; // 주소 변수
    	             var extraAddr = ''; // 참고항목 변수

    	             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
    	             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
    	                 addr = data.roadAddress;
    	             } else { // 사용자가 지번 주소를 선택했을 경우(J)
    	                 addr = data.jibunAddress;
    	             }

    	             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
    	             if(data.userSelectedType === 'R'){
    	                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
    	                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
    	                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
    	                     extraAddr += data.bname;
    	                 }
    	                 // 건물명이 있고, 공동주택일 경우 추가한다.
    	                 if(data.buildingName !== '' && data.apartment === 'Y'){
    	                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    	                 }
    	                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    	                 if(extraAddr !== ''){
    	                     extraAddr = ' (' + extraAddr + ')';
    	                 }
    	                 // 주소변수 문자열과 참고항목 문자열 합치기
    	                 addr += extraAddr;
    	                 
    	             
    	             } else {
    	                 addr += ' ';
    	             }

    	             // 우편번호와 주소 정보를 해당 필드에 넣는다.
    	             $(".address_input_1").val(data.zonecode);
    	             $(".address_input_2").val(addr);
    	          	// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
    	             $(".address_input_3").attr("readonly",false);
    	             $(".address_input_3").focus();
    	         }
    	     }).open();    
    	  
    	 }
    	/* 위지윅 적용 */
    	 
    	/* 볼링장 소개 */
    	ClassicEditor
    		.create(document.querySelector('#alleyContent_textarea'))
    		.catch(error=>{
    			console.error(error);
    		});
    	
    	/* 이미지 업로드 */
    	$("input[type='file']").on("change", function(e){
    		

    		
    		let formData = new FormData();
    		let fileInput = $('input[name="uploadFile"]');
    		let fileList = fileInput[0].files;
    		let fileObj = fileList[0];
    		
    		if(!fileCheck(fileObj.name, fileObj.size)){
    			return false;
    		}
    		for(let i = 0; i < fileList.length; i++){
    			formData.append("uploadFile", fileList[i]);
    		}
    		$.ajax({
    			url: '/alley/uploadAjaxAction',
    	    	processData : false,
    	    	contentType : false,
    	    	data : formData,
    	    	type : 'POST',
    	    	dataType : 'json',
   		    	success : function(result){
   		    		console.log(result);
   		    		showUploadImage(result);
   		    	},
   		    	error : function(result){
   		    		alert("이미지 파일이 아닙니다.")
   		    	}
    		});
    	
    	});
    	
    	/* var, method related with attachFile */
    	let regex = new RegExp("(.*?)\.(jpg|png)$");
    	let maxSize = 1048576; //1MB	
    	
    	function fileCheck(fileName, fileSize){

    		if(fileSize >= maxSize){
    			alert("파일 사이즈 초과");
    			return false;
    		}
    			  
    		if(!regex.test(fileName)){
    			alert("해당 종류의 파일은 업로드할 수 없습니다.");
    			return false;
    		}
    		
    		return true;		
    		
    	}
    	
    	/* 이미지 출력 */
    	function showUploadImage(uploadResultArr){

    		/* 전달받은 데이터 검증 */
    		if(!uploadResultArr || uploadResultArr.length == 0){return}
    		
	    	let uploadResult = $("#uploadResult");
	    	
	    	let obj = uploadResultArr[0];
	    	
	    	let str = "";
	    	
	    	let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
	    	
	    	str += "<div id='result_card'>";
			str += "<img src='display?fileName=" + fileCallPath +"' class='img-fluid mb-2'>";
			str += "<div class='imgDeleteBtn' data-file='"+ fileCallPath +"'><i class='bi bi-x-circle'></i></div>";
			str += "</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
			
			uploadResult.append(str);
    	}
    	
    	/* 이미지 삭제 버튼 동작 */
    	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
    		deleteFile();
    	});
    	/* 파일 삭제 메서드 */
    	function deleteFile(){
    		
    		let targetFile = $(".imgDeleteBtn").data("file");
    		
    		let targetDiv = $("#result_card");
    		
    		$.ajax({
    			url: '/alley/deleteFile',
    			data : {fileName : targetFile},
    			dataType : 'text',
    			type : 'POST',
    			success : function(result){
    				console.log(result);
    				
    				targetDiv.remove();
    				$("input[type='file']").val("");
    			},
    			error : function(result){
    				console.log(result);
    				
    				alert("파일을 삭제하지 못하였습니다.")
    			}
           });
    		
    	}
    	
    	
    </script>
    
  </body>
  </html>
