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
</head>
<body>

	<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
      <!-- SIGN UP -->
      <form class="col align-items-center flex-col sign-up" id="join_form" method="post">
        <div class="form-wrapper align-items-center">
          <div class="form sign-up">
            <div class="input-group">
              <input class="id_input" name="memberId" placeholder="아이디">
              	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
            </div>
            <div class="input-group">
              <input class="pw_input" name="memberPw" type="password" placeholder="비밀번호">
              <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
            </div>
            <div class="input-group">
              <input class="pwck_input" type="password" placeholder="비밀번호 확인">
              <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
              <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
              <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>              
            </div>
            <div class="input-group">
              <input class="mail_input" name="memberEmail" type="email" placeholder="이메일">
              <span class="final_mail_ck">이메일을 입력해주세요.</span>
            </div>
            <div class="input-group">
              <input class="name_input" name="memberName" placeholder="이름">
              <span class="final_name_ck">이름을 입력해주세요.</span>
            </div>
            <div class="input-group">
              <input class="age_input" name="memberAge" placeholder="나이">
              <span class="final_age_ck">나이를 입력해주세요.</span>
            </div>
            <div class="input-group">
              <input class="tel_input" name="memberTel" placeholder="전화번호">
              <span class="final_tel_ck">전화번호를 입력해주세요.</span>
            </div>
            <div class="box input-group">
			    <input class="address_input_1" name="memberAddr1" placeholder="우편번호" readonly="readonly">
			    <button class="add_btn" type="button" onclick="execution_daum_address()">주소찾기</button>
			</div>
			<div class="input-group">
              <input class="address_input_2" name="memberAddr2" placeholder="주소" readonly="readonly">
            </div>
            <div class="input-group">
              <input class="address_input_3" name="memberAddr3" placeholder="상세주소" readonly="readonly">
            </div>
            <button class="join_button" type="button">
              회원가입
            </button>
            <p>
              <span>
                이미 가입된 회원입니까?
              </span>
              <b onclick="toggle()" class="pointer">
                로그인으로 이동
              </b>
            </p>
          </div>
        </div>
      	
      </form>
      
      <!-- END SIGN UP -->
      <!-- SIGN IN -->
      <form class="col align-items-center flex-col sign-in" id="login_form" method="post">
        <div class="form-wrapper align-items-center">
          <div class="form sign-in">
            <div class="input-group">
              <input type="text" class="id_input" name="memberId" placeholder="아이디">
            </div>
            <div class="input-group">
              <input type="password" class="pw_input" name="memberPw" placeholder="비밀번호">
            </div>
            <c:if test = "${result == 0}">
	           <div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
            
            <button type="button" class="login_button">
              로그인
            </button>
            <p>
              <b>
                비밀번호 찾기
              </b>
            </p>
            <p>
              <span>
                회원이 아니십니까?
              </span>
              <b onclick="toggle()" class="pointer">
                회원가입으로 이동
              </b>
            </p>
          </div>
        </div>
        <div class="form-wrapper">
    
        </div>
      </form>
      <!-- END SIGN IN -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
      <!-- SIGN IN CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="text sign-in">
          <h2>
            로그인 페이지 입니다.
          </h2>
  
        </div>
        <div class="img sign-in">
    
        </div>
      </div>
      <!-- END SIGN IN CONTENT -->
      <!-- SIGN UP CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="img sign-up">
        
        </div>
        <div class="text sign-up">
          <h2>
            회원가입 페이지 입니다.
          </h2>
  
        </div>
      </div>
      <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
  </div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
<script>
  let container = document.getElementById('container')

  toggle = () => {
    container.classList.toggle('sign-in')
    container.classList.toggle('sign-up')
  }

  setTimeout(() => {
    container.classList.add('sign-in')
  }, 200)
  
/* 로그인 버튼 클릭 메서드 */
$(".login_button").click(function(){
    
    /* 로그인 메서드 서버 요청 */
    $("#login_form").attr("action", "/member/login.do");
    $("#login_form").submit();
    
});
  
  /* 유효성 검사 통과유무 변수 */
  var idCheck = false;            // 아이디
  var idckCheck = false;            // 아이디 중복 검사
  var pwCheck = false;            // 비번
  var pwckCheck = false;            // 비번 확인
  var pwckcorCheck = false;        // 비번 확인 일치 확인
  var mailCheck = false;            // 이메일
  var nameCheck = false;            // 이름
  var ageCheck = false;			  // 나이
  var telCheck = false;			  // 전화번호

 $(document).ready(function(){
 	//회원가입 버튼(회원가입 기능 작동)
     $(".join_button").click(function(){
         
         /* 입력값 변수 */
         var id = $('.id_input').val();                 // id 입력란
         var pw = $('.pw_input').val();                // 비밀번호 입력란
         var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
         var mail = $('.mail_input').val();            // 이메일 입력란
         var name = $('.name_input').val();            // 이름 입력란
         var age = $('.age_input').val();            // 이름 입력란
         var tel = $('.tel_input').val();            // 이름 입력란
         
         
         /* 아이디 유효성검사 */
         if(id == ""){
             $('.final_id_ck').css('display','block');
             idCheck = false;
         }else{
             $('.final_id_ck').css('display', 'none');
             idCheck = true;
         }
         
         /* 비밀번호 유효성 검사 */
         if(pw == ""){
             $('.final_pw_ck').css('display','block');
             pwCheck = false;
         }else{
             $('.final_pw_ck').css('display', 'none');
             pwCheck = true;
         }
         
         /* 비밀번호 확인 유효성 검사 */
         if(pwck == ""){
             $('.final_pwck_ck').css('display','block');
             pwckCheck = false;
         }else{
             $('.final_pwck_ck').css('display', 'none');
             pwckCheck = true;
         }
         
         /* 이메일 유효성 검사 */
         if(mail == ""){
             $('.final_mail_ck').css('display','block');
             mailCheck = false;
         }else{
             $('.final_mail_ck').css('display', 'none');
             mailCheck = true;
         }
         
         /* 이름 유효성 검사 */
         if(name == ""){
             $('.final_name_ck').css('display','block');
             nameCheck = false;
         }else{
             $('.final_name_ck').css('display', 'none');
             nameCheck = true;
         }
         
         /* 나이 유효성 검사 */
         if(age == ""){
             $('.final_age_ck').css('display','block');
             ageCheck = false;
         }else{
             $('.final_age_ck').css('display', 'none');
             ageCheck = true;
         }
         
         /* 전화번호 유효성 검사 */
         if(tel == ""){
             $('.final_tel_ck').css('display','block');
             telCheck = false;
         }else{
             $('.final_tel_ck').css('display', 'none');
             telCheck = true;
         }
  
         
         /* 최종 유효성 검사 */
         if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&ageCheck&&telCheck){
 	        $("#join_form").attr("action","/member/join");
 	        $("#join_form").submit();
         }
         return false;
         
     });
 });

 //아이디 중복검사
 $('.id_input').on("propertychange change keyup paste input", function(){

 	var memberId = $('.id_input').val();			// .id_input에 입력되는 값
 	var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
 	
 	$.ajax({
 		type : "post",
 		url : "/member/memberIdChk",
 		data : data,
 		success : function(result){
 			// console.log("성공 여부" + result);
 			if(result != 'fail'){
 				$('.id_input_re_1').css("display","inline-block");
 				$('.id_input_re_2').css("display", "none");		
 				idckCheck = true;
 			} else {
 				$('.id_input_re_2').css("display","inline-block");
 				$('.id_input_re_1').css("display", "none");
 				idckCheck = false;
 			}
 			
 		}// success 종료
 	}); // ajax 종료	

 });// function 종료



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

 $('.pwck_input').on("propertychange change keyup paste input", function(){
  
     var pw = $('.pw_input').val();
     var pwck = $('.pwck_input').val();
     $('.final_pwck_ck').css('display', 'none');

     if(pw == pwck){
         $('.pwck_input_re_1').css('display','block');
         $('.pwck_input_re_2').css('display','none');
         pwckcorCheck = true;
     }else{
         $('.pwck_input_re_1').css('display','none');
         $('.pwck_input_re_2').css('display','block');
         pwckcorCheck = false;
     }  
     
 });    
    
  


</script>

  </body>
  
  </html>
