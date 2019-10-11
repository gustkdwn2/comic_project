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
public class EmployeeLoginInterceptor extends HandlerInterceptorAdapter {

    private static final String LOGIN = "Employeelogin";
    private static final Logger logger = LoggerFactory.getLogger(EmployeeLoginInterceptor.class);

    //Controller 실행후 실행
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object employeeVO =  modelMap.get("employee");      

        if (employeeVO != null) {
        	System.out.println(employeeVO);
            log.info("new login success");
            httpSession.setAttribute(LOGIN, employeeVO);
            response.sendRedirect("/");

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
//			  Object destination = httpSession.getAttribute("destination");
//			  response.sendRedirect(destination != null ? (String) destination : "/");
//			 
        }

    }

    //Controller 실행전에 실행
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        // 기존의 로그인 정보 제거
        if (httpSession.getAttribute(LOGIN) != null) {
            log.info("clear login data before");
            httpSession.removeAttribute(LOGIN);
        }

        return true;
    }
}