package loft.dao;

import java.util.List;

import loft.model.Expense;

public interface ExpenseDao {

	public List<Expense> getExpenseList(Expense expense);
	
	public void deleteExpense(Expense expense);
	
	public void insertExpense(Expense expense);

	
}
