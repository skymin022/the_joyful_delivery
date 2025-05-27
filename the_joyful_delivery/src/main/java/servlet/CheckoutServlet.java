package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/Checkoutpage")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // DTO 대신 Map을 이용해 데이터를 직접 만듦
        List<Map<String, Object>> options = new ArrayList<>();

        Map<String, Object> option1 = new HashMap<>();
        option1.put("note", "동일권 구분 없는 균일 가");
        option1.put("name", "직접 방문 택배");
        option1.put("price1", "2800");
        option1.put("price2", "3600");
        option1.put("price3", "2200");
        option1.put("image", "image26.png");
        options.add(option1);

        Map<String, Object> option2 = new HashMap<>();
        option2.put("note", "기사 방문 택배");
        option2.put("name", "방문 택배");
        option2.put("price1", "4300");
        option2.put("price2", "4800");
        option2.put("price3", "5800");
        option2.put("image", "image25.png");
        options.add(option2);

        Map<String, Object> option3 = new HashMap<>();
        option3.put("note", "5박스 이상 접수 가능");
        option3.put("name", "다량 택배 배송");
        option3.put("price1", "2700");
        option3.put("price2", "3200");
        option3.put("price3", "3700");
        option3.put("image", "image23.png");
        options.add(option3);

        request.setAttribute("options", options);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Checkoutpage.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
