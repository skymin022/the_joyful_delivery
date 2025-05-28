package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

// 로그인 후 접근 가능한 페이지 경로에 맞게 urlPatterns 수정
@WebFilter(urlPatterns = {
		"/ask/myqna",
	"/users/mypage-jsp",    // 마이페이지 JSP 직접 접근 보호
	"/users/mypage.jsp",    // 
    "/page/order/*",     // 예시: 주문/배송 관련 페이지
    "/admin/*"           // 예시: 관리자 페이지
    // 필요한 경로 추가
})
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String loginId = (session != null) ? (String) session.getAttribute("loginId") : null;

        if (loginId == null) {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println(
                "<script>alert('로그인이 필요한 서비스입니다'); location.href='"
                + request.getContextPath() + "/page/login/login.jsp';</script>"
            );
            return; // 필터 체인 중단 (로그인 안 된 경우)
        }

        // 로그인된 경우 요청 계속 진행
        chain.doFilter(req, res);
    }
}
