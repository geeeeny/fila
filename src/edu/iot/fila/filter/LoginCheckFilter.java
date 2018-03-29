package edu.iot.fila.filter;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
					, urlPatterns = { "/profile", "/gallery", "/flickr", "/image" })
public class LoginCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		if(session.getAttribute("USER")!=null) {
			chain.doFilter(request, response);
		}else {	//세션 사용자 정보가 없으면 로그인화면으로...
			//원래 가고자 했던 url을 저장해둠->/login에서 로그인 후 main이 아닌 이 url로 이동하게끔..
			String uri = req.getRequestURI(); //uri는 url과 달리 프로토콜까지 포함한 서버주소
			String query = req.getQueryString(); //uri는 쿼리스트링 전까지만 포함

			String url = uri;
			if(query!=null) {
				url = url + "?" + query;
			}
			session.setAttribute("URL", url);
			
			//로그인 화면으로 강제 이동
			HttpServletResponse res = (HttpServletResponse)response;
			res.sendRedirect("login");
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
