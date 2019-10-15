package com.comic.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class MemberAuthInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(MemberAuthInterceptor.class);

    // 페이지 요청 정보 저장
    private void saveDestination(HttpServletRequest request) {
        String uri = request.getRequestURI();
        String query = request.getQueryString();
        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }
        System.out.println(request.getMethod());
        if (request.getMethod().equals("GET")) {
        	System.out.println("GET으로 옴");
            logger.info("destination : " + (uri + query));
            request.getSession().setAttribute("destination", uri + query);
        } else if(request.getMethod().equals("POST")){
        	System.out.println("Post로옴");
        	System.out.println("destination : " + (uri + query));
        	logger.info("destination : " + (uri + query));
            request.getSession().setAttribute("destination", uri + query);
        }
        
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("Memberlogin") == null) {
            saveDestination(request);
            response.sendRedirect("/member/MemberLogin");
            return false;
        }

        return true;
    }
}