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
	

	// ���̵� ã��
	@Override
	public String find_id(HttpServletResponse response, String user_email) throws Exception {
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id(user_email);
				
		if (id == null) {
			out.println("<script>");
			out.println("alert('���Ե� ���̵� �����ϴ�.');");
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
		// Mail Server ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "juan7782@gmail.com";
		String hostSMTPpwd = "wndksdl1!@@";

		// ������ ��� EMail, ����, ����
		String fromEmail = "juan7782@gmail.com";
		String fromName = "DNB ��й�ȣã�� ����Դϴ�.";
		String subject = "";
		String msg = "";
		
		if(div.equals("find_pw")) {
			subject = "DNB �ӽ� ��й�ȣ �Դϴ�.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUser_id() + "���� �ӽ� ��й�ȣ �Դϴ�. ��й�ȣ�� �����Ͽ� ����ϼ���.</h3>";
			msg += "<p>�ӽ� ��й�ȣ : ";
			msg += vo.getUser_pwd() + "</p></div>";
		}
		// �޴� ��� E-Mail �ּ�
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
			System.out.println("���Ϲ߼� ���� : " + e);
		}
	}
	
	@Override
	public void find_pw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
			System.out.println("��� : " + vo.getUser_pwd());
			// �ӽ� ��й�ȣ ����
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUser_pwd(pw);
			
			System.out.println("�ٲ� ��� : " + vo.getUser_pwd());
			// ��й�ȣ ����
			dao.update_pw(vo);
			// ��й�ȣ ���� ���� �߼�
			send_mail(vo, "find_pw");
			
			out.print("�̸��Ϸ� �ӽ� ��й�ȣ�� �߼��Ͽ����ϴ�.");
			out.close();
		
	}
	

}