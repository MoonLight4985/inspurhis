package com.inspur.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginCheckFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;//获取HttpServletRequest
        HttpSession session= request.getSession();
        Object users = session.getAttribute("users");
        if(users!= null){//登录了直接放行
            filterChain.doFilter(servletRequest,servletResponse);
        }else {
            String requestURI = request.getRequestURI();
            if(requestURI.contains("login")){//包含login的路径就行放行需要放行
                filterChain.doFilter(servletRequest,servletResponse);
            }else {//其他的直接跳转到登录界面
                request.getRequestDispatcher("/pages/login.jsp").forward(servletRequest,servletResponse);
            }
        }

    }
}
