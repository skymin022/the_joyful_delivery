package servlet;

import java.io.IOException;

import DTO.Delivery;
import DTO.Payment;
import DTO.RegionName;
import DTO.SAR;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.DeliveryService;
import service.DeliveryServiceImpl;
import service.PayService;
import service.PayServiceImpl;
import service.RegionService;
import service.RegionServiceImpl;
import service.SARService;
import service.SARServiceImpl;

@WebServlet("/paypage/*")
public class PayServlet extends HttpServlet {
	
	DeliveryService delService = new DeliveryServiceImpl();
	SARService sarService = new SARServiceImpl();
	PayService payService = new PayServiceImpl();
	RegionService regionService = new RegionServiceImpl();
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	String root = request.getContextPath();
    	String path = request.getPathInfo();
    	
    	
    	if(path.equals("/insert")) {
    		Delivery delivery = (Delivery)session.getAttribute("delivery"); 
    		SAR sar = (SAR)session.getAttribute("sar"); 
    		
    		String cardNumber = request.getParameter("cardNumber");
        	int price = Integer.parseInt(request.getParameter("price"));
    		
    		int result = delService.insert(delivery);
    		if(result != 0) {
    			int result2 = sarService.insert(sar);
    			if(result2 != 0) {
    				Payment payment = Payment.builder().dIdx(delivery.getIdx()).pAmount(price).pCard(cardNumber).build();
    				payService.insert(payment);
    				RegionName region = RegionName.builder().delIdx(delivery.getIdx()).status("인천 부평구").build();
    				regionService.insert(region);
    				System.out.println("배송정보 등록 완료.");
    				response.sendRedirect(root + "/paysuccess.jsp");
    			} 
    		} else {
    			response.sendRedirect(root + "/payfail.jsp");
    		}
    	}
    }
}