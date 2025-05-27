package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/Login*")
public class LoginFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String loginId = session != null ? (String) session.getAttribute("loginId") : null;

		if (loginId == null) {
		    response.setContentType("text/html; charset=UTF-8");
		    response.getWriter().println("<script>alert('로그인이 필요합니다'); location.href='" 
		        + request.getContextPath() + "/login.jsp';</script>");
		    return;
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
