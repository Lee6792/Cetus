package com.cetus.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO { // 게시판 정보 테이블
	private long bno, hit, recomendCount, price;
	private String nickname, title, filesize, content,filename,catecode,id,catecoderef;
	private Date reg_date, update_date;
	private int replyCnt;
}
