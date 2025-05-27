package servlet;

import java.io.IOException;

import DTO.Delivery;
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

		String delIdxParam = request.getParameter("del_idx");
        Delivery delivery = null;
        if (delIdxParam != null && !delIdxParam.trim().isEmpty()) {
            try {
                int delIdx = Integer.parseInt(delIdxParam.trim());
                delivery = deliveryService.findByDelIdx(delIdx);
            } catch (NumberFormatException e) {
                // 운송장번호가 숫자가 아닐 경우
            }
        }
        request.setAttribute("delivery", delivery);
        request.getRequestDispatcher("/page/delivery/delivery_status.jsp").forward(request, response);
    }
	


	    
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
