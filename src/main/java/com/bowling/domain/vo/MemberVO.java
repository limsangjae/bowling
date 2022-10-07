package com.bowling.domain.vo;



import lombok.Data;

@Data
public class MemberVO {

	private String memberId; //회원 아이디
	private String memberPw; //비밀번호
	private String memberEmail; //이메일
	private String memberName; //이름
	private String dateBirth; //생년월일 java.util.date 는 시분초까지 다나옴 sql.date는 시분초없음
	private String memberTel; //전화번호
	private String memberZipCode; //우편번호
	private String memberAddr1; // 주소
	private String memberAddr2; // 상세주소
	private int adminCk; //관리자 체크
	private String memberGrade; //등급
	private String firstRegistTm; //최초등록
	private String lastUpdtTm;   // 수정일
	private int age; //나이
	
}
