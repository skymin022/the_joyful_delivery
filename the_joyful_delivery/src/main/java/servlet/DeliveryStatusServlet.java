package servlet;

import java.io.IOException;

import DTO.Delivery;
import jakarta.servlet.RequestDispatcher;
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
		String idxStr = request.getParameter("idx");
        if (idxStr == null) {
        	response.sendError(HttpServletResponse.SC_BAD_REQUEST, "배송 idx가 필요합니다.");
            return;
        }
        try {
            int idx = Integer.parseInt(idxStr);
            Delivery delivery = deliveryService.getDeliveryByIdx(idx);
            if (delivery == null) {
            	response.sendError(HttpServletResponse.SC_NOT_FOUND, "배송 정보를 찾을 수 없습니다.");
                return;
            }
            request.setAttribute("delivery", delivery);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/deliveryStatus.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 오류");
        }
    }
		
		
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
