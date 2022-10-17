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
						<c:if test="${memberGradeCk > 4 and memberGrade == '일반'}">
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
				<div class="col-lg-7">
					<div>
						<div id="uploadResult" class="img-about">
							
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<h2 class="heading text-primary mb-4"><c:out value="${alleyInfo.alleyName}" /></h2>
					<div class="d-flex mb-3">
						<b>주소 : </b>
						<p class="meta"><c:out value="${alleyInfo.alleyAddr1}, ${alleyInfo.alleyAddr2}" /></p>
					</div>
					<div class="d-flex mb-3">
						<b>영업시간 : </b>
						<p class="text-black-50"><c:out value="${alleyInfo.openTime}시~${alleyInfo.closeTime}시" /></p>
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
					<div class="d-flex mb-3">
						<b>소개 : </b>
						<p class="text-black-50"><c:out value="${alleyInfo.alleyContent}" escapeXml="false"/></p>
					</div>
				</div>
	            <form id="moveForm" action="/alley/list" method="get" >
					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
               	</form>
			</div>
			<div class="row mt-5">
				<div class="d-flex mb-3">
					<i class="bi bi-calendar3 me-2 fs-5"></i>
					<div class="date_wrap">
						<input class="datepicker btn btn-primary" value="">
					</div>
				</div>
				<div class="d-flex mb-3">
					<div class="time_wrap" id="time_wrap">
						<c:forEach var="i" begin="${alleyInfo.openTime}" end="${alleyInfo.closeTime}">
							<div class="time_box_wrap">
								<input id="time${i}" class="time_box btn btn-primary" type="button" value="${i}:00">
							</div>
						</c:forEach>
					</div>					
				</div>
				<div class="d-flex mb-3 gameinfo_wrap">
					<b>*게임수 : </b>
					<input id ="boGame" class="gameinfo_input" maxlength="2" value="0">
					<b>일반인원 : </b>
					<input id ="publicCnt" class="gameinfo_input" maxlength="2" value="0">
					<b>클럽인원 : </b>
					<input id ="clubCnt" class="gameinfo_input" maxlength="2" value="0">
					<b>학생인원 : </b>
					<input id ="studentCnt" class="gameinfo_input" maxlength="2" value="0">
				</div>
				<div class="text-md-end">
					<c:if test="${memberVO.adminCk != null }">
						<button id="reserveBtn" class="btn btn-primary">예약</button>
					</c:if>
						<button id="cancelBtn" class="btn btn-primary">목록</button>
					<c:if test="${memberVO.adminCk == 1 }">
						<button id="modifyBtn" class="btn btn-primary">볼링장 정보 수정</button>
					</c:if>
				</div>
				<div class="text-md-center mb-3 mt-3">
					<b style="color: orange; font-size: 30px">오시는길</b>
				</div>
			</div>
			<div class="row justify-content-center">
				<div id="map"style="height:400px;">
			
				</div>
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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ivc6xnl87f&submodules=geocoder"></script>
    <script>
    
   
    
    
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

        if (address.roadAddress !== '') {
            htmlAddresses.push('[도로명 주소] ' + address.roadAddress);
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

        if (item.roadAddress) {
          htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
        }

        if (item.jibunAddress) {
          htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
        }

        infoWindow.setContent([
          '<div style="padding:10px;min-width:200px;line-height:150%;">',
          '<h4 style="margin-top:5px;">'+ address +'</h4><br />',
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

      searchAddressToCoordinate('${alleyInfo.alleyAddr1}');
    }

    naver.maps.onJSContentLoaded = initGeocoder;
    
    $(function(){
    	
    	
    	
    	
    	/* 이미지 정보 호출 */
    	let alleySeq = '<c:out value="${alleyInfo.alleySeq}"/>';
    	let uploadResult = $("#uploadResult");
    	
    	$.getJSON("getAttachList",{alleySeq : alleySeq}, function(arr){
    		
    		if(arr.length === 0 ){
    			
				let str = "";
				str += "<div id='result_card'>";
				str += "<img src='${path}/resources/images/Noimg.png' class='img-fluid'>";
				str += "</div>";
				
				uploadResult.append(str);
    			
    			return;
    		}
    		
    		let str = "";
    		let obj = arr[0];
    		
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='display?fileName=" + fileCallPath +"' class='img-fluid'>";
			str += "</div>";		
			
			uploadResult.append(str);
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
					
					var maxperson = ${alleyInfo.alleyRain}*5;
					
					for(let i = ${alleyInfo.openTime}; i < ${alleyInfo.closeTime}; i++) {
						
						if(!data["t"+i]){
							data["t"+i] = 0;
						}
						
						html +="<div class='time_box_wrap'>";
						html +="<input id='time"+i+"' class='time_box btn btn-primary' type='button' value='"+i+":00' onclick='time("+i+")'>";
						html +="<p>예약가능인원 :"+ (maxperson - data["t"+i]) + "</p>";
						
						html +="</div>";	
					}
					$("#time_wrap").html(html);
					
					
					for(let i = ${alleyInfo.openTime}; i < ${alleyInfo.closeTime}; i++) {
						if(data["t"+i] >= maxperson) {
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
		var priceNomarl = "${alleyInfo.priceNomarl}";
		var priceClub = "${alleyInfo.priceClub}"
		var priceStudent = "${alleyInfo.priceStudent}"
		
		var totalpay = boGame*((priceNomarl*publicCnt)+(priceClub*clubCnt)+(priceStudent*studentCnt));
		var totalCnt = Number(publicCnt)+Number(clubCnt)+Number(studentCnt);
		var maxPerson = ${alleyInfo.alleyRain}*5;  //볼링장 수용 최대인원
    	
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
    	
    	
		for(let i = 0; i< $('.time_box').length; i++){
			if($('.time_box')[i].classList.contains('active')){
				
				var time = $('.time_box')[i].defaultValue;
			}
		}
		console.log(time);
		
		
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
				maxPerson :maxPerson 
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
						
						var allowperson = maxPerson - data;  // 예약가능 인원
						
						if(totalCnt > allowperson){
							alert("예약가능인원 보다 많은 인원을 예약할 수 없습니다.");
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
