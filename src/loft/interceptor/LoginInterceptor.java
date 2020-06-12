package loft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mysql.jdbc.StringUtils;

import loft.exception.AuthException;
import loft.service.JwtService;
 
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private JwtService jwtService;
	
	
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
        //System.out.println("preHandle executed");
    	
		// Check Token
		HttpSession httpsession = request.getSession();
		boolean isPass = false;
		
		if( httpsession != null ){
			String token = (String) httpsession.getAttribute("token");
			if( !StringUtils.isNullOrEmpty(token) ){
				isPass = jwtService.isUsable(token);
			}
		}
		
		if( !isPass ){
			throw new AuthException("접근 권한이 없습니다.");
			//response.sendRedirect("/common/error");
		}
        
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //System.out.println("postHandle executed");
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request,
            HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //System.out.println("afterCompletion executed");
    }
 
}