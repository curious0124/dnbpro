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
	
	
	
	
}
