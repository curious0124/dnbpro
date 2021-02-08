package com.dnb.pro.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.board.vo.ArticleVO;

public interface BoardController {

	public ModelAndView admin_board_list(int brd_num,HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

//	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
////	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  HttpServletResponse response) throws Exception;
//
//	public ModelAndView removeBoard(int articleNO, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
