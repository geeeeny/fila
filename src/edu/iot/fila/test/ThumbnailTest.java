package edu.iot.fila.test;
import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

//썸네일을 생성해주는 클래스(이 클래스를 이용해 미리 썸네일 만들어놓기)
public class ThumbnailTest {

	public static void main(String[] args) {
		try {
			/*
			//단일 이미지 변환
			Thumbnails.of(new File("c:/temp/images/Desert.jpg"))
					.size(200, 100)
				//	.outputFormat("png") //이미지 포맷 변환
					.toFile(new File("c:/temp/images/thumb/thumbnail-Desert.jpg")); //썸네일이 생성됨
			*/
			
			//디렉토리 단위로 변환
			Thumbnails.of(new File("c:/temp/images")
					.listFiles((dir, fname)->fname.endsWith(".jpg")))
					.size(200, 100)
				//	.outputFormat("png") //이미지 포맷 변환
					.toFiles(new File("c:/temp/images/thumb"),
							Rename.PREFIX_HYPHEN_THUMBNAIL);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

}
