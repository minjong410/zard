package loft.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import loft.model.Expense;
import loft.model.Schedule;
import loft.search.ScheduleSearchCondition;
import loft.service.ScheduleService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller 
@RequestMapping(value = "/schedule")
public class ScheduleController {

	public static Logger logger = Logger.getLogger(ScheduleController.class);
	
	@Autowired
	private ScheduleService scheduleService;


    @RequestMapping("/schedule")
    public ModelAndView main() throws Exception {
    	ModelAndView mav = new ModelAndView("schedule");
    	return mav;
    }
	
    @RequestMapping("/retrieveScheduleList")
    public @ResponseBody HashMap<String, Object> retrieveExpenseList(ScheduleSearchCondition searchCondition) throws Exception {
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	List<Schedule> expenseList = scheduleService.getCityList(searchCondition);
    	
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
    	//expesneService.insertExpense(expense);
    	
    	map.put("result", "SUCCESS");

        return map;
    	
    }

}
