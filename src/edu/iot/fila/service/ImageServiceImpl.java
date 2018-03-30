package edu.iot.fila.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import edu.iot.fila.dao.ImageDao;
import edu.iot.fila.dao.ImageDaoImpl;
import edu.iot.fila.model.Image;
import edu.iot.fila.util.FileUtil;

public class ImageServiceImpl implements ImageService {
	ImageDao dao;
	private ImageServiceImpl() {
		dao = new ImageDaoImpl();
	}

	private static ImageServiceImpl instance = new ImageServiceImpl();

	public static ImageServiceImpl getInstance() {
		return instance;
	}
	
	@Override
	public void init() {
/*		ImageDao dao = new ImageDaoImpl();
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
		}*/
	}

	@Override
	public List<Image> getImages() {
		Map<String, Integer> map = new HashMap<>();
		map.put("start", 0);
		map.put("end", 100);
		List<Image> list;
		try {
			list = dao.selectList(map);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void sendThumb(int id, HttpServletResponse response) {
		try {
			Image image = dao.selectOne(id);
			String path = THUMB_DIR + "/" + image.getThumbName();
			response.setContentType(image.getMimeType()); //응답할 때는 타입을 지정해주어야 함
			FileUtil.copy(path, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendImage(int id, HttpServletResponse response) {
		try {
			Image image = dao.selectOne(id);
			String path = IMAGE_DIR + "/" + image.getFileName();
			response.setContentType(image.getMimeType());
			FileUtil.copy(path, response);  //파일 정보를 내보냄
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void downloadImage(int id, HttpServletResponse response) {
		try {
			Image image = dao.selectOne(id);
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition",
					"attachment; filename=" + java.net.URLEncoder.encode(image.getFileName()));
			sendImage(id, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
