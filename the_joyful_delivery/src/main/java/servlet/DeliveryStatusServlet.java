package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DeliveryService;
import service.DeliveryServiceImpl;


@WebServlet("/DeliveryStatusServlet")
public class DeliveryStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 private DeliveryService deliveryService = new DeliveryServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//	        int page = 1;
//	        int size = 10;
//	        if (request.getParameter("page") != null) {
//	            page = Integer.parseInt(request.getParameter("page"));
//	        }
//	        try {
//	            PageInfo<Delivery> pageInfo = deliveryService.getPaginatedDeliveries(page);
//	            request.setAttribute("pageInfo", pageInfo);
//	            request.getRequestDispatcher("/WEB-INF/views/delivery/list.jsp").forward(request, response);
//	        } catch (Exception e) {
//	            throw new ServletException("배송 목록 조회 실패", e);
//	        }
	    }
    
		
		
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
