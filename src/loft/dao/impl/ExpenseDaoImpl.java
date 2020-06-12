package loft.dao.impl;

import java.sql.SQLException;
import java.util.List;

import loft.config.SqlMapConfig;
import loft.dao.ExpenseDao;
import loft.model.Expense;

import org.springframework.stereotype.Repository;

@Repository
public class ExpenseDaoImpl extends SqlMapConfig implements ExpenseDao{
	
	@SuppressWarnings("unchecked")
	public List<Expense> getExpenseList(Expense expense){
		List<Expense> result = null;
		try {
			result = queryForList("Expense.getExpenseList", expense);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void deleteExpense(Expense expense){
		try {
			update("Expense.deleteExpense", expense);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertExpense(Expense expense){
		try {
			insert("Expense.insertExpense", expense);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

