package loft.dao.impl;

import java.util.List;

import loft.config.SqlMapConfig;
import loft.dao.MemoDao;
import loft.model.Memo;
import loft.search.MemoSearchCondition;

import org.springframework.stereotype.Repository;

@Repository
public class MemoDaoImpl extends SqlMapConfig implements MemoDao{

	
	@SuppressWarnings("unchecked")
	public List<Memo> getCityList(MemoSearchCondition searchCondition){
		List<Memo> result = null;
		try {
			result = queryForList("Memo.getCityList", searchCondition);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}

