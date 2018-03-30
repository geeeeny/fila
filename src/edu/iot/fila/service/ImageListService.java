package edu.iot.fila.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import edu.iot.fila.model.Image;
import edu.iot.fila.util.FileUtil;

public class ImageListService implements ImageService {
	List<Image> images;
	
	private ImageListService() {
		images = new ArrayList<>();
		init();
	}

	private static ImageService instance = new ImageListService();

	public static ImageService getInstance() {
		return instance;
	}

	@Override
	public void init() {
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
			
			images.add(image);
		}
	}

	@Override
	public List<Image> getImages(){
		return images;
	}
	
	@Override
	public void sendThumb(int id, HttpServletResponse response) {
		Image image = images.get(id);
		String path = THUMB_DIR + "/" + image.getThumbName();
		response.setContentType(image.getMimeType()); //응답할 때는 타입을 지정해주어야 함
		FileUtil.copy(path, response);
	}

	@Override
	public void sendImage(int id, HttpServletResponse response) {
		Image image = images.get(id);
		String path = IMAGE_DIR + "/" + image.getFileName();
		response.setContentType(image.getMimeType());
		FileUtil.copy(path, response);  //파일 정보를 내보냄
	}

	@Override
	public void downloadImage(int id, HttpServletResponse response) {
		Image image = images.get(id);
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename="+
					java.net.URLEncoder.encode(image.getFileName()));
		sendImage(id, response);
	}
	
	
	
	
	
	
}
