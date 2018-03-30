package edu.iot.fila.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import edu.iot.fila.model.Image;

public interface ImageService {

	String IMAGE_DIR = "c:/temp/images";
	String THUMB_DIR = "c:/temp/images/thumb";

	void init();

	List<Image> getImages();

	void sendThumb(int id, HttpServletResponse response);

	void sendImage(int id, HttpServletResponse response);

	void downloadImage(int id, HttpServletResponse response);

}