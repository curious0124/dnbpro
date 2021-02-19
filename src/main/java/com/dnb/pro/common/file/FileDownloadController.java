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
		
//		//Ȯ���ڸ� ������ ���� �̹��� ������ �̸��� �����ɴϴ�.
//		int lastIndex = board_img.lastIndexOf(".");
//		String fileName = board_img.substring(0,lastIndex);
//				
//		File thumbnail = new File(ARTICLE_IMAGE_REPO+"\\"+"thumbnail"+"\\"+fileName+".png");	//�����̹��� �����̸��� ���� ��������Ͽ� ���� File��ü ����
//		if(image.exists()) {	//�����̹��� ������ ���μ���50�ȼ��� png������ ����� �̹������Ϸ� ����
//			thumbnail.getParentFile().mkdirs();
//			Thumbnails.of(image).size(100,100).outputFormat("png").toFile(thumbnail);
//		}
		
		//������ ������ �������� ����
		FileInputStream in = new FileInputStream(image);
		byte[] buffer = new byte[1024 * 8];
		while (true) {	//���۸� �̿��� �ѹ��� 8Kbyte�� �������� ���� 
			int count = in.read(buffer); // ���ۿ� �о���� ���ڰ���
			if (count == -1) // ������ �������� �����ߴ��� üũ
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
		
		//Ȯ���ڸ� ������ ���� �̹��� ������ �̸��� �����ɴϴ�.
		int lastIndex = edu_thuming.lastIndexOf(".");
		String fileName = edu_thuming.substring(0,lastIndex);
				
		File thumbnail = new File(edu_ARTICLE_IMAGE_REPO+"\\"+edu_num+"\\"+fileName+".png");	//�����̹��� �����̸��� ���� ��������Ͽ� ���� File��ü ����
		if(image.exists()) {	//�����̹��� ������ ���μ���50�ȼ��� png������ ����� �̹������Ϸ� ����
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(100,100).outputFormat("png").toFile(thumbnail);
		}
		
		//������ ������ �������� ����
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024 * 8];
		while (true) {	//���۸� �̿��� �ѹ��� 8Kbyte�� �������� ���� 
			int count = in.read(buffer); // ���ۿ� �о���� ���ڰ���
			if (count == -1) // ������ �������� �����ߴ��� üũ
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
		//Ȯ���ڸ� ������ ���� �̹��� ������ �̸��� �����ɴϴ�.
		int lastIndex = eq_thuming.lastIndexOf(".");
		String fileName = eq_thuming.substring(0,lastIndex);
		

				
		File thumbnail = new File(equipthuming_ARTICLE_IMAGE_REPO+"\\"+eq_name+"\\"+fileName+".png");	//�����̹��� �����̸��� ���� ��������Ͽ� ���� File��ü ����
		if(image.exists()) {	//�����̹��� ������ ���μ���50�ȼ��� png������ ����� �̹������Ϸ� ����
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(100,100).outputFormat("png").toFile(thumbnail);
		}
		
		//������ ������ �������� ����
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024 * 8];
		while (true) {	//���۸� �̿��� �ѹ��� 8Kbyte�� �������� ���� 
			int count = in.read(buffer); // ���ۿ� �о���� ���ڰ���
			if (count == -1) // ������ �������� �����ߴ��� üũ
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
//		//Ȯ���ڸ� ������ ���� �̹��� ������ �̸��� �����ɴϴ�.
//		
////		int lastIndex = eq_img.lastIndexOf(".");
////		String fileName = eq_img.substring(0,lastIndex);
//				
//		
//		//������ ������ �������� ����
//		FileInputStream in = new FileInputStream(image);
//		byte[] buffer = new byte[1024 * 8];
//		while (true) {	//���۸� �̿��� �ѹ��� 8Kbyte�� �������� ���� 
//			int count = in.read(buffer); // ���ۿ� �о���� ���ڰ���
//			if (count == -1) // ������ �������� �����ߴ��� üũ
//				break;
//			out.write(buffer, 0, count);
//		}
//		
//		in.close();
//		out.close();
//	}
//	
	

}
