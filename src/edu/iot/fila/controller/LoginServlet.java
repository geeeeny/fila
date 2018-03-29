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
import edu.iot.fila.util.Command;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*	
	Member map(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		return Member.builder()
				.userId(userId)
				.password(password)
				.build();
	}
	*/
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    //디폴트 동작
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = (String)session.getAttribute("URL");
		session.removeAttribute("URL");
		request.setAttribute("url", url);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = MemberService.getInstance();
		//Member member = map(request);
		Member member = (Member)Command.parse(request, Member.class); //map의 동작을 해주는 라이브러리
		Member m = service.checkLogin(member);
		String url = request.getParameter("url");
		
		if (m!=null) { //성공시 리다이렉트로 새로운 url 페이지로 이동
			HttpSession session = request.getSession();
			session.setAttribute("USER", m);
			
			//이동하고자 했던 페이지가 있으면 로그인 후 그 페이지로 이동한다.
			if(url!=null) {
				response.sendRedirect(url);
			}else {
				response.sendRedirect("main.jsp"); //상대경로. 브라우저에서 루트는 ip:8080
			}
		} else {	//실패시 포워드로 같은 url(/login) 입력 페이지로 이동
			request.setAttribute("error", "사용자 ID 또는 비밀번호가 틀렸습니다.");
			// '/'는 루트 표시(절대경로). 서버에서 루트는 ip:8080/context 
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response); //이동
		}
	}

}
