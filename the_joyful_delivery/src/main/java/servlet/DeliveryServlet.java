package servlet;

import java.io.IOException;
import java.util.Enumeration;

import DTO.Delivery;
import DTO.SAR;
import DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.DeliveryService;
import service.DeliveryServiceImpl;
import service.SARService;
import service.SARServiceImpl;

/**
 * Servlet implementation class DeliveryServlet
 */
@WebServlet("/delivery/*")
public class DeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DeliveryService deliveryService = new DeliveryServiceImpl();
	SARService sarService = new SARServiceImpl();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String path = request.getPathInfo();
		HttpSession hs = request.getSession();
		
		switch(path) {
			case "/reservation1":
				try {
					String keyword = request.getParameter("keyword");
					int value = Integer.parseInt(request.getParameter("value"));
					String reser_name = request.getParameter("reser_name");
					System.out.println("세션의 넣을 값 : " + keyword + ", " + value + ", " + reser_name);
					
					hs.setAttribute("keyword", keyword);
					hs.setAttribute("value", value);
					hs.setAttribute("reser_name", reser_name);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// 다음페이지로 이동
				response.sendRedirect(root + "/page/delivery/delivery_rec2.jsp");
				break;
				
			case "/reservation2":
				try {
					String s_name = request.getParameter("s_name");
					String s_number = request.getParameter("s_number");
					String s_address = request.getParameter("s_address");
					System.out.println("세션의 넣을 값 : " + s_name + ", " + s_number + ", " + s_address);
					
					hs.setAttribute("s_name", s_name);
					hs.setAttribute("s_number", s_number);
					hs.setAttribute("s_address", s_address);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// 다음페이지로 이동
				response.sendRedirect(root + "/page/delivery/delivery_rec3.jsp");
				break;
				
			case "/reservation3":
				try {
					String r_name = request.getParameter("r_name");
					String r_number = request.getParameter("r_number");
					String r_address = request.getParameter("r_address");
					String _request = request.getParameter("request");
					String pre_pos = request.getParameter("pre_pos");
					String keyword = (String) hs.getAttribute("keyword");
					int value = (Integer) hs.getAttribute("value");
					String reser_name = (String) hs.getAttribute("reser_name");
					String s_name = (String) hs.getAttribute("s_name");
					String s_number = (String) hs.getAttribute("s_number");
					String s_address =(String) hs.getAttribute("s_address");
					
					User user = (User)hs.getAttribute("loginUser");
					int user_idx = user.getIdx();							// 유저 idx 추출
					long del_idx = (long)(Math.random()*99999999999l) + 1;	// 송장번호 랜덤
					int driver_idx = (int)(Math.random()*10)+1;				// 택배기사 배정
					//TODO: 택배기사 랜덤으로 지정
					
					Delivery delivery = Delivery.builder()
												.idx(del_idx).userIdx(user_idx)
												.driverIdx(driver_idx)
												.keyword(keyword).value(value)
												.prePos(pre_pos).reserName(reser_name)
												.request(_request).build();
					
					int result1 = deliveryService.insert(delivery);	
					if(result1 != 0) {
						SAR sar = SAR.builder().delIdx(del_idx)
									 .rName(r_name).rNumber(r_number).rAddress(r_address)
									 .sName(s_name).sNumber(s_number).sAddress(s_address).build();
						int result2 = sarService.insert(sar);
						
						if(result2 != 0) System.out.println("택배 등록 최종 성공.");
					}
					
					Enumeration<String> attributes = hs.getAttributeNames();

					// 유저 정보를 제외한 나머지 session 값 삭제
					while (attributes.hasMoreElements()) {
					    String name = attributes.nextElement();
					    if (!"loginUser".equals(name)) {
					        hs.removeAttribute(name);
					    }
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				// 다음페이지로 이동
				response.sendRedirect(root + "/paypage.jsp");
				break;
				
				default : break;
		}
	}

}
