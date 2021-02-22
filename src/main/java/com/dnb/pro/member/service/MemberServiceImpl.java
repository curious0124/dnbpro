package com.dnb.pro.member.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.dnb.pro.member.dao.MemberDAO;
import com.dnb.pro.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = dao.selectAllMemberList();
		return membersList;
	}

	@Override
	public int register(MemberVO vo) throws Exception {
		return dao.register(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public String overlapped(String user_id) throws Exception {
		return dao.selectOverlappedID(user_id);
	}
	

	// 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String user_email) throws Exception {
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id(user_email);
				
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	@Override
	public void send_mail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "juan7782@gmail.com";
		String hostSMTPpwd = "wndksdl1!@@";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "juan7782@gmail.com";
		String fromName = "DNB 비밀번호찾기 결과입니다.";
		String subject = "";
		String msg = "";
		
		if(div.equals("find_pw")) {
			subject = "DNB 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUser_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getUser_pwd() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = vo.getUser_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	@Override
	public void find_pw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
			System.out.println("비번 : " + vo.getUser_pwd());
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUser_pwd(pw);
			
			System.out.println("바꾼 비번 : " + vo.getUser_pwd());
			// 비밀번호 변경
			dao.update_pw(vo);
			// 비밀번호 변경 메일 발송
			send_mail(vo, "find_pw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		
	}
	

}