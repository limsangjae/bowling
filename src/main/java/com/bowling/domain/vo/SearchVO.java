package com.bowling.domain.vo;

import lombok.Data;

@Data
public class SearchVO {

	private String localName; //지역명
	private String alleyName; //볼링장이름
	private String boDate; //예약할 날짜
	private String boTime; //예약할 시간
	private int totalCnt; //인원수
	private int boGame; //게임수
	
}
