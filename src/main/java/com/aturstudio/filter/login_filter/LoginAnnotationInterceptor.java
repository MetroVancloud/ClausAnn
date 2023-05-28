package com.aturstudio.filter.login_filter;

import com.aturstudio.dto.user.UserDTO;
import com.aturstudio.entity.AnnUser;
import com.aturstudio.filter.ResultTypeEnum;
import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

/**
 * @author Fan Yunlong
 * @create 2018/7/5 上午 4:20
 * @update 2018/7/5 上午 4:20
 */
public class LoginAnnotationInterceptor  extends HandlerInterceptorAdapter {

    private Logger logger = Logger.getLogger(LoginAnnotationInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        AnnUser user = (AnnUser) session.getAttribute("user");
        String requestURL = request.getRequestURI();
        if (requestURL.indexOf("/login/verify.do") != -1 || requestURL.indexOf("/login/in.do") != -1) {
            return true;
        } else {
            if (null == user) {
                request.getRequestDispatcher("/login/in.do").forward(request, response);
                logger.warn("当前用户的session已过期，返回登录页面");
                return false;
            } else {
                return true;
            }
        }
    }
}
