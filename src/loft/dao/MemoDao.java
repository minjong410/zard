package loft.dao;

import java.util.List;

import loft.model.Memo;
import loft.search.MemoSearchCondition;

public interface MemoDao {

	public List<Memo> getCityList(MemoSearchCondition searchCondition);

}
