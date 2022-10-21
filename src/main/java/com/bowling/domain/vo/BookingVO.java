package com.bowling.domain.vo;

import lombok.Data;

@Data
public class BookingVO {
	private int boNum;
	private int alleySeq;
	private String memberId;
	private String boTime;
	private String boDate;
	private int boGame;
	private int publicCnt;
	private int clubCnt;
	private int studentCnt;
	private String firstRegistTm;
	private String firstRegistId;
	private String lastUpdtTm;
	private String alleyName; //볼링장이름
	private String alleyMemberGrade;
	private int totalCnt;
	private int maxRain;
	private int boRain;
}
