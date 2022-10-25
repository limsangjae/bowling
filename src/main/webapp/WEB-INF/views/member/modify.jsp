<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/resources/css/login.css">

	<title>볼미사</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js" integrity="sha512-57oZ/vW8ANMjR/KQ6Be9v/+/h6bq9/l3f0Oc7vn6qMqyhvPd1cvKBRWWpzu0QoneImqr2SkmO4MSqU+RpHom3Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<div id="container" class="container sign-up">
    <!-- FORM SECTION -->
    <div class="row">
      <!-- SIGN UP -->
      <form class="col align-items-center flex-col sign-up" id="modifyform" method="post" action="/member/modify">
        <div class="form-wrapper align-items-center">
          <div class="form sign-up">
          	<b class="name">*아이디</b>
            <div class="box input-group">
            	<input class="id_input" id="memberId" name="memberId" placeholder="아이디" maxlength='16' readonly="readonly" value='<c:out value="${memberInfo.memberId}"></c:out>'>
				<button class="add_btn" type="button" onclick="idDuple()">중복확인</button>
				<input type="hidden" id="memberIdCk" value="0">
            </div>
			<div>
			    <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="id_input_re_3">영문,숫자 5~20자리로 입력해 주세요.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
			</div>
			<b class="name">*비밀번호</b>
            <div class="input-group">
              <input class="pw_input" id="memberPw"name="memberPw" type="password" placeholder="비밀번호">
              <span class="pwck_input_re_4">8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합</span>
            </div>
            <b class="name">*비밀번호 확인</b>
            <div class="input-group">
              <input class="pwck_input" id="memberPwCk" type="password" placeholder="비밀번호 확인">
              <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
              <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
              <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>              
            </div>
            <b class="name">*이메일</b>
            <div class="input-group">
              <input class="mail_input" id="memberEmail" name="memberEmail" type="email" placeholder="이메일" maxlength="100" value='<c:out value="${memberInfo.memberEmail}"></c:out>'>
            </div>
            <b class="name">*이름</b>
            <div class="input-group">
              <input class="name_input" id="memberName" name="memberName" placeholder="이름" maxlength="5" oninput="nameCk()" value='<c:out value="${memberInfo.memberName}"></c:out>'>
            </div>
            <b class="name">*생년월일</b>
            <div class="input-group">
              <input class="datepicker age_input" id="memberBirth" name="dateBirth" placeholder="생년월일" readonly="readonly" value='<c:out value="${memberInfo.dateBirth}"></c:out>'>
            </div>
            <b class="name">*전화번호</b>
            <div class="input-group">
              <input class="tel_input phoneNumber" id="memberTel"name="memberTel" placeholder="전화번호" maxlength="14" oninput="telinput()" value='<c:out value="${memberInfo.memberTel}"></c:out>'>
            </div>
            <b class="name">*우편번호</b>
            <div class="box input-group">
			    <input class="address_input_1" id="memberZipCode" name="memberZipCode" placeholder="우편번호" readonly="readonly" value='<c:out value="${memberInfo.memberZipCode}"></c:out>'>
			    <button class="add_btn" type="button" onclick="execution_daum_address()">주소찾기</button>
			</div>
			<b class="name">*주소</b>
			<div class="input-group">
              <input class="address_input_2" id="memberAddr1" name="memberAddr1" placeholder="주소" readonly="readonly" value='<c:out value="${memberInfo.memberAddr1}"></c:out>'>
            </div>
            <b class="name">상세주소</b>
            <div class="input-group">
              <input class="address_input_3" id="memberAddr2" name="memberAddr2" placeholder="상세주소" readonly="readonly" maxlength="100" value='<c:out value="${memberInfo.memberAddr2}"></c:out>'>
            </div>
            <button class="modify_button" type="button">
              수정하기
            </button>
            <p>
            	<b><a href="/">홈페이지로 이동</a></b>
            </p>
            <p>
              <span>
                회원을 탈퇴하시겠습니까?
              </span>
              <b class="pointer" id="delete">
                회원탈퇴
              </b>
            </p>
          </div>
        </div>
      	
      </form>
      
      <!-- END SIGN UP -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
      <!-- SIGN UP CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="img sign-up">
        
        </div>
        <div class="text sign-up">
          <h2>
            
          </h2>
  
        </div>
      </div>
      
      
      <div class="col align-items-center flex-col">
        <div class="img sign-up">
        
        </div>
        <div class="text sign-up">
          <h2>
            회원정보수정
          </h2>
  
        </div>
      </div>
      <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
  </div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
<script>
$("#delete").on("click",function(){
	let modifyform = $("#modifyform");
	modifyform.attr("action", "/member/delete");
	
	
	let answer = confirm("정말 회원을 탈퇴하시겠습니까?");
	
	if(answer){
		alert("회원이 탈퇴되었습니다.");
		modifyform.submit();
	}else{
		alert("탈퇴 취소 하셨습니다.")
		return false;
	}
}) 


 $("#memberId").on("change",function(){
		 $("#memberIdCk").val("0"); 
}) 
  
 $(document).ready(function(){
	 
	 $.datepicker.setDefaults({
		 	changeMonth:true,
		 	changeYear:true,
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
		    yearRange: '1950:2022' ,
		    maxDate:0,
 	});
	 $('.datepicker').datepicker();
	 
 	//회원가입 버튼(회원가입 기능 작동)
     $(".modify_button").click(function(){
         
    	 if($('.id_input').val() == ""){
    		 $('#memberId').focus();
    		 alert("아이디를 입력해 주세요");
    		 return false;
    	 }
    	
    	 
    	 var pw = $('.pw_input').val();
	     var pwCk = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;    //8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
	     
	     if(!pwCk.test(pw)){
	    	 $('.pwck_input_re_4').css('display','block');
	     }else{
	    	 $('.pwck_input_re_4').css('display','none');
	     }
    	 
    	 
    	 if($('.mail_input').val() == ""){
    		 alert("이메일을 입력해 주세요")
    		 return false;
    	 }else{
    			 var email = $("#memberEmail").val();
    			 var emailCk = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    			 
    			 if(!emailCk.test(email)){
    				 alert("이메일 형식을 맞춰주세요 예시) xxx@xxx.xx");
    				return false;
    			 }
    	 }
    	 
    	 if($('.name_input').val() == ""){
    		 $('#memberName').focus();
    		 alert("이름을 입력해 주세요")
    		 return false;
    	 }
    	 
    	 if($('.age_input').val() == ""){
    		 $('#memberBirth').focus();
    		 alert("생년월일을 입력해 주세요")
    		 return false;
    	 }
    	 
    	 if($('.tel_input').val() == ""){
    		 $('#memberTel').focus();
    		 alert("전화번호를 입력해 주세요")
    		 return false;
    	 }
    	 if($('.address_input_2').val() == ""){
    		 alert("주소를 입력해주세요");
    		 return false;
    	 }
         
        $("#modifyform").submit();

     });
 });


  
 
 //아이디 중복검사
function idDuple(){
	$("#memberIdCk").val("1");
 	var memberId = $('.id_input').val();			// .id_input에 입력되는 값
 	var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

 	var regExp = /^[a-z]+[a-z0-9]{5,19}$/g;		//영문,숫자 6~20
	  
	  if(!regExp.test(memberId)){
		$('.id_input_re_3').css("display","inline-block");
		$('.id_input_re_1').css("display", "none");
	  }else{
		  $.ajax({
	 	 		type : "post",
	 	 		url : "/member/memberIdChk",
	 	 		data : data,
	 	 		success : function(result){
	 	 			// console.log("성공 여부" + result);
	 	 			if(result != 'fail'){
	 	 				$('.id_input_re_1').css("display","inline-block");
	 	 				$('.id_input_re_2').css("display", "none");	
	 	 				$('.id_input_re_3').css("display","none");
	 	 				idckCheck = true;
	 	 			} else {
	 	 				$('.id_input_re_2').css("display","inline-block");
	 	 				$('.id_input_re_1').css("display", "none");
	 	 				$('.id_input_re_3').css("display","none");
	 	 				idckCheck = false;
	 	 			}
	 	 			
	 	 		}// success 종료
	 	 	}); // ajax 종료	  
	  }
 	

 };// function 종료

 
 

 //이름 유효성 검사
 function nameCk(){
	 var name = $("#memberName").val();
	 var nameCk = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	 
	 
	 if(!nameCk.test(name)){
		 $("#memberName").val('');
	 }

 }
 
 
 //전화번호 유효성 검사
 function telinput(){
	 var telinput = /[0-9]/;
	 var tel = $("#memberTel").val();
	 
	 if(!telinput.test(tel)){
		 $("#memberTel").val("");
	 }
 }
 $(document).on("keyup", ".phoneNumber", function(){ 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
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

 /* 비밀번호 확인 일치 유효성 검사 */
//  $('.pw_input').on("propertychange change keyup paste input", function(){
//      var pw = $('.pw_input').val();
//      var pwCk = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;    //8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
     
//      if(!pwCk.test(pw)){
//     	 $('.pwck_input_re_4').css('display','block');
//     	 return false;
//      }else{
//     	 $('.pwck_input_re_4').css('display','none');
//      }
//  });
 
 
 
 $('.pwck_input').on("propertychange change keyup paste input", function(){
  
     var pw = $('.pw_input').val();
     var pwck = $('.pwck_input').val();
     $('.final_pwck_ck').css('display', 'none');

     if(pw == pwck){
         $('.pwck_input_re_1').css('display','block');
         $('.pwck_input_re_2').css('display','none');
     }else{
         $('.pwck_input_re_1').css('display','none');
         $('.pwck_input_re_2').css('display','block');
     }  
     
 });
 $('.pw_input').on("change",function(){
	 $('.pwck_input_re_1').css('display','none');
 })
 $('.pw_input').on("blur",function(){
     var pw = $('.pw_input').val();
     var pwck = $('.pwck_input').val();
     var pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;    //8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
     
     
	     
     if(!pwReg.test(pw)){
    	 $('.pwck_input_re_4').css('display','block');
     }else{
    	 $('.pwck_input_re_4').css('display','none');
     }
		 
     
     
	 if(pwck !="" && pw != pwck){
		 alert("비밀번호를 다시 확인해주세요")
		 $('.pw_input').val("");
		 $('.pwck_input').val("");
	 }
 })   
  


</script>

  </body>
  
  </html>
