package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


import DAO.UserDAO;
import DTO.Delivery;
import DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import service.DeliveryService;
import service.DeliveryServiceImpl;
import service.UserService;
import service.UserServiceImpl;


@WebServlet("/users/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImpl();
	 private DeliveryService deliveryService = new DeliveryServiceImpl();
	
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
	        response.sendRedirect(request.getContextPath() + "/index");
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
		
		// mypage- 목록 조회
		else if ("/mypage-jsp".equals(path)) {
		    HttpSession session = request.getSession(false);


		    String loginId = (String) session.getAttribute("loginId");
		    System.out.println("[/mypage-jsp] JSP용 배송 목록 조회. 로그인 아이디: " + loginId);

		    // 배송내역 조회
		    List<Delivery> deliveries = deliveryService.listByUserId(loginId);

		    request.setAttribute("deliveries", deliveries);
		    request.getRequestDispatcher("/page/login/login_list.jsp").forward(request, response);
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
            	// 비밀번호는 세션 저장 X 
                loginUser.setPassword(null);
                
                // 세션 생성, 기존 세션 가져오기 및 로그인된 사용자 정보 세션에 저장  
                HttpSession session = request.getSession();
                session.setAttribute("loginId", user.getId());
                session.setAttribute("loginUser", loginUser);
                
                // 유저 / 어드민 분리 
                int roleIdx = loginUser.getRoleIdx(); 
                if (roleIdx == 1) {
                    // 일반 사용자 페이지
                	System.out.println(request.getContextPath());
                    response.sendRedirect(request.getContextPath() + "/index");
                } else if (roleIdx == 2) {
                    // 관리자 페이지
                    response.sendRedirect(request.getContextPath() + "/admin/user");
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

            
                        
        } // 회원가입 끝 

        // 마이페이지 - 회원정보 수정 
        else if ("/update".equals(path)) {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("loginId") == null) {
                response.sendRedirect(request.getContextPath() + "/page/login/login.jsp");
                return;
            }

            String p_number = request.getParameter("p_number");
            String id = request.getParameter("id");
            if (id == null || id.trim().isEmpty()) {
                System.out.println("ID가 비어 있습니다.");
                // 처리 중단
            }
            
            // idx 파라미터 받아오기
            int idx = Integer.parseInt(request.getParameter("idx"));  //


            String password = request.getParameter("password");
            String email1 = request.getParameter("email1");
            String email2 = request.getParameter("email2");
            String email = email1 + "@" + email2;

            System.out.println("[UserServlet POST] path: " + path);
            String address = request.getParameter("address");
            String addressDetail = request.getParameter("address_detail");
            
            // 두 주소를 합쳐서 하나의 문자열로 만든다 (공백 한 칸 추가)
            String fullAddress = address;
            if(addressDetail != null && !addressDetail.trim().isEmpty()) {
                fullAddress += " " + addressDetail.trim();
            }
            
            User updatedUser = User.builder()
            		.idx(idx)
            	    .id(id)
            	    .password(password)
            	    .email(email)
            	    .address(fullAddress)
            	    .pNumber(p_number)
            	    .build();
            // 로그 추적 
            System.out.println("업데이트 객체 : " + updatedUser);

            int result = userService.update(updatedUser);
            System.out.println("결과" + result);
            if (result > 0) {
                // 세션에 최신 정보 갱신
                User refreshedUser = userService.selectUserById(id);
                refreshedUser.setPassword(null); // 비밀번호 감춤 
                session.setAttribute("loginUser", refreshedUser);

                response.sendRedirect(request.getContextPath() + "/index");
            } else {
                request.setAttribute("error", "업데이트 실패");
                request.getRequestDispatcher("/page/login/login_list_update.jsp").forward(request, response);
            }
        }

        // 아이디 비밀번호 찾기 
        else if ("/find".equals(path)) {
        	String mode = request.getParameter("mode"); // "id" 또는 "pw"
        	String result = null;
        	
        	if ("id".equals(mode)) {
        		String username = request.getParameter("username");
        		String email = request.getParameter("email");
        		result = userService.findIdByNameAndEmail(username, email);
        		request.setAttribute("findResult", result != null ? "아이디: " + result : "일치하는 회원이 없습니다.");
        	} else if ("pw".equals(mode)) {
        		String id = request.getParameter("id");
        		String username = request.getParameter("username");
        		String email = request.getParameter("email");
        		result = userService.findPwByIdNameEmail(id, username, email);
        		request.setAttribute("findResult", result != null ? "비밀번호: " + result : "일치하는 회원이 없습니다.");
        	}
        	request.getRequestDispatcher("/page/login/find_id_pw.jsp").forward(request, response);
        	
        }

        
        
	    
		
        
        
	}
}