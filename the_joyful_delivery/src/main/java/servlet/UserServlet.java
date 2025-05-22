package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.DeliveryServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import java.io.IOException;

import DTO.User;

@WebServlet("/login")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();  // /login

        if ("/login".equals(path)) {
            String userId = request.getParameter("id");
            String password = request.getParameter("password");

            User user = User.builder()
                            .id(userId)
                            .password(password)
                            .build();

            boolean result = userService.login(user);
            User loginUser = userService.selectUserById(user.getId());
            System.out.println(result);

            if (result) {
                loginUser.setPassword(null);

                HttpSession session = request.getSession();
                session.setAttribute("loginId", user.getId());
                session.setAttribute("loginUser", loginUser);

                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/page/login/login.jsp?error=true");
            }
        }
    }

}

