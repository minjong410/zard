package loft.service;

import java.util.List;

import loft.model.Expense;

public interface ExpenseService {

	public List<Expense> listExpense(Expense expense);
	
	public void insertExpense(Expense expense);
	
}
