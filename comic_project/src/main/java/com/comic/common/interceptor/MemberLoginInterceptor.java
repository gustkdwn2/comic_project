package com.comic.common.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j
public class MemberLoginInterceptor extends HandlerInterceptorAdapter {

    private static final String LOGIN = "Memberlogin";
    private static final Logger logger = LoggerFactory.getLogger(MemberLoginInterceptor.class);

    //Controller 실행후 실행
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object memberVO =  modelMap.get("member");      
        System.out.println("인터셉터 vovovovovovovo :" + memberVO);
        if (memberVO != null) {
        	System.out.println("인터셉터 vo :" + memberVO);
            log.info("new login success");
            httpSession.setAttribute(LOGIN, memberVO);
            Object destination = httpSession.getAttribute("destination");
            System.out.println("destination: " + destination);
			response.sendRedirect(destination != null ? (String) destination : "/");

//            if (request.getParameter("useCookie") != null) {
//                logger.info("remember me...");
//                // 쿠키 생성
//                Cookie loginCookie = new Cookie("loginCookie", httpSession.getId());
//                loginCookie.setPath("/");
//                loginCookie.setMaxAge(60*60*24*7);
//                // 전송
//                response.addCookie(loginCookie);
//            }
//
//			
//			 
        }

    }

    //Controller 실행전에 실행
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	System.out.println("memberlogininterceptor prehandle 실행");
        HttpSession httpSession = request.getSession();
        // 기존의 로그인 정보 제거
        if (httpSession.getAttribute(LOGIN) != null) {
            log.info("clear login data before");
            httpSession.removeAttribute(LOGIN);
        }
        return true;
    }
}