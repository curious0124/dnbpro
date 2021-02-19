package com.dnb.pro.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static final String ARTICLE_IMAGE_REPO = "\\\\\\\\DIGITAL20\\\\dnb\\\\board";
	@RequestMapping("/download.do")
	protected void download(@RequestParam("board_img") String board_img,
							@RequestParam("board_num") String board_num,
							HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO+"\\"+board_num+"\\"+board_img;
		File image = new File(downFile);
		
//		//확장자를 제외한 원본 이미지 파일의 이름을 가져옵니다.
//		int lastIndex = board_img.lastIndexOf(".");
//		String fileName = board_img.substring(0,lastIndex);
//				
//		File thumbnail = new File(ARTICLE_IMAGE_REPO+"\\"+"thumbnail"+"\\"+fileName+".png");	//원본이미지 파일이름과 같은 썸네일파일에 대한 File객체 생성
//		if(image.exists()) {	//원본이미지 파일을 가로세로50픽셀인 png형식의 썸네일 이미지파일로 생성
//			thumbnail.getParentFile().mkdirs();
//			Thumbnails.of(image).size(100,100).outputFormat("png").toFile(thumbnail);
//		}
		
		//생성된 파일을 브라우저로 전송
		FileInputStream in = new FileInputStream(image);
		byte[] buffer = new byte[1024 * 8];
		while (true) {	//버퍼를 이용해 한번에 8Kbyte씩 브라우저로 전송 
			int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
	}
	

	private static final String edu_ARTICLE_IMAGE_REPO = "\\\\\\\\DIGITAL20\\\\dnb\\\\education";
	@RequestMapping("/edu_download.do")
	protected void edu_download(@RequestParam("edu_thuming") String edu_thuming,
							@RequestParam("edu_num") String edu_num,
							HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = edu_ARTICLE_IMAGE_REPO+"\\"+edu_num+"\\"+edu_thuming;
		File image = new File(downFile);
		
		//확장자를 제외한 원본 이미지 파일의 이름을 가져옵니다.
		int lastIndex = edu_thuming.lastIndexOf(".");
		String fileName = edu_thuming.substring(0,lastIndex);
				
		File thumbnail = new File(edu_ARTICLE_IMAGE_REPO+"\\"+edu_num+"\\"+fileName+".png");	//원본이미지 파일이름과 같은 썸네일파일에 대한 File객체 생성
		if(image.exists()) {	//원본이미지 파일을 가로세로50픽셀인 png형식의 썸네일 이미지파일로 생성
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(100,100).outputFormat("png").toFile(thumbnail);
		}
		
		//생성된 파일을 브라우저로 전송
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024 * 8];
		while (true) {	//버퍼를 이용해 한번에 8Kbyte씩 브라우저로 전송 
			int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
	}

	private static final String equipthuming_ARTICLE_IMAGE_REPO = "\\\\\\\\DIGITAL20\\\\dnb\\\\equipthuming";
	@RequestMapping("/equip_download.do")
	protected void equipthuming_download(@RequestParam("eq_thuming") String eq_thuming,
							    @RequestParam("eq_name") String eq_name,
							HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = equipthuming_ARTICLE_IMAGE_REPO+"\\"+eq_name+"\\"+eq_thuming;
		File image = new File(downFile);
		;
		//확장자를 제외한 원본 이미지 파일의 이름을 가져옵니다.
		int lastIndex = eq_thuming.lastIndexOf(".");
		String fileName = eq_thuming.substring(0,lastIndex);
		

				
		File thumbnail = new File(equipthuming_ARTICLE_IMAGE_REPO+"\\"+eq_name+"\\"+fileName+".png");	//원본이미지 파일이름과 같은 썸네일파일에 대한 File객체 생성
		if(image.exists()) {	//원본이미지 파일을 가로세로50픽셀인 png형식의 썸네일 이미지파일로 생성
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(100,100).outputFormat("png").toFile(thumbnail);
		}
		
		//생성된 파일을 브라우저로 전송
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024 * 8];
		while (true) {	//버퍼를 이용해 한번에 8Kbyte씩 브라우저로 전송 
			int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
	}
	
	
//	private static final String equipimg_ARTICLE_IMAGE_REPO = "\\\\\\\\DIGITAL20\\\\dnb\\\\equipimg";
//	@RequestMapping("/equip_download.do")
//	protected void equipimg_download(@RequestParam("eq_img") String eq_img,
//							    @RequestParam("eq_name") String eq_name,
//							HttpServletResponse response) throws Exception{
//		OutputStream out = response.getOutputStream();
//		String downFile = equipimg_ARTICLE_IMAGE_REPO+"\\"+eq_name+"\\"+eq_img;
//		File image = new File(downFile);
//	
//		//확장자를 제외한 원본 이미지 파일의 이름을 가져옵니다.
//		
////		int lastIndex = eq_img.lastIndexOf(".");
////		String fileName = eq_img.substring(0,lastIndex);
//				
//		
//		//생성된 파일을 브라우저로 전송
//		FileInputStream in = new FileInputStream(image);
//		byte[] buffer = new byte[1024 * 8];
//		while (true) {	//버퍼를 이용해 한번에 8Kbyte씩 브라우저로 전송 
//			int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
//			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
//				break;
//			out.write(buffer, 0, count);
//		}
//		
//		in.close();
//		out.close();
//	}
//	
	

}
