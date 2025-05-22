package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DTO.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import service.UserServiceImpl;

@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		System.out.println("요청된 추가 경로 : " + path);
		String page = "";
		
		// 요청별 로직 처리
		switch(path) {
			// 어드민 유저관리 페이지
			case "/admin_user":
				page = "/page/admin/admin_user.jsp";
				Map<String, Object> key = new HashMap<>();
				key.put("role_idx", 1);
				List<Users> users = userService.listBy(key);
				System.out.println("servlet 실행");
				request.setAttribute("users", users);
				request.getRequestDispatcher(page).forward(request, response);
				break;
				
				
			default: break;
		} 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
