package com.bowling.domain.vo;

import lombok.Data;

@Data
public class MemberVO {

	private String memberId;
	private String memberPw;
	private String memberEmail;
	private String memberName;
	private int memberAge;
	private String memberTel;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private int adminCk;

	
}
