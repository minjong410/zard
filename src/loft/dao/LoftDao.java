package loft.dao;

import java.util.List;

import loft.model.Expense;
import loft.model.User;

public interface LoftDao {

	public User userAuthentication(User user);
	
	public List<Expense> getExpenseList(Expense expense);
	
	public void deleteExpense(Expense expense);
	
	public void insertExpense(Expense expense);

	
}
