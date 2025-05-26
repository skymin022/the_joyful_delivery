package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dto.PageInfo;

import DTO.Announcement;
import DTO.FAQ;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.AnnouncementService;
import service.AnnouncementServiceImpl;
import service.FAQService;
import service.FAQServiceImpl;

/**
 * Servlet implementation class CscServlet
 */
@WebServlet("/serv_center/*")
public class CscServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	AnnouncementService annoService = new AnnouncementServiceImpl();
	FAQService faqService = new FAQServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		String root = request.getContextPath();
		System.out.println("요청된 추가 경로 : " + path);
		String page = "";
		String whereTxt = "";
		List<String> column = null;
		
		switch(path) {
			
			case "/announcement": 
				page = "/page/serv_center/announcement.jsp";
				List<Announcement> annoList = annoService.list();
				
				request.setAttribute("list", annoList);
				request.getRequestDispatcher(page).forward(request, response);
				break;
				
			case "/announcement/search": 
				whereTxt = request.getParameter("keyword");
				
				if(whereTxt == null || whereTxt.isEmpty()) {
					response.sendRedirect(root + "/serv_center/announcement");
					return;
				}
				
				column = new ArrayList<>();
				column.add("title");	// 제목
				column.add("content");	// 내용
				
				PageInfo<Announcement> annoInfo = annoService.page(whereTxt, column);
				List<Announcement> annoSearchList = annoInfo.getList();
				
				page = "/page/serv_center/announcement.jsp";
				request.setAttribute("list", annoSearchList);
				request.getRequestDispatcher(page).forward(request, response);
				break;
		
			case "/faq":
				page = "/page/serv_center/faq.jsp";
				List<FAQ> faqList = faqService.listDesc();
				
				request.setAttribute("list", faqList);
				request.getRequestDispatcher(page).forward(request, response);
				break;
				
			case "/faq/search": 
				whereTxt = request.getParameter("keyword");
				
				if(whereTxt == null || whereTxt.isEmpty()) {
					response.sendRedirect(root + "/serv_center/faq");
					return;
				}
				
				column = new ArrayList<>();
				column.add("title");	// 제목
				column.add("content");	// 내용
				
				PageInfo<FAQ> faqInfo = faqService.page(whereTxt, column);
				List<FAQ> faqSearchList = faqInfo.getList();
				
				page = "/page/serv_center/faq.jsp";
				request.setAttribute("list", faqSearchList);
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
