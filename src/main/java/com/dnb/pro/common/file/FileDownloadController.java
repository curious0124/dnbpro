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
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@RequestMapping("/download.do")
	protected void download(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("articleNO") String articleNO,
							HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO+"\\"+articleNO+"\\"+imageFileName;
		File image = new File(downFile);
		
		//Ȯ���ڸ� ������ ���� �̹��� ������ �̸��� �����ɴϴ�.
		int lastIndex = imageFileName.lastIndexOf(".");
		String fileName = imageFileName.substring(0,lastIndex);
				
		File thumbnail = new File(ARTICLE_IMAGE_REPO+"\\"+"thumbnail"+"\\"+fileName+".png");	//�����̹��� �����̸��� ���� ��������Ͽ� ���� File��ü ����
		if(image.exists()) {	//�����̹��� ������ ���μ���50�ȼ��� png������ ����� �̹������Ϸ� ����
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(50,50).outputFormat("png").toFile(thumbnail);
		}
		
		//������ ����� ������ �������� ����
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
}
