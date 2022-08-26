package com.bowling.domain.vo;

import lombok.Data;

@Data
public class AlleyVO {
	private int alleySeq;
	private String alleyAddr1;
	private String alleyAddr2;
	private String alleyAddr3;
	private String alleyTel;
	private String alleyName;
	private int openTime;
	private int closeTime;
	private int priceNomarl;
	private int priceClub;
	private int priceStudent;
	private String alleyContent;
}
