package loft.service.impl;

import java.util.List;

import loft.dao.LoftDao;
import loft.model.Expense;
import loft.model.User;
import loft.service.LoftService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoftServiceImpl implements LoftService{

	@Autowired
	private LoftDao loftDao;
	

	public User userAuthentication(User user) {
		return loftDao.userAuthentication(user);
	}
	
	
	public List<Expense> listExpense(Expense expense) {
		
		List<Expense> expenseList = loftDao.getExpenseList(expense);

		return expenseList;
	}
	
	public void insertExpense(Expense expense) {
		loftDao.insertExpense(expense);
	}

}

