package com.dnb.pro.banner.vo;


import org.springframework.stereotype.Component;

@Component("BannerVO")
public class BannerVO {
	private int board_num;
	private String board_title;
	private String board_img;
	private String board_content;
	
	public BannerVO() {
		
	}
	
	
	
	public String getBoard_content() {
		return board_content;
	}



	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}



	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	
	
}
