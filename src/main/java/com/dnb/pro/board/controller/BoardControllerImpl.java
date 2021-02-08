package com.dnb.pro.board.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.dnb.pro.board.service.BoardService;
import com.dnb.pro.board.vo.ArticleVO;
import com.dnb.pro.member.vo.MemberVO;
import com.dnb.pro.rent.vo.RentVO;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController {
private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);
	
	private static final String CURR_IMAGE_REPO_PATH = "\\\\DIGITAL20\\dnb\\board";
	private static final String ARTICLE_IMAGE_REPO = "\\\\DIGITAL20\\dnb\\board";
	
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;
	@Autowired
	private MemberVO memberVO;
	

	@RequestMapping(value = "/test2.do", method = {RequestMethod.GET, RequestMethod.POST})


	

	public ModelAndView test2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value = "/admin_index.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_index(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value="/admin_board_list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_board_list(@RequestParam("brd_num") int brd_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		logger.info("info ����: viewName = "+viewName);
		logger.debug("debug ����: viewName = "+viewName);
		
		List articlesList = boardService.listArticles(brd_num);	
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList",articlesList);
		return mav;

	}
	
	@RequestMapping(value = "/admin_board_articleForm.do", method = RequestMethod.GET)
	public ModelAndView admin_board_articleForm(@RequestParam("brd_num") int brd_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		
		String viewName = (String)request.getAttribute("viewName");
		articleVO = boardService.selectBrdname(brd_num); 	//��ȸ�� �� ������ articleVO�� �����Ѵ�.
		memberVO=(MemberVO)session.getAttribute("member");
		articleVO.setBoard_writer(memberVO.getUser_id());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article",articleVO);	

		return mav;
	}
	
	@RequestMapping(value="/viewArticle.do", method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("board_num") int board_num, //��ȸ�� �� ��ȣ ��������
									HttpServletRequest request,
									HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		articleVO = boardService.viewArticle(board_num); 	//��ȸ�� �� ������ articleVO�� �����Ѵ�.
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article",articleVO);		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/addNewArticle.do" ,method = {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Map<String,Object> articleMap = new HashMap<String, Object>();  //������ ������ ���� articleMap����
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {	//�۾��� â���� ���۵� �� ������ Map�� key/value�� ����
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
			
		}
		
		String temp = (String) articleMap.getOrDefault("board_content", 1);
		temp = temp.replace("\r\n", "<br>");//�Է¹��� ���͸� <br>�� ��ȯ
		articleMap.put("board_content", temp);
		
		String board_img = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		String board_writer 	
			= memberVO.getUser_id(); 	//���ǿ� ����� ȸ�� ������ ���� ID�� �����´�
		articleMap.put("board_writer", board_writer);
		articleMap.put("board_img", board_img);//ȸ�� ID, �̹��������̸��� articleMap�� ����
		System.out.println(articleMap);
		
		String message = null;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = boardService.addNewArticle(articleMap);//�������� ����� articleMap�� ServiceŬ������ addArticle()�޼���� ����
			if(board_img!=null && board_img.length()!=0) {//�������� �߰��� �� ���ε��� �̹��� ������ �� ��ȣ�� ����� ������ �̵��մϴ�.
				File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+board_img);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);				
			}
			//�� ���� �߰��� �� �޽����� �����մϴ�.
			message = "<script>";
			message += " alert('�� ���� �߰��߽��ϴ�.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/admin_board_list.do?brd_num="+articleMap.getOrDefault("brd_num", 1)+"';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+board_img);
			srcFile.delete();
			
			//�� ���� �߰��� �� �޽����� �����մϴ�.
			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/admin_board_articleForm.do?brd_num="+articleMap.getOrDefault("brd_num", 1)+"';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
			
		}
		return resEnt;	
	}
	
	//���ε��� �����̸��� ������ ��ȯ�մϴ�.
		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
			String board_Img = null;
			Map<String, String> articleMap = new HashMap<String, String>();
			Iterator<String> fileNames = multipartRequest.getFileNames();
			while(fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				board_Img = mFile.getOriginalFilename();
				File file = new File(ARTICLE_IMAGE_REPO+"\\"+fileName);
				if(mFile.getSize()!=0) { //File Null Check
					if(! file.exists()) {
						if(file.getParentFile().mkdirs()) {
							file.createNewFile();
						}
					}
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+board_Img));
					
				}			
			}
			return board_Img;		
		}
	
	
	
}


















