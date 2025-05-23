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
import java.io.PrintWriter;
import java.util.Map;

import DAO.UserDAO;
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
		
		// 회원가입 시 - 아이디 중복 검사 
		else if ("/checkId".equals(path)) {
		    String id = request.getParameter("id");
		    System.out.println("[checkId] 요청 아이디 파라미터: " + id);
		    
		    boolean exists = userService.isUserIdDuplicate(id); //서비스 계층 호출

		    response.setContentType("application/json");
		    PrintWriter out = response.getWriter();
		    out.print("{\"exists\":" + exists + "}");
		    out.flush();
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
                
                // 유저 / 어드민 분리 
                int roleIdx = loginUser.getRoleIdx(); 
                if (roleIdx == 1) {
                    // 일반 사용자 페이지
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                } else if (roleIdx == 2) {
                    // 관리자 페이지
                    response.sendRedirect(request.getContextPath() + "/admin_user.jsp");
                } else {
                    // 그 외 역할이거나 예외 처리
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/page/login/login.jsp?error=true");
            }
            
        }
        
        //  회원가입 
        else if ("/sign_up".equals(path)) {
            // 회원가입 처리 로직
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String email1 = request.getParameter("email1");
            String email2 = request.getParameter("email2");
            String address = request.getParameter("address");
            String birth = request.getParameter("birth");
            String phone = request.getParameter("p_number");

            String email = email1 + "@" + email2;

            User user = User.builder()
                    .id(id)
                    .password(password)
                    .username(name)
                    .email(email)
                    .address(address)
                    .birth(birth)
                    .pNumber(phone)
                    .roleIdx(1)
                    .build();

            try {
                // 서비스 계층으로 중복 검사
                if (userService.isUserIdDuplicate(id)) {
                    request.setAttribute("error", "이미 사용 중인 아이디입니다.");
                    request.getRequestDispatcher("/sign_up.jsp").forward(request, response);
                    return;
                }

                // 회원가입 처리도 service 통해 위임하는 것이 이상적이나, DAO 직접 사용해도 무방
                UserDAO userDAO = new UserDAO();
                int result = userDAO.insert(user);

                if (result > 0) {
                    response.sendRedirect( request.getContextPath() + "/page/login/login.jsp");
                    System.out.println("성공");
                } else {
                	System.out.println("실패");
                    request.setAttribute("error", "회원가입 실패");
                    request.getRequestDispatcher("/sign_up.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.err.println("try 실패");
                request.setAttribute("error", "서버 오류 발생: " + e.getMessage());
                request.getRequestDispatcher("/sign_up.jsp").forward(request, response);
            }
        }


	}
        
    

}


