package edu.iot.fila.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.iot.fila.model.Image;
import edu.iot.fila.service.ImageListService;
import edu.iot.fila.service.ImageService;

/**
 * Servlet implementation class GalleryServlet
 */
@WebServlet("/gallery")
public class GalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GalleryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String page = "gallery_lightbox.jsp";
		if(mode!=null && mode.equals("carousel")) {
			page = "gallery_carousel.jsp";
		}
		
		ImageService service = ImageListService.getInstance();
		List<Image> list = service.getImages();
		
		request.setAttribute("list", list); //속성 전달
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response); //포워딩. 다른 페이지로 이동
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
