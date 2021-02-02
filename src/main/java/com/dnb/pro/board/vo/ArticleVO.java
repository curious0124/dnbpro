package com.dnb.pro.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	private int brd_num;
	private String brd_name;
	private int board_num;
	private String board_title;
	private String board_content;
	private String board_file;
	private String board_img;
	private String board_writer;
	private Date board_date;
	
	
	public ArticleVO() {
		
	}


	public ArticleVO(int brd_num, String brd_name) {
		this.brd_num = brd_num;
		this.brd_name = brd_name;
	}


	public ArticleVO(int brd_num, int board_num, String board_title, String board_content,
			String board_file, String board_img, String board_writer, Date board_date) {
		this.brd_num = brd_num;
		this.board_num = board_num;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_img = board_img;
		this.board_writer = board_writer;
	}


	public int getBrd_num() {
		return brd_num;
	}


	public void setBrd_num(int brd_num) {
		this.brd_num = brd_num;
	}


	public String getBrd_name() {
		return brd_name;
	}


	public void setBrd_name(String brd_name) {
		this.brd_name = brd_name;
	}


	public int getBoard_num() {
		return board_num;
	}


	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}


	public String getboard_title() {
		return board_title;
	}


	public void setboard_title(String board_title) {
		this.board_title = board_title;
	}


	public String getBoard_content() {
		return board_content;
	}


	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}


	public String getBoard_file() {
		return board_file;
	}


	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}


	public String getBoard_img() {
		return board_img;
	}


	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}


	public String getBoard_writer() {
		return board_writer;
	}


	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}


	public Date getBoard_date() {
		return board_date;
	}


	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	
	
	
	
}
