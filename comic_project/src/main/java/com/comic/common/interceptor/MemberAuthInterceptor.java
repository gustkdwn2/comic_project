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
    	System.out.println("멤버 auth");
    	System.out.println(request.getRequestURI());
    	System.out.println(request.getQueryString());
        String uri = request.getRequestURI();
        String query = request.getQueryString();
        if (query == null || query.equals("null")) {
        	System.out.println("멤버 auth:" + query);
            query = "";
        } else {
        	System.out.println("멤버 auth222:" + query);
            query = "?" + query;
        }
        if (request.getMethod().equals("GET")) {
        	System.out.println("멤버 auth GET");
            logger.info("destination : " + (uri + query));
            request.getSession().setAttribute("destination", uri + query);
        } else if(request.getMethod().equals("POST")){
        	System.out.println("멤버 auth POST: " + uri);
        	logger.info("destination : " + (uri));
            request.getSession().setAttribute("destination", uri);
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	System.out.println("멤버 auth pre");
        HttpSession httpSession = request.getSession();
        System.out.println("멤버 auth pre@@@@ : " + request.getSession());
        if (httpSession.getAttribute("Memberlogin") == null) {
        	System.out.println("여기로오나?");
            saveDestination(request);
            response.sendRedirect("/member/MemberLogin");
            return false;
        }

        return true;
    }
}