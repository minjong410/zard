package loft.service;

import java.util.List;

import loft.model.Expense;
import loft.model.User;

public interface LoftService {

	public User userAuthentication(User user);
	
	public List<Expense> listExpense(Expense expense);
	
	public void insertExpense(Expense expense);

}
