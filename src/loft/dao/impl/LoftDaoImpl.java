package loft.dao.impl;

import java.sql.SQLException;
import java.util.List;

import loft.config.SqlMapConfig;
import loft.dao.LoftDao;
import loft.model.Expense;
import loft.model.User;

import org.springframework.stereotype.Repository;

@Repository
public class LoftDaoImpl extends SqlMapConfig implements LoftDao{

	public User userAuthentication(User user){
		try {
			return (User) queryForObject("Loft.userAuthentication", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	@SuppressWarnings("unchecked")
	public List<Expense> getExpenseList(Expense expense){
		List<Expense> result = null;
		try {
			result = queryForList("Loft.getExpenseList", expense);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void deleteExpense(Expense expense){
		try {
			update("Loft.deleteExpense", expense);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertExpense(Expense expense){
		try {
			insert("Loft.insertExpense", expense);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

