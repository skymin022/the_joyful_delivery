package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DTO.AskDTO;
import DTO.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.AskService;
import service.AskServiceImpl;
import service.InquiryServiceImpl;
import service.UserService;
import service.UserServiceImpl;

/**
 * Servlet implementation class AskServlet
 */
@WebServlet("/ask/*")
public class AskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImpl();
	private AskService askService = new AskServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		String root = request.getContextPath();
		
		// 세션에서 유저넘버 받아오기
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("loginUser");
        
        if (user == null) {
            response.sendRedirect(root + "/login.jsp"); // 로그인 페이지 경로로 수정 필요
            return;
        }
        
        int idx = user.getIdx();
        System.out.println("user" + user);
		
		Map<String, Object> qna = new HashMap<String, Object>();
		qna.put("user_no", idx);
		
		// 문의하기 -> 내문의사항
		String page = "";
		
        switch(path) {
		
		case "/contact": 
			page = "/page/serv_center/contact.jsp";
			
			request.getRequestDispatcher(page).forward(request, response);
			break;
	
		case "/myqna":
			page = "/page/serv_center/myqna.jsp";
			List<AskDTO> askList = askService.listBy(qna);
			System.out.println("asklist" + askList);
			// 결과 페이지로 포워딩
			request.setAttribute("askList", askList);
	        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
	        dispatcher.forward(request, response);
			break;
			
		default: break;
	}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 유저넘버 받아오기
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("loginUser");
        int idx = user.getIdx();
        System.out.println("user" + user);
        
		String path = request.getPathInfo();
		
		
        // 한글 처리
        request.setCharacterEncoding("UTF-8");
        
        // 폼에서 넘어온 값 받기
        String type = request.getParameter("qna_type");
        String title = request.getParameter("c_title");
        String content = request.getParameter("c_content");
        
        // 넘어온 값 객체 생성
        AskDTO askDto = AskDTO.builder()
        					  .userNo(idx)
        					  .title(title)
        					  .content(content)
        					  .type(type)
        					  .build();
        askService.insert(askDto);	  

        Map<String, Object> qna = new HashMap<String, Object>();
        qna.put("user_no", idx);
        
        // 문의하기 -> 내문의사항
        String page = "";
        List<AskDTO> askList = askService.listBy(qna); 
        System.out.println("asklist" + askList);
        // 넘길 값 저장
        request.setAttribute("qna_type", type); //배송유형
        request.setAttribute("c_title", title);  //문의제목
        request.setAttribute("c_content", content);  //문의내용
        
        // 결과 페이지로 포워딩
        page = "/page/serv_center/myqna.jsp";
        request.setAttribute("askList", askList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
		
//		doGet(request, response);
	}

}
