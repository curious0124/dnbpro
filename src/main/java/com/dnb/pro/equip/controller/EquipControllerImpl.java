package com.dnb.pro.equip.controller;

import java.io.File;
import java.sql.Date;
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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.dnb.pro.equip.service.EquipService;
import com.dnb.pro.equip.vo.Criteria;
import com.dnb.pro.equip.vo.EquipVO;
import com.dnb.pro.equip.vo.PageMaker;







@Controller("EquipController")
@RequestMapping(value="/equip")
public class EquipControllerImpl implements EquipController {
	private static final Logger logger = LoggerFactory.getLogger(EquipControllerImpl.class);
	
	private static final String equipimg_ARTICLE_IMAGE_PATH = "\\\\DIGITAL20\\dnb\\equipimg";
	private static final String equipimg_ARTICLE_IMAGE_REPO = "\\\\DIGITAL20\\dnb\\equipimg";
	
	private static final String equipthumimg_ARTICLE_IMAGE_PATH = "\\\\DIGITAL20\\dnb\\equipthumimg";
	private static final String equipthumimg_ARTICLE_IMAGE_REPO = "\\\\DIGITAL20\\dnb\\equipthumimg";
	
	 @Autowired
		private EquipService equipService;
		@Autowired
		private EquipVO equipVO;
		
		
		
		@Override
		@RequestMapping(value="/view_Eq_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView listequips(Criteria cri,HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			ModelAndView mav = new ModelAndView(viewName);
			
			List listequips = equipService.listequips(cri);
			mav.addObject("listequips", listequips);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(equipService.listeqviewpageCount(cri));
			mav.addObject("pageMaker", pageMaker);
			
			return mav;
		}
		
		//장비예약 상세페이지
		@RequestMapping(value="/view_Eq_detail.do" ,method = { RequestMethod.GET, RequestMethod.POST})
		public ModelAndView viewequip(@RequestParam(value="eq_name") String eq_name,
				 @RequestParam(value="fromDate", required=false) Date fromDate,
				 @RequestParam(value="toDate", required=false) Date toDate,
	                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			System.out.println("eq_name : "+eq_name+", 시작일 : "+ fromDate+", 종료일 : "+toDate);
			
			equipVO=equipService.viewequip(eq_name);
			mav.addObject("equipVO", equipVO);
			
					if(fromDate != null) {
						Map<String,Object> selectElement = new HashMap<String, Object>();
						selectElement.put("eq_name", eq_name);
						selectElement.put("fromDate", fromDate);
						selectElement.put("toDate", toDate);
						List ableEquipmentsList = equipService.seletAbleEquipment(selectElement);
						System.out.println("리스트 : "+ableEquipmentsList);
						mav.addObject("fromDate",fromDate);
						mav.addObject("toDate", toDate);
						mav.addObject("ableEquipmentsList", ableEquipmentsList);
						System.out.println(mav);
						
					}
			
			
			return mav;
		}
		
//		//날짜선택시 선택가능한 장비 리스트 조회
//		@RequestMapping(value = "/seletAbleEquipment.do", method = { RequestMethod.GET, RequestMethod.POST})
//		public ResponseEntity seletAbleEquipment(@RequestParam(value="eq_name") String eq_name,
//												 @RequestParam(value="fromDate") Date fromDate,
//												 @RequestParam(value="toDate") Date toDate,
//												HttpServletResponse response) throws Exception{
//			
////			System.out.println(eq_name);
////			System.out.println(fromDate);
////			System.out.println(toDate);
//			Map<String,Object> selectElement = new HashMap<String, Object>();
//			selectElement.put("eq_name", eq_name);
//			selectElement.put("fromDate", fromDate);
//			selectElement.put("toDate", toDate);
//			System.out.println(selectElement.get("eq_name"));
//			System.out.println(selectElement.get("fromDate"));
//			System.out.println(selectElement.get("toDate"));
//			
//			List ableEquipmentsList = equipService.seletAbleEquipment(selectElement);
//			System.out.println("리스트 : "+ableEquipmentsList);
//			
//			return (ResponseEntity) ableEquipmentsList;
//		}

		
		
		
		@Override
		@RequestMapping(value="/admin_Eq_manage_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView adminlistequips(Criteria cri,HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			ModelAndView mav = new ModelAndView(viewName);
			
			List adminequipList = equipService.adminlistequips(cri);
			
			mav.addObject("adminequipList", adminequipList);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(equipService.listserialpageCount(cri));
			mav.addObject("pageMaker", pageMaker);
			
			return mav;
		}
		
		
		
		
	
		
		
		
		
	
		
		@Override
		@RequestMapping(value="/admin_Eq_manage_classify_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView catelistequips(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
		
			List cateList = equipService.catelistequips();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("cateList", cateList);
			return mav;
		}
		
		
		@RequestMapping(value="/admin_Eq_manage_classify.do" ,method = RequestMethod.GET)
		public ModelAndView viewecatename(@RequestParam("cate_name") String cate_name,
	                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			List cateList=(List) equipService.viewequip(cate_name);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("cateList", cateList);
			return mav;
		}
		
		
	
		
		
		@Override
		@RequestMapping(value="/addcatename.do" ,method = RequestMethod.POST)
		public ResponseEntity addcatename(@RequestParam("cate_name") String cate_name,
				                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
			    equipService.addcatename(cate_name);
			    message  = "<script>";
			    message +=" alert('분류명 등록을 마쳤습니다.분류 리스트 창으로 이동합니다.');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_classify_list.do';";
			    message += " </script>";
			    
			}catch(Exception e) {
				message  = "<script>";
			    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_classify.do';";
			    message += " </script>";
				e.printStackTrace();
			}
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
		}
		
		
		
		@RequestMapping(value = "/deleteCatename.do", method = RequestMethod.POST)
		public ResponseEntity deleteCart(@RequestParam(value = "chbox[]") List<String> caArr, EquipVO equipVO) 
				throws Exception {
	
		 
		    String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		 int result = 0;
		 String cateName= new String();
		  for(String i : caArr) {
			  cateName = i;
			  equipVO.setCate_name(cateName);
			  equipService.deleteCatename(equipVO);
		    
		    message = "<script>";
			message += " alert('글 삭제를 완료 했습니다.');";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			
		  } 
			return resEnt;  
		}
		
		
		@Override
		@RequestMapping(value="/admin_Eq_manage_regist_list.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView eqnamelistequips(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			
			
			
			List eqnameList = equipService.eqnamelistequips();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("eqnameList", eqnameList);
			return mav;
		}
		

		
		@RequestMapping(value="/admin_Eq_manage_regist.do" ,method = RequestMethod.GET)
		public ModelAndView catelistequips(@RequestParam("cate_name") String cate_name,  HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			List cateList = equipService.catelistequips();
			ModelAndView mav = new ModelAndView(viewName);
     		mav.addObject("cateList", cateList);
		
			return mav;
		}
		
		@RequestMapping(value="/admin_Eq_manage_serial.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView eqnamelistserial(@RequestParam("eq_name") String eq_name,  HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
			List eqnameonlyList = equipService.eqnamelistserial();
			ModelAndView mav = new ModelAndView(viewName);
     		mav.addObject("eqnameonlyList", eqnameonlyList);
		
			return mav;
		}
		
		
//		@Override
//		@RequestMapping(value="/addeqname.do" ,method = RequestMethod.GET)
//		public ResponseEntity addeqname(@ModelAttribute("equipVO") EquipVO equipVO,
//				                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
//			response.setContentType("text/html; charset=UTF-8");
//			request.setCharacterEncoding("utf-8");
//			String message = null;
//			ResponseEntity resEntity = null;
//			HttpHeaders responseHeaders = new HttpHeaders();
//			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//			try {
//			    equipService.addeqname(equipVO);
//			    message  = "<script>";
//			    message +=" alert('모델명 등록을 마쳤습니다.모델 리스트 창으로 이동합니다.');";
//			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_regist_list.do';";
//			    message += " </script>";
//			    
//			}catch(Exception e) {
//				message  = "<script>";
//			    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
//			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_regist.do';";
//			    message += " </script>";
//				e.printStackTrace();
//			}
//			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);   
//			return resEntity;
//		}
		
		@Override
		@RequestMapping(value="/addeqname.do", method = {RequestMethod.POST,RequestMethod.GET})
		public ResponseEntity addeqname(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
			multipartRequest.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
		
			Map<String,Object> eqnamemap = new HashMap<String, Object>();
			
		
			Enumeration enu=multipartRequest.getParameterNames();
			
			while(enu.hasMoreElements()) {	
				String name = (String)enu.nextElement();
				String value = multipartRequest.getParameter(name);
				eqnamemap.put(name, value);
			}

			
			
			String eq_img = upload(multipartRequest);
			String eq_thumimg = upload2(multipartRequest);
			HttpSession session = multipartRequest.getSession();
			
			
//			memberVO = (MemberVO) session.getAttribute("member");
//			String board_writer 	
//				= memberVO.getUser_id(); 	//세션에 저장된 회원 정보로 부터 ID를 가져온다
//			eqnamemap.put("board_writer", board_writer);
			eqnamemap.put("eq_img", eq_img);//회원 ID, 이미지파일이름을 articleMap에 저장
			eqnamemap.put("eq_thumimg", eq_thumimg);//회원 ID, 이미지파일이름을 articleMap에 저장
			System.out.println("sfs"+eqnamemap);
			
			
			String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
		try {
			
			equipService.addeqname(eqnamemap);
			if(eq_img!=null && eq_img.length()!=0) {//모델명을 추가한 후 업로드한 이미지 파일을 글 번호로 명명한 폴더로 이동합니다.
				File srcFile = new File(equipimg_ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+eq_img);
				File destDir = new File(equipimg_ARTICLE_IMAGE_REPO+"\\"+ eqnamemap.get("eq_name"));
				FileUtils.moveFileToDirectory(srcFile, destDir, true);				
			}
	
			
			if(eq_thumimg!=null && eq_thumimg.length()!=0) {//모델명을 추가한 후 업로드한 이미지 파일을 모델명으로 명명한 폴더로 이동합니다.
				File srcFile = new File(equipthumimg_ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+eq_thumimg);
				File destDir = new File(equipthumimg_ARTICLE_IMAGE_REPO+"\\"+ eqnamemap.get("eq_name"));
				FileUtils.moveFileToDirectory(srcFile, destDir, true);				
			}
		
			
			message = "<script>";
			message += " alert('모델명 등록을 완료 했습니다.');";
			 message += " location.href='"+multipartRequest.getContextPath()+"/equip/admin_Eq_manage_regist_list.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				
				
				//새 글을 추가한 후 메시지를 전달합니다.
				message = "<script>";
				message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
				
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
				
			}
			 return  resEnt;
			
		}
		
		
		
		//업로드한 파일이름을 얻은후 반환합니다.
		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
			String eq_img = null;
			Map<String, String> eqnamemap = new HashMap<String, String>();
			Iterator<String> fileNames = multipartRequest.getFileNames();
			while(fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile("eq_img");
				eq_img = mFile.getOriginalFilename();
				File file = new File(equipimg_ARTICLE_IMAGE_REPO+"\\"+eq_img);
				if(mFile.getSize()!=0) { //File Null Check
					if(! file.exists()) {
						if(file.getParentFile().mkdirs()) {
							file.createNewFile();
						}
					}
					mFile.transferTo(new File(equipimg_ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+eq_img));
					
				}			
			}
//			System.out.println("이미지"+eq_img);
			return eq_img;		
		}

		
		
		//업로드한 파일이름을 얻은후 반환합니다.
		private String upload2(MultipartHttpServletRequest multipartRequest) throws Exception{
			String eq_thumimg = null;
			Map<String, String> eqnamemap = new HashMap<String, String>();
			Iterator<String> fileNames = multipartRequest.getFileNames();
			while(fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile("eq_thumimg");
				eq_thumimg = mFile.getOriginalFilename();
				File file = new File(equipthumimg_ARTICLE_IMAGE_REPO+"\\"+eq_thumimg);
				if(mFile.getSize()!=0) { //File Null Check
					if(! file.exists()) {
						if(file.getParentFile().mkdirs()) {
							file.createNewFile();
						}
					}
					mFile.transferTo(new File(equipthumimg_ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+eq_thumimg));
					
				}			
			}
//			System.out.println("썸네일"+eq_thumimg);
			return eq_thumimg;		
		}
		
	
		@Override
		@RequestMapping(value="/addserialname.do" ,method = {RequestMethod.GET,RequestMethod.POST})
		public ResponseEntity addserialname(@ModelAttribute("equipVO") EquipVO equipVO,
				                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
			    equipService.addserialname(equipVO);
			    message  = "<script>";
			    message +=" alert('시리얼명 등록을 마쳤습니다.장비 리스트 창으로 이동합니다.');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_list.do';";
			    message += " </script>";
			    
			}catch(Exception e) {
				message  = "<script>";
			    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			    message += " location.href='"+request.getContextPath()+"/equip/admin_Eq_manage_serial.do';";
			    message += " </script>";
				e.printStackTrace();
			}
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);    
			
//			System.out.println(equipVO.getEq_produc());  
			return resEntity;
		}

		
		
		@RequestMapping(value = "/deleteEqname.do", method = RequestMethod.POST)
		public ResponseEntity deleteEqname(@RequestParam(value = "chbox[]") List<String> eqArr, EquipVO equipVO) 
				throws Exception {
	
		 
		    String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		 int result = 0;
		 String eqName= new String();
		  for(String i : eqArr) {
			  eqName = i;
			  equipVO.setEq_name(eqName);
			  equipService.deleteEqname(equipVO);
		    
		    message = "<script>";
			message += " alert('글 삭제를 완료 했습니다.');";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			
		  } 
//		  System.out.println(equipVO.getEq_name());  
			return resEnt;  
		}
		
		
		@RequestMapping(value = "/deleteSerial.do", method = RequestMethod.POST)
		public ResponseEntity deleteEqSerial(@RequestParam(value = "chbox[]") List<String> seArr, EquipVO equipVO) 
				throws Exception {
	
		 
		    String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		 int result = 0;
		 String eqSerial= new String();
		  for(String i : seArr) {
			  eqSerial = i;
			  equipVO.setEq_serial(eqSerial);
			  equipService.deleteEqserial(equipVO);
		    
		    message = "<script>";
			message += " alert('글 삭제를 완료 했습니다.');";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED); 
			
		  } 
//		  System.out.println(equipVO.getEq_name());  
			return resEnt;  
		}
	
		
		@Override
		@RequestMapping(value="/modSerialState.do", method = RequestMethod.POST)
		public ResponseEntity modSerialState(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
			multipartRequest.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
		
			Map<String,Object> statemap = new HashMap<String, Object>();
			
		
			Enumeration enu=multipartRequest.getParameterNames();
			
			while(enu.hasMoreElements()) {	
				String name = (String)enu.nextElement();
				String value = multipartRequest.getParameter(name);
				statemap.put(name, value);
			}

			String message = null;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
		try {
			 equipService.modSerialState(statemap);

			
			
			//새 글을 추가한 후 메시지를 전달합니다.
			message = "<script>";
			message += " alert('상태 변경을 완료 했습니다.');";
			 message += " location.href='"+multipartRequest.getContextPath()+"/equip/admin_Eq_manage_list.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				
				
				//새 글을 추가한 후 메시지를 전달합니다.
				message = "<script>";
				message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
				
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
				
			}
			 return  resEnt;
			
		}
		

		
		
	
		
		@Override
		@RequestMapping(value="/admin_Eq_manage_serialmod.do", method=RequestMethod.GET)
		public ModelAndView modserialForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String eq_serial=request.getParameter("eq_serial");

			
			String viewName = (String)request.getAttribute("viewName");
			 equipVO=equipService.selectSerialById(eq_serial);
			 
			 request.setAttribute("eq_state", equipVO);
			ModelAndView mav = new ModelAndView(viewName);
			mav.setViewName(viewName);
			mav.addObject("equipVO", equipVO);
			return mav;
		}

		
		
		
		
		
}
