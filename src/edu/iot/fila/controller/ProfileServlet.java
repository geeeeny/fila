package edu.iot.fila.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.iot.fila.exception.PasswordNotMatchException;
import edu.iot.fila.model.Member;
import edu.iot.fila.service.MemberService;
import edu.iot.fila.service.MemberServiceImpl;
import edu.iot.fila.service.MemberServiceMapImpl;
import edu.iot.fila.util.Command;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("USER");
		request.setAttribute("member", member);
		RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)Command.parse(request, Member.class);
		
		MemberService service = MemberServiceImpl.getInstance();
		
		try {
			member = service.update(member);
			request.getSession().setAttribute("USER", member);
			response.sendRedirect(getServletContext().getContextPath()+"/index");
		} catch (PasswordNotMatchException e) { //비밀번호 불일치
			request.setAttribute("error", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("member", member);
			RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
			dispatcher.forward(request, response);
		}
	}

}
