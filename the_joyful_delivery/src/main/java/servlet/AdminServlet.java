package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;
import com.google.gson.Gson;

import DTO.Delivery;
import DTO.Driver;
import DTO.Inquiry;
import DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DeliveryServiceImpl;
import service.DriverService;
import service.DriverServiceImpl;
import service.InquiryServiceImpl;
import service.UserService;
import service.UserServiceImpl;
import util.QueryStringBuilder;

@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserService userService = new UserServiceImpl();
    // 직접 만든 DAO 메서드 쓰려고 Impl 타입으로 선언
    private DeliveryServiceImpl delService = new DeliveryServiceImpl();
    private InquiryServiceImpl inqService = new InquiryServiceImpl();
    private DriverService driverService = new DriverServiceImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User role = (User) request.getSession().getAttribute("loginUser");
		if(role.getRoleIdx() != 2) {
			response.sendRedirect(request.getContextPath() + "/index");
		}
		String path = request.getPathInfo();
		System.out.println("요청된 추가 경로 : " + path);
		String page = "";				// forward 로 이동할 경로

		String whereTxt = "";			// where 절 조건
		String column = "";				// where 절 컬럼	
		int currentPage = 1;			// 현재 몇 페이지 
		if(request.getParameter("page") != null)
		currentPage = Integer.parseInt(request.getParameter("page"));
		int pageCut = 10;				// 한 페이지의 출력 할 행의 수 
		int size = 0;					// 총 행의 수 담을 변수
		int blockSize = 5;
		int startPage = (currentPage - 1) / blockSize * blockSize;
		int endPage = 0;
		String paramQuery = "";			// 파라미터 쿼리들

		// 요청별 로직 처리
		switch(path) {
			// 어드민 유저관리 페이지
			case "/user":
				whereTxt = request.getParameter("where_txt"); 		// 조건 검색어
				column = request.getParameter("where"); 			// 컬럼

				if(whereTxt != "" && whereTxt != null && column != null) {
					System.out.println(column + " LIKE %" + whereTxt + "%");
					List<String> columnList = new ArrayList<>();
					columnList.add(column);
					
					PageInfo<User> pageInfo = userService.page(whereTxt, columnList);
					List<User> users = pageInfo.getList();
					Page pageObj = pageInfo.getPage();
					
					request.setAttribute("users", users);
					request.setAttribute("page", pageObj);
					request.setAttribute("pageInfo", pageInfo);
				} else {
					Map<String, Object> where2 = new HashMap<>();
					where2.put("role_idx", 1);
					List<User> users = userService.listBy(where2);
					request.setAttribute("users", users);
				}
				
				page = "/page/admin/admin_user.jsp";
				request.getRequestDispatcher(page).forward(request, response);
			break;
			// 어드민 택배관리 페이지
			
			case "/delivery":
				whereTxt= request.getParameter("where_txt");	// 조건 검색어
				column = request.getParameter("where");			// 컬럼
				System.out.println(column + " LIKE %" + whereTxt + "%");
				if(request.getParameterMap() != null)		    // 파라미터 쿼리
					paramQuery = QueryStringBuilder.execute(request.getParameterMap());
				
				List<Delivery> deliveries = null;
				// 필터링 없을 때
				if(whereTxt == null || column == null) {
					deliveries = delService.regJoinList(pageCut, (currentPage-1) * pageCut);
					size = (int)Math.ceil( delService.joinCount() / (double)pageCut);
					System.out.println(currentPage - 1);
					endPage = Math.min(startPage + blockSize - 1, size - 1);
					System.out.println("총 페이지 수 : " + size);
				} 
				// 필터링 있을 때
				else {
					deliveries = delService.regJoinList(column, whereTxt, pageCut, (currentPage-1) * pageCut);
					size = (int)Math.ceil( delService.filterJoinCount(column, whereTxt) / (double)pageCut);
					endPage = Math.min(startPage + blockSize - 1, size - 1);
					System.out.println("총 페이지 수 : " + size);
				} 
				page = "/page/admin/admin_delivery.jsp";
				request.setAttribute("paramQuery", paramQuery);		// 파라미터 쿼리 
				request.setAttribute("currentPage", currentPage); 	// 페이지							
				request.setAttribute("size", size);					// 행 사이즈
				request.setAttribute("deliveries", deliveries);		// 행 리스트
				request.setAttribute("startPage", startPage);		// 시작 페이지
				request.setAttribute("endPage", endPage);			// 종료 페이지
				request.getRequestDispatcher(page).forward(request, response);
				break;
				
			// 어드민 문의 페이지
			case "/inquiry":
				whereTxt = request.getParameter("where_txt"); // 조건 값
				column = request.getParameter("where"); 	  // 조건 컬럼
				
				if(whereTxt != "" && whereTxt != null && column != null) {
					List<String> columnList = new ArrayList<>();
					columnList.add(column);
					
					PageInfo<Inquiry> inquiryInfo = inqService.page(whereTxt, columnList);
					List<Inquiry> inquiryList = inquiryInfo.getList();
					request.setAttribute("list", inquiryList);
				} else {
					System.out.println("else 로 넘어옴");
					List<Inquiry> inquiryList = inqService.list();
					request.setAttribute("list", inquiryList);
				}
				
				page = "/page/admin/admin_inq.jsp";
				request.getRequestDispatcher(page).forward(request, response);
				break;
				
			// 어드민 기사관리 페이지
			case "/driver":
				whereTxt = request.getParameter("where_txt"); // 조건 값
				column = request.getParameter("where"); 	  // 조건 컬럼
				
				if(whereTxt != "" && whereTxt != null && column != null) {
					List<String> columnList = new ArrayList<>();
					columnList.add(column);
					
					PageInfo<Driver> inquiryInfo = driverService.page(whereTxt, columnList);
					List<Driver> inquiryList = inquiryInfo.getList();
					request.setAttribute("list", inquiryList);
				} else {
					System.out.println("else 로 넘어옴");
					List<Driver> inquiryList = driverService.list();
					request.setAttribute("list", inquiryList);
				}
				
				page = "/page/admin/admin_driver.jsp";
				request.getRequestDispatcher(page).forward(request, response);
				
			// 모달에 데이터 전송
			case "/user/modal":
				int idx = Integer.parseInt(request.getParameter("idx"));
				response.setContentType("application/json; charset=utf-8");
//				int idx = Integer.parseInt(request.getParameter("idx"));
				Gson gson = new Gson();
				Map<String, Object> where = new HashMap<>();
				where.put("idx", idx);
				try {
					List<User> list = userService.listBy(where);
					String json = gson.toJson(list);
					response.getWriter().write(json);
				} catch (Exception e) {
					e.printStackTrace();
				}
			default: break;
		} 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminAnswer = request.getParameter("adm_answer");
		
		
		doGet(request, response);
		String root = request.getContextPath();
		String path = request.getPathInfo();
		String page = "";
		
		switch(path) {
			case "/user/update":
				int idx = Integer.parseInt(request.getParameter("idx"));
				String username = request.getParameter("username");
				String id = request.getParameter("id");
				String email = request.getParameter("email");
				String p_number = request.getParameter("p_number");
				String address = request.getParameter("address");
				String birth = request.getParameter("birth");
				
				// 유저 객체 빌드 패턴으로 생성
				User user = User.builder()
							    .idx(idx)
							    .roleIdx(1)
							    .username(username)
							    .id(id)
							    .email(email)
							    .pNumber(p_number)
							    .address(address)
							    .birth(birth)
							    .build();
				
				int result = userService.update(user);
				page = root + "/page/admin/update_form.jsp";
				if(result != 0) {
					System.out.println("유저 정보 업데이트됨.");
					response.sendRedirect(page);
				}
				
			break;
		}
	}
}
