package loft.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import loft.exception.AuthException;
import loft.model.User;
import loft.service.JwtService;
import loft.service.LoftService;

@Controller 
public class LoftController {

	public static Logger logger = Logger.getLogger(LoftController.class);
	
	@Autowired
	private LoftService loftService;
	
	@Autowired
	private JwtService jwtService;
	
	
    @RequestMapping("/error")
    public String error(HttpServletRequest request) {
    	return "/common/error";
    }
	
    @RequestMapping("/login")
    public String loginForm(HttpServletRequest request) {
    	return "redirect:/index.jsp";
    }

    @RequestMapping("/loginProc")
    public String login(@RequestParam(value = "password", required = true) String password, 
			    				HttpServletRequest request) throws AuthException {

		//HttpSession session = request.getSession();

		if (!password.equals("2405")) {
			throw new AuthException("인증키가 일치하지 않습니다.");
		}
    	
		//User param = new User();
		//param.setUserName(username);
		//param.setPassword(password);
		
		//User user = loftService.userAuthentication(param);

		// User
		//if (user == null) {
		//	return "redirect:/loginForm.do?error=1";
		//}

		HttpSession httpsession = request.getSession(true);
		//httpsession.setAttribute("token", "watari");
		
		String token = jwtService.create("id", "2405", "token");
		httpsession.setAttribute("token", token);
		
		return "redirect:/travel";
    }
    
    
    @RequestMapping("/main")
    public String main(HttpServletRequest request) throws Exception {

    	//User user = (User) request.getSession().getAttribute("user");
    	//ModelAndView mav = new ModelAndView("expense/expense");
    	//mav.addObject("user", user);

        return "redirect:/travel";
    }

    @RequestMapping("/about")
    public ModelAndView about(HttpServletRequest request) throws Exception {
    	ModelAndView mav = new ModelAndView("about");
        return mav;
    }
    
    @RequestMapping("/contact")
    public ModelAndView contact(HttpServletRequest request) throws Exception {
    	ModelAndView mav = new ModelAndView("contact");
        return mav;
    }
    
    
}
