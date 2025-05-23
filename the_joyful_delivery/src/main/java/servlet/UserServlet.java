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

@WebServlet("/users/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃 
		String path = request.getPathInfo(); 
		System.out.println(path);
		if ("/logout".equals(path)) {
	        // 기존 세션을 가져오고 무효화
	        HttpSession session = request.getSession(false); // false: 세션이 없으면 null 반환
	        if (session != null) {
	            session.invalidate();
	        }

	        // 로그아웃 후 메인 페이지로 리다이렉트
	        response.sendRedirect(request.getContextPath() + "/index.jsp");
	    }
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		// 로그인 로직 
		String path = request.getPathInfo();
		System.out.println(path);

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
        
        //  회원가입 
        else if ("/signup".equals(path)) {
            // 회원가입 처리 로직 구현 예정
        }

        // 
        else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        } 
        
        // 문의하기 -> 내문의사항
     // 한글 처리
        request.setCharacterEncoding("UTF-8");

        // 폼에서 넘어온 값 받기
        String prePos = request.getParameter("pre_pos");
        String title = request.getParameter("c_title");
        String content = request.getParameter("c_content");

        // 넘길 값 저장
        request.setAttribute("pre_posd", prePos);
        request.setAttribute("c_title", title);
        request.setAttribute("c_content", content);
        // 응답 설정
        response.setContentType("text/html;charset=UTF-8");
    }

}

