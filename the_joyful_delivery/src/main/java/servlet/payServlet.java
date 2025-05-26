package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.DeliveryServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import java.io.IOException;

import DTO.User;

@WebServlet("/paypage")
public class payServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 예시: 결제 금액 데이터 전달
        request.setAttribute("totalPrice", 12000);
        
        // JSP로 포워딩 (요청과 응답을 JSP로 넘김)
        request.getRequestDispatcher("/WEB-INF/views/paypage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response); // POST 요청도 GET 처리
    }
}