package com.dnb.pro.member.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dnb.pro.member.service.MemberService;
import com.dnb.pro.member.vo.MemberVO;

public interface MemberDAO {

	public List selectAllMemberList() throws DataAccessException;

	public int register(MemberVO vo) throws Exception;

	public MemberVO login(MemberVO vo) throws Exception;

	String selectOverlappedID(String user_id) throws DataAccessException;
	
	public String find_id(String user_email) throws DataAccessException;

	public int update_pw(MemberVO vo) throws DataAccessException;
}
