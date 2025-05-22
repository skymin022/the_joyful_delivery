package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DTO.Delivery;
import DTO.Inquiry;
import DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DeliveryServiceImpl;
import service.InquiryServiceImpl;
import service.UserService;
import service.UserServiceImpl;

@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserService userService = new UserServiceImpl();
    // 직접 만든 DAO 메서드 쓰려고 Impl 타입으로 선언
    private DeliveryServiceImpl delService = new DeliveryServiceImpl();
    private InquiryServiceImpl inqService = new InquiryServiceImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		System.out.println("요청된 추가 경로 : " + path);
		String page = "";
		
		// 요청별 로직 처리
		switch(path) {
			// 어드민 유저관리 페이지
			case "/user":
				page = "/page/admin/admin_user.jsp";
				Map<String, Object> where = new HashMap<>();
				where.put("role_idx", 1);
				List<User> users = userService.listBy(where);
				
				request.setAttribute("users", users);
				request.getRequestDispatcher(page).forward(request, response);
				break;
				
			// 어드민 택배관리 페이지
			case "/delivery":
				page = "/page/admin/admin_delivery.jsp";
				String whereTxt = request.getParameter("where_txt");
				String column = request.getParameter("where");
				List<Delivery> deliveries = null;
				
				if(whereTxt != null || column != null) {
					// TODO: like 절 처리
				} else {
					deliveries = delService.regJoinList();
				}
				
				
				request.setAttribute("deliveries", deliveries);
				request.getRequestDispatcher(page).forward(request, response);
				break;
				
			// 어드민 문의 페이지
			case "/inquiry":
				page = "/page/admin/admin_inq.jsp";
				List<Inquiry> inquiries = inqService.list();
				
				request.setAttribute("inquiries", inquiries);
				request.getRequestDispatcher(page).forward(request, response);
				break;
				
			default: break;
		} 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
