package edu.iot.fila.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.function.BiConsumer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.iot.fila.service.ImageListService;
import edu.iot.fila.service.ImageService;
import edu.iot.fila.service.ImageServiceImpl;

@WebServlet("/image")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Map<String, BiConsumer<Integer, HttpServletResponse>> map; //mode를 key로, id와 response 값을 갖는 객체를 value로 가짐
	
    public ImageServlet() {
        super();

        ImageService service = ImageServiceImpl.getInstance();
        map = new HashMap<>();
        map.put("thumb", service::sendThumb);
        map.put("image", service::sendImage);
        map.put("download", service::downloadImage);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String mode = request.getParameter("mode");
		
		/*	한 가지 형태로 추상화시키자 -> map과 람다 이용	
		ImageService service = ImageService.getInstance();
		
		if(mode.equals("thumb"))
			service.sendThumb(id, response);
		else if(mode.equals("image"))
			service.sendImage(id, response);
		else if(mode.equals("download"))
			service.downloadImage(id, response);
		*/
		map.get(mode).accept(id, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
