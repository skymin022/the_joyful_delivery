package servlet;

import java.io.IOException;

import DTO.Delivery;
import DTO.SAR;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DeliveryService;
import service.DeliveryServiceImpl;

@WebServlet("/paypage")
public class PayServlet extends HttpServlet {
	
	DeliveryService delService = new DeliveryServiceImpl();
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String root = request.getContextPath();
    	String path = request.getPathInfo();
    	
    	Delivery delivery = (Delivery)request.getAttribute("delivery");
    	SAR sar = (SAR)request.getAttribute("sar");
    	
    	request.setAttribute("delivery", delivery);
    	request.setAttribute("sar", sar);
    	
    	request.getRequestDispatcher("/paypage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response); // POST 요청도 GET 처리
    }
}