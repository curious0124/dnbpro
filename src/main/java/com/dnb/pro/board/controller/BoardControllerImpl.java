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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dnb.pro.board.service.BoardService;
import com.dnb.pro.board.vo.ArticleVO;
//import com.myspring.pro30.member.vo.MemberVO;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController{
	private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\board\\article_image";
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;
	
	
	@Override
	@RequestMapping(value="/board/admin_board_list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		logger.info("info ����: viewName = "+viewName);
		logger.debug("debug ����: viewName = "+viewName);
		
		List articlesList = boardService.listArticles();	
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList",articlesList);
		return mav;
	}
//	
//	@RequestMapping(value="/board/addNewArticle.do", method = RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,
//										HttpServletResponse response) throws Exception{
//		multipartRequest.setCharacterEncoding("utf-8");
//		Map<String,Object> articleMap = new HashMap<String, Object>();  //������ ������ ���� articleMap����
//		Enumeration enu=multipartRequest.getParameterNames();
//		while(enu.hasMoreElements()) {	//�۾��� â���� ���۵� �� ������ Map�� key/value�� ����
//			String name = (String)enu.nextElement();
//			String value = multipartRequest.getParameter(name);
//			articleMap.put(name, value);
//		}
//		
//		String imageFileName = upload(multipartRequest);	//���ε��� �̹������� �̸��� �����´�
//		HttpSession session = multipartRequest.getSession();
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
//		String id = memberVO.getId(); 	//���ǿ� ����� ȸ�� ������ ���� ID�� �����´�
//		articleMap.put("parentNO", 0);	//ȸ�� ID, �̹��������̸�, �θ�� ��ȣ�� articleMap�� ����
//		articleMap.put("id", id);
//		articleMap.put("imageFileName", imageFileName);
//		
//		String message;
//		ResponseEntity resEnt=null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		
//		try {
//			int articleNO = boardService.addNewArticle(articleMap);//�������� ����� articleMap�� ServiceŬ������ addArticle()�޼���� ����
//			if(imageFileName!=null && imageFileName.length()!=0) {//�������� �߰��� �� ���ε��� �̹��� ������ �� ��ȣ�� ����� ������ �̵��մϴ�.
//				File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
//				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
//				FileUtils.moveFileToDirectory(srcFile, destDir, true);				
//			}
//			//�� ���� �߰��� �� �޽����� �����մϴ�.
//			message = "<script>";
//			message += " alert('�� ���� �߰��߽��ϴ�.');";
//			message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do';";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//		}catch(Exception e) {
//			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
//			srcFile.delete();
//			
//			//�� ���� �߰��� �� �޽����� �����մϴ�.
//			message = "<script>";
//			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.');";
//			message += " location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do';";
//			message += " </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//			e.printStackTrace();
//			
//		}
//		return resEnt;	
//		
//	}
//	
//	@RequestMapping(value = "/board/*Form.do",method = RequestMethod.GET)
//	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		
//		String viewName = (String)request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	
//	//���ε��� �����̸��� ������ ��ȯ�մϴ�.
//	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
//		String imageFileName = null;
//		Map<String, String> articleMap = new HashMap<String, String>();
//		Iterator<String> fileNames = multipartRequest.getFileNames();
//		while(fileNames.hasNext()) {
//			String fileName = fileNames.next();
//			MultipartFile mFile = multipartRequest.getFile(fileName);
//			imageFileName = mFile.getOriginalFilename();
//			File file = new File(ARTICLE_IMAGE_REPO+"\\"+fileName);
//			if(mFile.getSize()!=0) { //File Null Check
//				if(! file.exists()) {
//					if(file.getParentFile().mkdirs()) {
//						file.createNewFile();
//					}
//				}
//				mFile.transferTo(new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName));
//				
//			}			
//		}
//		return imageFileName;		
//	}
//	
//	
//	@RequestMapping(value="/board/viewArticle.do", method = RequestMethod.GET)
//	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO, //��ȸ�� �� ��ȣ ��������
//									HttpServletRequest request,
//									HttpServletResponse response) throws Exception{
//		String viewName = (String)request.getAttribute("viewName");
//		articleVO = boardService.viewArticle(articleNO); 	//��ȸ�� �� ������ articleVO�� �����Ѵ�.
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		mav.addObject("article",articleVO);		
//		return mav;
//	}
//	
//	@Override
//	  @RequestMapping(value="board/removBoard.do", method=RequestMethod.GET)
//	  public ModelAndView removeBoard(@RequestParam("articleNO") int articleNO,
//			  							HttpServletRequest request,
//			  							HttpServletResponse response) throws Exception{
//		return null;
//	}
//	  
//	
//	
//	
//	
//	//�� �� �̹��� ���� ���
//	  @RequestMapping(value="/board/modArticle.do" ,method = RequestMethod.POST)
//	  @ResponseBody
//	  public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  
//	    HttpServletResponse response) throws Exception{
//	    multipartRequest.setCharacterEncoding("utf-8");
//		Map<String,Object> articleMap = new HashMap<String, Object>();
//		Enumeration enu=multipartRequest.getParameterNames();
//		while(enu.hasMoreElements()){
//			String name=(String)enu.nextElement();
//			String value=multipartRequest.getParameter(name);
//			articleMap.put(name,value);
//		}
//		
//		String imageFileName= upload(multipartRequest);
//		articleMap.put("imageFileName", imageFileName);
//		
//		String articleNO=(String)articleMap.get("articleNO");
//		String message;
//		ResponseEntity resEnt=null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//	    try {
//	       boardService.modArticle(articleMap);
//	       if(imageFileName!=null && imageFileName.length()!=0) {
//	         File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
//	         File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
//	         FileUtils.moveFileToDirectory(srcFile, destDir, true);
//	         
//	         String originalFileName = (String)articleMap.get("originalFileName");
//	         File oldFile = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO+"\\"+originalFileName);
//	         oldFile.delete();
//	       }	
//	       message = "<script>";
//		   message += " alert('���� �����߽��ϴ�.');";
//		   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
//		   message +=" </script>";
//	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//	    }catch(Exception e) {
//	      File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
//	      srcFile.delete();
//	      message = "<script>";
//		  message += " alert('������ �߻��߽��ϴ�.�ٽ� �������ּ���');";
//		  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
//		  message +=" </script>";
//	      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//	    }
//	    return resEnt;
//	  }
	
	  
	  
	
	
//	@RequestMapping(value="/board/*Form.do", method=RequestMethod.GET)
//	public ModelAndView form(@RequestParam(value="result", required=false) String result, HttpServletRequest request, HttpServletResponse response) throws Exception {
////		String viewName = getViewName(request);
//		String viewName = (String)request.getAttribute("viewName"); //���ͼ��Ϳ��� ���ε� �� ���̸��� �����ɴϴ�.
//		System.out.println("Method 'form' viewName : "+viewName);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("result", result);
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	
//
//	private String getViewName(HttpServletRequest request) throws Exception {
//		String contextPath = request.getContextPath();
//		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
//		
//		if (uri == null || uri.trim().equals("")) {
//			uri = request.getRequestURI();
//		}
//
//		int begin = 0;
//		if (!((contextPath == null) || ("".equals(contextPath)))) {
//			begin = contextPath.length();
//		}
//
//		int end;
//		if (uri.indexOf(";") != -1) {
//			end = uri.indexOf(";");
//		} else if (uri.indexOf("?") != -1) {
//			end = uri.indexOf("?");
//		} else {
//			end = uri.length();
//		}
//
//		String fileName = uri.substring(begin, end);
//		if (fileName.indexOf(".") != -1) {
//			fileName = fileName.substring(0, fileName.lastIndexOf("."));
//		}
//		if (fileName.lastIndexOf("/") != -1) {
//			fileName = fileName.substring(fileName.lastIndexOf("/",1), fileName.length());
//		}
//		System.out.println("getViewName : "+fileName);
//		return fileName;
//	}	
	
}
