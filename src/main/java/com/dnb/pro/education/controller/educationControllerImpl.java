package com.dnb.pro.education.controller;

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

import com.dnb.pro.education.service.educationService;
import com.dnb.pro.education.vo.Criteria;
import com.dnb.pro.education.vo.PageMaker;
import com.dnb.pro.education.vo.educationVO;
import com.dnb.pro.member.vo.MemberVO;


@Controller("educationController")
@RequestMapping(value = "/education")
public class educationControllerImpl implements educationController {
   private static final Logger logger = LoggerFactory.getLogger(educationControllerImpl.class);

   
   
   private static final String edu_CURR_IMAGE_REPO_PATH = "\\\\DIGITAL20\\dnb\\education";
   private static final String edu_ARTICLE_IMAGE_REPO = "\\\\DIGITAL20\\dnb\\education";
   
   
   
   @Autowired
   private educationService educationService;
   @Autowired
   private educationVO educationVO;
   @Autowired
   private MemberVO memberVO;

   @Override
   @RequestMapping(value = "/edu_list.do", method = { RequestMethod.GET, RequestMethod.POST})
   public ModelAndView edu_list(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception{
      String viewName = (String)request.getAttribute("viewName");
      logger.info("info ����: viewName = "+viewName);
      logger.debug("debug ����: viewName = "+viewName);
      
      ModelAndView mav = new ModelAndView(viewName);
      
      List educationList = educationService.listeducation(cri);   
      mav.addObject("educationList",educationList);
      
      List eduCateNameList = educationService.listEduCateName();//ī�װ�����
      mav.addObject("eduCateNameList",eduCateNameList);
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(educationService.listeduCount());
      mav.addObject("pageMaker", pageMaker);
      
      return mav;
}
   
   @RequestMapping(value="/edu_detail.do" ,method = RequestMethod.GET)
   public ModelAndView vieweducation(@RequestParam("educationNO") int educationNO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
      String viewName = (String)request.getAttribute("viewName");
      educationVO=educationService.vieweducation(educationNO);
      ModelAndView mav = new ModelAndView();
      mav.setViewName(viewName);
      mav.addObject("educationVO", educationVO);
      return mav;
   }


   /* ���κ� */
   @RequestMapping(value="/edu_admin_detail.do" ,method = RequestMethod.GET)
   public ModelAndView vieweducationadmin(@RequestParam("educationNO") int educationNO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
      String viewName = (String)request.getAttribute("viewName");
      educationVO=educationService.vieweducation(educationNO);
      ModelAndView mav = new ModelAndView();
      mav.setViewName(viewName);
      mav.addObject("educationVO", educationVO);
      return mav;
   }
   //���� ���� ����Ʈ
   @RequestMapping(value = "/edu_admin_list.do", method = { RequestMethod.GET, RequestMethod.POST})
   public ModelAndView edu_admin_list(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception{
      String viewName = (String)request.getAttribute("viewName");
      logger.info("info ����: viewName = "+viewName);
      logger.debug("debug ����: viewName = "+viewName);
      ModelAndView mav = new ModelAndView(viewName);
      
      List educationList = educationService.listeducation(cri);
      mav.addObject("educationList",educationList);
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(educationService.listeduCount());
      mav.addObject("pageMaker", pageMaker);
      
      return mav;
}
   //���⼭ ���� ����
   @RequestMapping(value = "/edu_admin_Form.do", method = RequestMethod.GET)
   public ModelAndView edu_admin_Form(HttpServletRequest request, HttpServletResponse response) throws Exception{
      HttpSession session=request.getSession();
      
      String viewName = (String)request.getAttribute("viewName");
      memberVO=(MemberVO)session.getAttribute("member");
      educationVO.setEdu_writer(memberVO.getUser_id());
      System.out.println(memberVO.getUser_id());
      ModelAndView mav = new ModelAndView();
      mav.setViewName(viewName);
      mav.addObject("educationVO",educationVO);   

      return mav;
   }
   
   @Override
   @RequestMapping(value="/addNeweducation.do" ,method = {RequestMethod.POST,RequestMethod.GET})
   public ResponseEntity addNeweducaion(MultipartHttpServletRequest multipartRequest,
         HttpServletResponse response) throws Exception{
      multipartRequest.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=UTF-8");
      
      Map<String,Object> educationMap = new HashMap<String, Object>();  //������ ������ ���� educationMap����
      Enumeration enu=multipartRequest.getParameterNames();
      while(enu.hasMoreElements()) {   //�۾��� â���� ���۵� �� ������ Map�� key/value�� ����
         String name = (String)enu.nextElement();
         String value = multipartRequest.getParameter(name);
         educationMap.put(name, value);
         
      }
      
      
       String temp = (String) educationMap.getOrDefault("edu_content",1); 
       temp = temp.replace("\r\n", "<br>");//�Է¹��� ���͸� <br>�� ��ȯ
       educationMap.put("edu_content", temp);
         
      String edu_thuming = upload(multipartRequest);
      HttpSession session = multipartRequest.getSession();
      memberVO = (MemberVO) session.getAttribute("member");
      String edu_writer    
         = memberVO.getUser_id();    //���ǿ� ����� ȸ�� ������ ���� ID�� �����´�
      educationMap.put("edu_writer", edu_writer);
      educationMap.put("edu_thuming", edu_thuming);//ȸ�� ID, �̹��������̸��� educationMap�� ����
      System.out.println(educationMap);
      
      String message = null;
      ResponseEntity resEnt=null;
      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.add("Content-Type", "text/html; charset=utf-8");
      try {
         int educationNO = educationService.addNeweducation(educationMap);//�������� ����� educationMap�� ServiceŬ������ addArticle()�޼���� ����
         if(edu_thuming!=null && edu_thuming.length()!=0) {//�������� �߰��� �� ���ε��� �̹��� ������ �� ��ȣ�� ����� ������ �̵��մϴ�.
            File srcFile = new File(edu_ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+edu_thuming);
            File destDir = new File(edu_ARTICLE_IMAGE_REPO+"\\"+educationNO);
            FileUtils.moveFileToDirectory(srcFile, destDir, true);            
         }
         //�� ���� �߰��� �� �޽����� �����մϴ�.
         message = "<script>";
         message += " alert('�� ������ �Ϸ� �߽��ϴ�.');";
         message += " location.href='"+multipartRequest.getContextPath()+"/education/edu_admin_detail.do?educationNO="+educationNO+"';";
         message += " </script>";
         resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
      }catch(Exception e) {
         File srcFile = new File(edu_ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+edu_thuming);
         srcFile.delete();
         
         //�� ���� �߰��� �� �޽����� �����մϴ�.
         message = "<script>";
         message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.');";
         message += " location.href='"+multipartRequest.getContextPath()+"/education/edu_admin_Form.do"+"';";
         message += " </script>";
         resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
         e.printStackTrace();
         
      }
      System.out.println(resEnt);
      return resEnt;   
   }   
   
   //���ε��� �����̸��� ������ ��ȯ�մϴ�.
   private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
      String edu_thuming = null;
      Map<String, String> educationMap = new HashMap<String, String>();
      Iterator<String> fileNames = multipartRequest.getFileNames();
      while(fileNames.hasNext()) {
         String fileName = fileNames.next();
         MultipartFile mFile = multipartRequest.getFile(fileName);
         edu_thuming = mFile.getOriginalFilename();
         File file = new File(edu_ARTICLE_IMAGE_REPO+"\\"+fileName);
         if(mFile.getSize()!=0) { //File Null Check
            if(! file.exists()) {
               if(file.getParentFile().mkdirs()) {
                  file.createNewFile();
               }
            }
            mFile.transferTo(new File(edu_ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+edu_thuming));
            
         }         
      }
      return edu_thuming;      
   }
   
// ���� ���
   @RequestMapping(value="/edu_admin_modForm.do" ,method = {RequestMethod.POST,RequestMethod.GET})
   public ResponseEntity edu_admin_modForm(MultipartHttpServletRequest multipartRequest,
         HttpServletResponse response) throws Exception{
      multipartRequest.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=UTF-8");
      
      Map<String,Object> educationMap = new HashMap<String, Object>();  //������ ������ ���� educationMap����
      Enumeration enu=multipartRequest.getParameterNames();
      while(enu.hasMoreElements()) {   //�۾��� â���� ���۵� �� ������ Map�� key/value�� ����
         String name = (String)enu.nextElement();
         String value = multipartRequest.getParameter(name);
         educationMap.put(name, value);
         
      }
      
      String temp = (String) educationMap.getOrDefault("edu_content", 1);
      temp = temp.replace("\r\n", "<br>");//�Է¹��� ���͸� <br>�� ��ȯ
      educationMap.put("edu_content", temp);
      
      String edu_thuming = upload(multipartRequest);
      educationMap.put("edu_thuming", edu_thuming);// �̹��������̸��� educationMap�� ����
      System.out.println(educationMap);
      
      String message = null;
      ResponseEntity resEnt=null;
      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.add("Content-Type", "text/html; charset=utf-8");

      try {
         educationService.modeducation(educationMap);      
         
         String newFileName = (String) educationMap.get("edu_thuming");
         if (newFileName != null &&  newFileName.length()!=0) {
            String originalFileName = (String) educationMap.get("originalFileName");
            File srcFile = new File(edu_ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + newFileName);
            File destDir = new File(edu_ARTICLE_IMAGE_REPO + "\\" + educationMap.get("edu_num"));
            destDir.mkdirs();
            FileUtils.moveFileToDirectory(srcFile, destDir, true);
            ;
            File oldFile = new File(edu_ARTICLE_IMAGE_REPO + "\\" + educationMap.get("edu_num") + "\\" + originalFileName);
            oldFile.delete();
         }else {
            
         }
         //�� ���� �߰��� �� �޽����� �����մϴ�.
         message = "<script>";
         message += " alert('�� ������ �Ϸ� �߽��ϴ�.');";
         message += " location.href='"+multipartRequest.getContextPath()+"/education/edu_admin_detail.do?educationNO="+educationMap.get("edu_num")+"';";
         message += " </script>";
         resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
         
      }catch(Exception e) {
            File srcFile = new File(edu_ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+edu_thuming);
            srcFile.delete();
            
            //�� ���� �߰��� �� �޽����� �����մϴ�.
            message = "<script>";
            message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.');";
            message += " location.href='"+multipartRequest.getContextPath()+"/education/admin_edu_modeducationForm.do?educationNO="+educationMap.get("edu_num")+"';";
            message += " </script>";
            resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
            e.printStackTrace();
            
         }
         return resEnt;   
      }
//   ����
   @RequestMapping(value="/edu_admin_del.do" ,method = {RequestMethod.POST,RequestMethod.GET})
   public ResponseEntity edu_admin_del(@RequestParam(value = "chbox[]") List<String> eduArr,
                  educationVO educationVO) throws Exception{   
      String message = null;
      ResponseEntity resEnt=null;
      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.add("Content-Type", "text/html; charset=utf-8");
      
      System.out.println(eduArr);
      
      int result = 0;
      int arrNum = 0;
      for(String i : eduArr) {
         arrNum = Integer.parseInt(i);
         educationVO.setEdu_num(arrNum);
         educationService.deleteeducation(educationVO);
         
         System.out.println(eduArr);
         System.out.println(arrNum);
         System.out.println(i);
      }
      //�� ���� �߰��� �� �޽����� �����մϴ�.
      message = "<script>";
      message += " alert('�� ������ �Ϸ� �߽��ϴ�.');";
      message += " </script>";
      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
      
      return resEnt;
   }
//   ����ȭ�� ��
   @RequestMapping(value="/admin_edu_modeducationForm.do", method = RequestMethod.GET)
   public ModelAndView admin_edu_modeducationForm(@RequestParam("educationNO") int educationNO, 
                           HttpServletRequest request, HttpServletResponse response) throws Exception{
      String viewName = (String)request.getAttribute("viewName");
      System.out.println(viewName);
      educationVO = educationService.vieweducation(educationNO);    
      
      
      if(educationVO.getEdu_content() != null && educationVO.getEdu_content().length() != 0) {
            String temp = educationVO.getEdu_content();
            temp = temp.replace("<br>", "\r\n");
            educationVO.setEdu_content(temp);
      }
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName(viewName);
      mav.addObject("educationVO",educationVO);      
      
      return mav;
   }
   
   @Override
   @RequestMapping(value = "/edu_cate_list.do", method = { RequestMethod.GET, RequestMethod.POST})
   public ModelAndView edu_cate_list(@RequestParam("cate_name") String cate_name, HttpServletRequest request, HttpServletResponse response)
         throws Exception {
      String viewName = (String)request.getAttribute("viewName");
      
      
      ModelAndView mav = new ModelAndView(viewName);
      mav.setViewName(viewName);
      
      List<educationVO> eduCateList = educationService.listCateEdu(cate_name);   
      mav.addObject("educationList",eduCateList);
      
      List eduCateNameList = educationService.listEduCateName();//ī�װ�����
      mav.addObject("eduCateNameList",eduCateNameList);
      
      
      return mav;
   }


}