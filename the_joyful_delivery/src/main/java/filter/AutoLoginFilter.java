package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

//예시: AutoLoginFilter.java
@WebFilter("/*")
public class AutoLoginFilter implements Filter {
 public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
     HttpServletRequest request = (HttpServletRequest) req;
     HttpServletResponse response = (HttpServletResponse) res;
     HttpSession session = request.getSession(false);

     // 세션이 없고, 자동 로그인 쿠키가 있다면
     if (session == null || session.getAttribute("loginId") == null) {
         Cookie[] cookies = request.getCookies();
         String autoLoginId = null;
         if (cookies != null) {
             for (Cookie c : cookies) {
                 if ("autoLoginId".equals(c.getName())) {
                     autoLoginId = c.getValue();
                     break;
                 }
             }
         }
         if (autoLoginId != null) {
             // DB 등에서 아이디 유효성 검증 후 세션 생성
             // 예시: User user = userDAO.select(autoLoginId);
             // if (user != null) {
             HttpSession newSession = request.getSession(true);
             newSession.setAttribute("loginId", autoLoginId);
             // ... 추가 사용자 정보 세션에 저장
             // }
         }
     }
     chain.doFilter(req, res);
 }
}

