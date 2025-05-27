package servlet;

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

import java.io.IOException;

import DTO.Delivery;
import DTO.User;

@WebServlet("/paypage")
public class payServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	 HttpSession session = request.getSession(false);
         String userId = null;

         if (session != null && session.getAttribute("user") != null) {
             User user = (User) session.getAttribute("user");
             userId = user.getId(); // User에 getId() 메서드가 있다고 가정
         }
         
         // 배송 정보 가져오기
         if (userId != null) {
        	 DeliveryService deliveryService = new DeliveryServiceImpl();
         }
        // 결제 금액 데이터 전달(임의 의 값)
        request.setAttribute("totalPrice", 12000);
        
        
        request.getRequestDispatcher("/WEB-INF/views/paypage.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response); // POST 요청도 GET 처리
    }
}