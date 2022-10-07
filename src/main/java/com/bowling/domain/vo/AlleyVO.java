package com.bowling.domain.vo;

import java.util.List;

import lombok.Data;

@Data
public class AlleyVO {
	private int alleySeq;  //볼링장시퀀스
	private String alleyTel; //볼링장 전화번호
	private String alleyName; //볼링장 이름
	private String openTime;  //오픈시간
	private String closeTime; //마감시간
	private int priceNomarl; //일반가격
	private int priceClub;  //클럽가격
	private int priceStudent;  //학생가격
	private String alleyZipCode;  //우편번호
	private String alleyAddr1;  //주소
	private String alleyAddr2;  //상세주소
	private String alleyRain;  //볼링장 레인
	private String alleyContent;  //볼링장 소개
	private String firstRegistTm; //최초등록일
	private String firstRegistId; //최초등록Id 
	private String lastUpdtTm;   // 수정일일
	private String lastUpdtId;   // 수정Id
	
	//이미지 정보
	private List<AttachImageVO> imageList;
	
}
