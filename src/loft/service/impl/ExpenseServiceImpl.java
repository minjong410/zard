package loft.service.impl;

import java.util.List;

import loft.dao.ExpenseDao;
import loft.model.Expense;
import loft.service.ExpenseService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ExpenseServiceImpl implements ExpenseService{

	@Autowired
	private ExpenseDao expenseDao;

	
	public List<Expense> listExpense(Expense expense) {
		
		List<Expense> expenseList = expenseDao.getExpenseList(expense);

		return expenseList;
	}
	
	public void insertExpense(Expense expense) {
		expenseDao.insertExpense(expense);
	}

}

