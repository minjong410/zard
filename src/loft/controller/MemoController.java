package loft.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import loft.model.Expense;
import loft.model.Memo;
import loft.search.MemoSearchCondition;
import loft.service.MemoService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller 
@RequestMapping(value = "/memo")
public class MemoController {

	public static Logger logger = Logger.getLogger(MemoController.class);
	
	@Autowired
	private MemoService memoService;


    @RequestMapping("/memo")
    public ModelAndView main() throws Exception {
    	ModelAndView mav = new ModelAndView("memo");
    	return mav;
    }
	
    @RequestMapping("/retrieveMemoList")
    public @ResponseBody HashMap<String, Object> retrieveExpenseList(MemoSearchCondition searchCondition) throws Exception {
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	List<Memo> expenseList = memoService.getCityList(searchCondition);
    	
    	map.put("result", "SUCCESS");
    	map.put("data", expenseList);

        return map;
    }
    
    @RequestMapping("/save")
    public @ResponseBody HashMap<String, Object> save(Expense expense, HttpServletRequest request) throws Exception {

    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	// Session
    	//User user = (User) request.getSession().getAttribute("user");
    	//expense.setUserId(user.getUserId());
    	expense.setUserId("watari");
    	
    	// Insert Data
    	//expesneService.insertExpense(expense);
    	
    	map.put("result", "SUCCESS");

        return map;
    	
    }

}
