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
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up"><c:out value="${alleyInfo.alleyName}" /></h1>

					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
						<c:if test="${memberGrade != null}">
							<li class="breadcrumb-item active text-white-50 ">현재 회원님의 ${alleyInfo.alleyName}에서 등급 : <c:out value="${memberGrade}"/></li>
						</c:if>
						<c:if test="${memberGrade == null}">
							<li class="breadcrumb-item active text-white-50 ">예약한적이 없는 볼링장 입니다.</li>
						</c:if>
						<c:if test="${memberGradeCk >= 4 and memberGrade == '일반'}">
							<li class="breadcrumb-item "><button class="gradeChange" id="gradeChange">회원등급 변경 신청</button></li>
						</c:if>
						</ol>
					</nav>


				</div>
			</div>


		</div>
	</div>


	<div class="section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-8">
					<div class="slider-wrap">
						<div class="slider">
							<div class="content">
								<div id="uploadResult" class="content img-about ">
							
								</div>
							</div>
							<div class="content">
								<div id="uploadResult1" class="content img-about ">
							
								</div>
							</div>
							<div class="content">
								<div id="uploadResult2" class="content img-about ">
							
								</div>
							</div>

						</div>

					</div>
					
						
				</div>
				<div class="col-lg-4">
					<div class="mb-2 text-md-center">
						<b>위치</b>
					</div>
					<div class="row justify-content-center mb-3">
						<div id="map"style="height:300px;">
					
						</div>
					</div>
					<div class="d-flex mb-3">
						<b>영업시간 : </b>
						<p class="text-black-50"><c:out value="${fn:substring(alleyInfo.openTime,0,5)}~${fn:substring(alleyInfo.closeTime,0,5)}" /></p>
					</div>
					<div class="d-flex mb-3">
						<b>전화번호 : </b>
						<p class="text-black-50"><c:out value="${alleyInfo.alleyTel}" /></p>
					</div>
					<div class="d-flex mb-3">
						<b>일반 가격 : </b>
						<p class="text-black-50"><fmt:formatNumber value="${alleyInfo.priceNomarl}" pattern="#,###" />원</p>
					</div>
					<div class="d-flex mb-3">
						<b>클럽가격 : </b>
						<p class="text-black-50"><fmt:formatNumber value="${alleyInfo.priceClub}" pattern="#,###" />원</p>
					</div>
					<div class="d-flex mb-3">
						<b>학생가격 : </b>
						<p class="text-black-50"><fmt:formatNumber value="${alleyInfo.priceStudent}" pattern="#,###" />원</p>
					</div>
					<div class="d-flex mb-3">
						<b>레인개수 : </b>
						<p class="text-black-50"><c:out value="${alleyInfo.alleyRain}" />레인</p>
					</div>
					<c:if test="${not empty alleyInfo.alleyContent}">
						<div class="d-flex mb-3">
							<b>소개 : </b>
							<p class="text-black-50"><c:out value="${alleyInfo.alleyContent}" escapeXml="false"/></p>
						</div>
					</c:if>
					
				</div>
	            <form id="moveForm" action="/alley/list" method="get" >
					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="alleyName" value="${cri.alleyName}">
               	</form>
			</div>
			<div class="row justify-content-between mt-5">
				<div class="col-lg-8">
					<div class="d-flex mb-3 date_wrap">
						<i class="bi bi-calendar3 me-2 fs-5"></i>
						<input class="datepicker btn btn-primary" value="">
					</div>
					<div class="time_wrap" id="time_wrap">
						<fmt:parseNumber value="${fn:substring(alleyInfo.openTime,0,2)}" var="openTime"/>
						<fmt:parseNumber value="${fn:substring(alleyInfo.closeTime,0,2)}" var="closeTime"/>
						<c:forEach var="i" begin="${openTime}" end="${closeTime}">
							<div class="time_box_wrap">
								<input id="time${i}" class="time_box btn btn-primary" type="button" value="${i}:00">
							</div>
						</c:forEach>
					</div>					
				</div>
				<div class="col-lg-4 gameinfo_wrap mt-5">
					<div class="d-flex mb-3 justify-content-center">
						<b class="me-3">*게임수  : </b>
						<input type="button" class="plu_mi_btn" onclick='count("game_minus")' value='-'>
						<input id ="boGame" class="gameinfo_input" maxlength="2" value="0">
						<input type="button" class="plu_mi_btn" onclick='count("game_plus")' value='+'>
					</div>
					<div class="d-flex mb-3 justify-content-center">
						<b class="me-3">일반인원 : </b>
						<input type="button" class="plu_mi_btn" onclick='count("public_minus")' value='-'>
						<input id ="publicCnt" class="gameinfo_input" maxlength="2" value="0">
						<input type="button" class="plu_mi_btn" onclick='count("public_plus")' value='+'>
					</div>
					<div class="d-flex mb-3 justify-content-center">
						<b class="me-3">클럽인원 : </b>
						<input type="button" class="plu_mi_btn" onclick='count("club_minus")' value='-'>
						<input id ="clubCnt" class="gameinfo_input" maxlength="2" value="0">
						<input type="button" class="plu_mi_btn" onclick='count("club_plus")' value='+'>
					</div>
					<div class="d-flex mb-3 justify-content-center">
						<b class="me-3">학생인원 : </b>
						<input type="button" class="plu_mi_btn" onclick='count("student_minus")' value='-'>
						<input id ="studentCnt" class="gameinfo_input" maxlength="2" value="0">
						<input type="button" class="plu_mi_btn" onclick='count("student_plus")' value='+'>
					</div>
					<div class="d-flex mb-3 justify-content-center">
						<b class="me-3">레인 개수 : </b>
						<select id="boRain" class="rain_input">
							<c:forEach var="i" begin="1" end="${alleyInfo.alleyRain}">
								<option>${i}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="text-md-end mt-5">
				<c:if test="${memberVO.adminCk != null }">
					<button id="reserveBtn" class="btn btn-primary">예약</button>
				</c:if>
					<button id="cancelBtn" class="btn btn-primary">목록</button>
				<c:if test="${memberVO.adminCk == 1 }">
					<button id="modifyBtn" class="btn btn-primary">볼링장 정보 수정</button>
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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ivc6xnl87f&submodules=geocoder"></script>s
    <script>
    
    function count(type){
    	var boGame = $("#boGame").val()
    	var publicCnt = $("#publicCnt").val()
    	var clubCnt = $("#clubCnt").val()
    	var studentCnt = $("#studentCnt").val()
    	
    	<!-- 게임수 증감 -->
    	if(type == 'game_plus'){
    		boGame = parseInt(boGame) + 1;
    	}else if(type == 'game_minus' && boGame != 0){
    		boGame = parseInt(boGame) - 1;
    	}
    	
    	<!-- 일반인원 증감 -->
    	if(type == 'public_plus'){
    		publicCnt = parseInt(publicCnt) + 1;
    	}else if(type == 'public_minus' && publicCnt != 0){
    		publicCnt = parseInt(publicCnt) - 1;
    	}
    	
    	<!-- 클럽인원 증감 -->
    	if(type == 'club_plus'){
    		clubCnt = parseInt(clubCnt) + 1;
    	}else if(type == 'club_minus' && clubCnt != 0){
    		clubCnt = parseInt(clubCnt) - 1;
    	}
    	
    	<!-- 학생인원 증감 -->
    	if(type == 'student_plus'){
    		studentCnt = parseInt(studentCnt) + 1;
    	}else if(type == 'student_minus' && studentCnt != 0){
    		studentCnt = parseInt(studentCnt) - 1;
    	}
    	
    	$("#boGame").val(boGame);
    	$("#publicCnt").val(publicCnt);
    	$("#clubCnt").val(clubCnt);
    	$("#studentCnt").val(studentCnt);
    }
    
    
    var map = new naver.maps.Map("map", {
      zoom: 20,
      mapTypeControl: false
    });
    

    

    var infoWindow = new naver.maps.InfoWindow({
      anchorSkew: false
    });

    map.setCursor('pointer');

    function searchCoordinateToAddress(latlng) {


      naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
          naver.maps.Service.OrderType.ADDR,
          naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
      }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
          if (!latlng) {
            return alert('ReverseGeocode Error, Please check latlng');
          }
          if (latlng.toString) {
            return alert('ReverseGeocode Error, latlng:' + latlng.toString());
          }
          if (latlng.x && latlng.y) {
            return alert('ReverseGeocode Error, x:' + latlng.x + ', y:' + latlng.y);
          }
          return alert('ReverseGeocode Error, Please check latlng');
        }

        var address = response.v2.address,
            htmlAddresses = [];

        if (address.jibunAddress !== '') {
            htmlAddresses.push('[지번 주소] ' + address.jibunAddress);
        }


      });
    }

    function searchAddressToCoordinate(address) {
      naver.maps.Service.geocode({
        query: address
      }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
          if (!address) {
            return alert('Geocode Error, Please check address');
          }
          return alert('Geocode Error, address:' + address);
        }

        if (response.v2.meta.totalCount === 0) {
          return alert('No result.');
        }

        var htmlAddresses = [],
          item = response.v2.addresses[0],
          point = new naver.maps.Point(item.x, item.y);

        if (item.jibunAddress) {
          htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
        }

        infoWindow.setContent([
          '<div style="padding:10px;min-width:80px;max-width:360px;line-height:100%;">',
          '<h5 style="margin-top:5px;">'+ address +'</h5><br />',
          htmlAddresses.join('<br />'),
          '</div>'
        ].join('\n'));

        map.setCenter(point);
        
        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(point),
            map: map
        });
        infoWindow.open(map, marker);
      });
    }

    function initGeocoder() {
      map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
      });

      $('#address').on('keydown', function(e) {
        var keyCode = e.which;

        if (keyCode === 13) { // Enter Key
          searchAddressToCoordinate($('#address').val());
        }
      });

      $('#submit').on('click', function(e) {
        e.preventDefault();

        searchAddressToCoordinate($('#address').val());
      });

      searchAddressToCoordinate('${alleyInfo.alleyAddr1} <br> ${alleyInfo.alleyAddr2}');
    }

    naver.maps.onJSContentLoaded = initGeocoder;
    
    $(function(){
    	
    	 $(".slider").slick({
    	   	    dots:true,
    	   	    autoplay:true,
    	   	    speed:200,
    	   	    
    	 })
    	
    	
    	/* 이미지 정보 호출 */
    	let alleySeq = '<c:out value="${alleyInfo.alleySeq}"/>';
    	let uploadResult = $("#uploadResult");
    	let uploadResult1 = $("#uploadResult1");
    	let uploadResult2 = $("#uploadResult2");
    	
    	$.getJSON("getAttachList",{alleySeq : alleySeq}, function(arr){

    		if(arr.length === 0 ){
    			
				let str = "";
				str += "<div id='result_card' class='result_card'>";
				str += "<img src='${path}/resources/images/Noimg.png' class='img-fluid'>";
				str += "</div>";
				
				uploadResult.append(str);
				uploadResult1.append(str);
				uploadResult2.append(str);
    			
    			return;
    		}
    		
    		let obj = arr[0];
    		let str = "";
    		
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card' class='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='display?fileName=" + fileCallPath +"' class='img-fluid'>";
			str += "</div>";		
			
			uploadResult.append(str);
			
			
			if(arr[0].uuid1 == null){
    			let str = "";
				str += "<div id='result_card' class='result_card'>";
				str += "<img src='${path}/resources/images/Noimg.png' class='img-fluid'>";
				str += "</div>";
				
				uploadResult1.append(str);
    		}else{
    			let str1 = "";
        		
    			let fileCallPath1 = encodeURIComponent(obj.uploadPath + "/" + obj.uuid1 + "_" + obj.fileName1);
    			str1 += "<div id='result_card' class='result_card'";
    			str1 += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid1 + "' data-filename='" + obj.fileName1 + "'";
    			str1 += ">";
    			str1 += "<img src='display?fileName=" + fileCallPath1 +"' class='img-fluid'>";
    			str1 += "</div>";		
    			
    			uploadResult1.append(str1);
    		}
			
    		if(arr[0].uuid2 == null){
    			let str = "";
				str += "<div id='result_card' class='result_card'>";
				str += "<img src='${path}/resources/images/Noimg.png' class='img-fluid'>";
				str += "</div>";
				
				uploadResult2.append(str);
    		}else{
        		let str2 = "";
        		
    			let fileCallPath2 = encodeURIComponent(obj.uploadPath + "/" + obj.uuid2 + "_" + obj.fileName2);
    			str2 += "<div id='result_card' class='result_card'";
    			str2 += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid2 + "' data-filename='" + obj.fileName2 + "'";
    			str2 += ">";
    			str2 += "<img src='display?fileName=" + fileCallPath2 +"' class='img-fluid'>";
    			str2 += "</div>";		
    			
    			uploadResult2.append(str2);
    		}

    	});
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

    	
    });
    

	
	$('.datepicker').val("날짜선택");
    
    let url = new URL(window.location.href);
    
    let date = $('.datepicker').val();
	let memberId = "${memberVO.memberId}";
    let alleySeq = url.searchParams.get('alleySeq')

    
	
    
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
	
	function time(num) {
		$("#time"+num).toggleClass("active");
		$("#time"+num).parents().siblings().children().removeClass("active");
		
	}

	$('.datepicker').datepicker({
		onSelect:function(){
			const date = $('.datepicker').val();
			const memberId = "${memberVO.memberId}";
		
			console.log(date);
			
			formdata ={
					alleySeq : alleySeq,
					boDate : date,
					memberId : memberId,
			}
			
			$.ajax({
				url: '/booking/detail',
				data: formdata ,
				type : 'get',
				dataType:'json',
				success:function(data){
					
					console.log(data);

					var html = "";
					
					var rain = ${alleyInfo.alleyRain};
					
					for(let i = ${fn:substring(alleyInfo.openTime,0,2)}; i <= ${fn:substring(alleyInfo.closeTime,0,2)}; i++) {
						
						
						
						html +="<div class='time_box_wrap'>";
						html +="<input id='time"+i+"' class='time_box btn btn-primary' type='button' value='"+i+":00' onclick='time("+i+")'>";
						html +="<p>예약가능레인 :"+ (rain - data["t"+i]) + "</p>";
						
						html +="</div>";	
					}
					$("#time_wrap").html(html);
					
					
					for(let i = ${fn:substring(alleyInfo.openTime,0,2)}; i <= ${fn:substring(alleyInfo.closeTime,0,2)}; i++) {
						if(data["t"+i] >= rain) {
							$("#time"+i).attr("disabled","disabled");
						}
					}
					
					
		
					//날짜를 선택했을때 관리자이거나 로그인한memberId와 해당 예약의 memberId가 같으면 i태그가 보이고 아니면 안보이게
					
				},
				error : function(xhr, status, error){
	            	alert("실패");
	                console.log(xhr.status);           // 에러코드(404, 500 등)
	                console.log(xhr.responseText); // html 포맷의 에러 메시지
	                console.log(status);                // 'error'
	                console.log(error);                 // 'Not Found'
	        }
			});
		},
	})
	
	

	
	//예약버튼 작동
	$("#reserveBtn").on("click", function(){
		var date = $('.datepicker').val();
		var memberId = "${memberVO.memberId}";
		var boGame = $("#boGame").val();
		var publicCnt = $("#publicCnt").val();
		var clubCnt = $("#clubCnt").val();
		var studentCnt = $("#studentCnt").val();
		var boRain = $("#boRain").val();
		var priceNomarl = "${alleyInfo.priceNomarl}";
		var priceClub = "${alleyInfo.priceClub}"
		var priceStudent = "${alleyInfo.priceStudent}"
		
		var totalpay = boGame*((priceNomarl*publicCnt)+(priceClub*clubCnt)+(priceStudent*studentCnt));
		var totalCnt = Number(publicCnt)+Number(clubCnt)+Number(studentCnt);
		var maxRain = ${alleyInfo.alleyRain};
    	

	
		
    	if(boGame == ""){
    		boGame = 0
    	}
    	
    	if(publicCnt == ""){
    		publicCnt = 0;
    	}
    	if(clubCnt == ""){
    		clubCnt = 0;
    	}
    	if(studentCnt == ""){
    		studentCnt = 0;
    	}
    	
    	if(boGame == 0){
    		$("#boGame").focus();
    		alert("게임수를 입력해 주세요.")
    		return false;
    	}
    	
    	if(publicCnt == 0 && clubCnt == 0 && studentCnt == 0){
    		alert("최소 1명의 인원을 입력해 주세요.")
    		return false;
    	}
    	
    	if(date == "날짜선택"){
    		alert("날짜를 선택해 주세요.")
    		return false;
    	}
    	
		for(let i = 0; i< $('.time_box').length; i++){
			if($('.time_box')[i].classList.contains('active')){
				
				var time = $('.time_box')[i].defaultValue;
			}
		}
		if(time == null){
			alert("시간을 선택해 주세요.");
			return false;
		}
		
		if(totalCnt < boRain){
			alert("너무 많은 레인을 예약하려고합니다!")
			return false;
		}
		
		if(totalCnt >= 20){
			alert("20명 이상은 볼링장에 문의해주세요.")
			return false;
		}
		
		formdata = {
				alleySeq : url.searchParams.get('alleySeq'),
				memberId : memberId,
				boTime : time,
				boDate : date,
				boGame : boGame,
				publicCnt: publicCnt,
				clubCnt: clubCnt,
				studentCnt : studentCnt,
				alleyName : "${alleyInfo.alleyName}",
				totalCnt : totalCnt,
				maxRain :maxRain,
				boRain : boRain
		}
		
		
		
		let totalpayck = confirm("예상 결제 금액은"+totalpay.toLocaleString('ko-KR')+"원 입니다. 예약하시겠습니까?")
		
		if(totalpayck == true){
			let answer = confirm(date+". "+time+" 이 시간이 맞습니까?")
			
			if(answer == true){
				
				$.ajax({
					url:'/booking/reserve',
					data: formdata,
					dataType : 'json',
					type:'POST',
					success:function(data){
						
						
						//console.log(totalCnt);  사용자가 입력한 예약인원의 총 합
						//console.log(data); 현재 예약되어있는 인원의 총합
						
						var allowRain = maxRain - data;  // 예약가능 레인
						
						if(boRain > allowRain){
							alert("예약가능레인 보다 많은 레인을 예약할 수 없습니다.");
							return false;
						}else{
							alert("예약되었습니다.");
						}
						
					},
					error : function(xhr, status, error){
			            	alert("예약실패");
			                console.log(xhr.status);           // 에러코드(404, 500 등)
			                console.log(xhr.responseText); // html 포맷의 에러 메시지
			                console.log(status);                // 'error'
			                console.log(error);                 // 'Not Found'
			        }
				})
				
				
				location.reload();
			}else{
				alert("취소하셨습니다.")
				return false;
			}
		 }else{
			 alert("취소하셨습니다.")
			 return false;
		 }

 		
	});

	$('.datepicker').focus(function(){
		$(".time_wrap").css('margin-top','220px');
	})
	
	$('.datepicker').blur(function(){
		$(".time_wrap").css('margin-top','0px');
	})
	
	
	
	$("#gradeChange").on("click",function(){
		
		formdata = {
			memberId : "${memberVO.memberId}",
			alleySeq : url.searchParams.get('alleySeq'),
			alleyName : "${alleyInfo.alleyName}",
			alleyMemberGrade : "${memberGrade}",
			bookingCnt : "${memberGradeCk}", 
		}
		
		console.log(formdata);
		
		$.ajax({
			url : '/admin/main',
			data : formdata,
			dataType : 'text',
			type:'POST',
			success:function(){
				alert("등급변경이 신청되었습니다.");
				$("#gradeChange").text("승인 대기 중");
				$("#gradeChange").attr('disabled','disabled');
			},
			error : function(xhr, status, error){
            	alert("전송실패");
                console.log(xhr.status);           // 에러코드(404, 500 등)
                console.log(xhr.responseText); // html 포맷의 에러 메시지
                console.log(status);                // 'error'
                console.log(error);                 // 'Not Found'
        	}
			
			
		});
		
		
		
		
		
		
	})
	
	
	
    </script>
  </body>
  </html>
