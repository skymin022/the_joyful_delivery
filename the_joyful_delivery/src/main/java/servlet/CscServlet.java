package servlet;

import java.io.IOException;
import java.util.List;

import DTO.Announcement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AnnouncementService;
import service.AnnouncementServiceImpl;

/**
 * Servlet implementation class CscServlet
 */
@WebServlet("/serv_center/*")
public class CscServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	AnnouncementService annoService = new AnnouncementServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		System.out.println("요청된 추가 경로 : " + path);
		String page = "";
		
		switch(path) {
			
			case "/announcement": 
				page = "/page/serv_center/announcement.jsp";
				List<Announcement> annos = annoService.list();
				
				request.setAttribute("annos", annos);
				request.getRequestDispatcher(page).forward(request, response);
				break;
		
			default: break;
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
