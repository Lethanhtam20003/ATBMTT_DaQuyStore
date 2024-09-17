package controller.controllerFilterRole;

import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/views/admin/*")
//@WebFilter("/views/admin/admin.jsp")
public class FilterAdmin implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
//        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        //đang test trường hợp chưa đăng nhập
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
            //trường hợp đã đăng nhập và kiểm tra role nhưng
        } else if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if (user.getRole().equals("admin")) {
                filterChain.doFilter(request, response);
            } else if (user.getRole().equals("user")) {
                response.sendRedirect(request.getContextPath() + "/views/index.jsp");
            }
        }


    }

    @Override
    public void destroy() {
//        Filter.super.destroy();
    }
}
