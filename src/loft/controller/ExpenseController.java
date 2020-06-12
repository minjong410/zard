package loft.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import loft.model.Expense;
import loft.service.ExpenseService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller 
@RequestMapping(value = "/expense")
public class ExpenseController {

	public static Logger logger = Logger.getLogger(ExpenseController.class);
	
	@Autowired
	private ExpenseService expesneService;


    @RequestMapping("/expense")
    public ModelAndView main() throws Exception {
    	
    	System.out.println("call me ?");
    	
    	ModelAndView mav = new ModelAndView("expense");
    	return mav;
    }
	
    @RequestMapping("/retrieveExpenseList")
    public @ResponseBody HashMap<String, Object> retrieveExpenseList(Expense expense) throws Exception {
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	List<Expense> expenseList = expesneService.listExpense(expense);
    	
    	map.put("result", "SUCCESS");
    	map.put("data", expenseList);

        return map;
    }
    
    
    @RequestMapping("/update")
    public ModelAndView update() throws Exception {

    	ModelAndView mav = new ModelAndView();

    	mav.setViewName("spring");

        return mav;
    }
        
    @RequestMapping("/save")
    public @ResponseBody HashMap<String, Object> save(Expense expense, HttpServletRequest request) throws Exception {

    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	// Session
    	//User user = (User) request.getSession().getAttribute("user");
    	//expense.setUserId(user.getUserId());
    	expense.setUserId("watari");
    	
    	// Insert Data
    	expesneService.insertExpense(expense);
    	
    	map.put("result", "SUCCESS");

        return map;
    	
    }

}
