package com.bowling.domain.vo;

import lombok.Data;

@Data
public class Criteria {
	
    /* 현재 페이지 번호 */
    private int pageNum;
    
    /* 페이지 표시 개수 */
    private int amount;
    
    /* 페이지 skip */
    private int skip;
    
    /* 검색 타입 */
    private String type;
    
//    /* 검색 키워드 */
//    private String keyword;
    
	private String alleyAddr1; //지역명
	private String alleyName; //볼링장이름
	private String boDate; //예약할 날짜
	private String boTime; //예약할 시간
	private String boRain; //필요한 레인개수
	
    /* Criteria 생성자 */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum -1)*amount;
    }
    
    /* Criteria 기본 생성자 */
    public Criteria(){
        this(1,9);
    }
    
    /* 검색 타입 데이터 배열 변환 */
    public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }
    
}
