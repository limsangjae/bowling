package com.bowling.domain.vo;

import lombok.Data;

@Data
public class AttachImageVO {
	//경로
	private String uploadPath;
	
	//uuid
	private String uuid;
	private String uuid1;
	private String uuid2;
	
	//파일 이름
	private String fileName;
	private String fileName1;
	private String fileName2;
	
	//볼링장 시퀀스
	private int alleySeq;

}
