package com.bowling.domain.vo;

import lombok.Data;

@Data
public class AttachImageVO {
	//경로
	private String uploadPath;
	
	//uuid
	private String uuid;
	
	//파일 이름
	private String fileName;
	
	//볼링장 시퀀스
	private int alleySeq;

}
