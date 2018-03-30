package fila;

import java.io.File;
import java.util.Date;

import edu.iot.fila.dao.ImageDao;
import edu.iot.fila.dao.ImageDaoImpl;
import edu.iot.fila.model.Image;

public class ImageInsertTest {
	public final static String IMAGE_DIR="c:/temp/images";
	public static void main(String[] args) throws Exception {
		ImageDao dao = new ImageDaoImpl();
		File[] files = new File(IMAGE_DIR).listFiles();
		for(File file:files) {
			if(file.isDirectory()) continue; //(thumb)디렉토리는 제외
			Image image = new Image();
			String fname = file.getName();
			String title = fname.substring(0, fname.lastIndexOf('.')); //파일명
			String ext = fname.substring(fname.lastIndexOf('.')+1);  //확장자명
			
			image.setTitle(title);
			image.setDescription(title);
			image.setFileName(fname);
			image.setThumbName("thumbnail-"+fname);
			image.setFileSize((int)file.length()); //long을 리턴함
			image.setMimeType("image/"+ext);
			image.setRegDate(new Date(file.lastModified())); //마지막 수정날짜
			
			dao.insert(image);
		}
		System.out.println("이미지 저장 완료");
	}
}