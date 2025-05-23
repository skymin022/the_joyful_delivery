package servlet;

import java.io.IOException;
import java.util.List;

import DTO.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import service.UserServiceImpl;

/**
 * Servlet implementation class AskServlet
 */
@WebServlet("/ask")
public class AskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 문의하기 -> 내문의사항
		String page = "";
		List<User> userList = userService.list();
		
        // 한글 처리
        request.setCharacterEncoding("UTF-8");

        // 폼에서 넘어온 값 받기
        String prePos = request.getParameter("pre_pos");
        String title = request.getParameter("c_title");
        String content = request.getParameter("c_content");

        // 넘길 값 저장
        request.setAttribute("pre_pos", prePos); //배송유형
        request.setAttribute("c_title", title);  //문의제목
        request.setAttribute("c_content", content);  //문의내용
        
        // 결과 페이지로 포워딩
        page = "/page/serv_center/myqna.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
        
		doGet(request, response);
	}

}
