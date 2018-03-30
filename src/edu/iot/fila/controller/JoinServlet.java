package edu.iot.fila.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.iot.fila.model.Member;
import edu.iot.fila.service.MemberService;
import edu.iot.fila.service.MemberServiceImpl;
import edu.iot.fila.service.MemberServiceMapImpl;
import edu.iot.fila.util.Command;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("join.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = MemberServiceImpl.getInstance();
		
		//Member 구성 ?
		//Member member = map(request);
		Member member = (Member)Command.parse(request, Member.class); //map의 동작을 해주는 라이브러리
		System.out.println(member);
		
		service.add(member);
		
		response.sendRedirect(getServletContext().getContextPath()+"/"); //indexServlet으로 이동
	}
	/*	
	Member map(HttpServletRequest request) {
		return Member.builder()
				.userId(request.getParameter("userId"))
				.password(request.getParameter("password"))
				.name(request.getParameter("name"))
				.cellPhone(request.getParameter("cellPhone"))
				.email(request.getParameter("email"))
				.address(request.getParameter("address"))
				.build();
	}
	*/
}
