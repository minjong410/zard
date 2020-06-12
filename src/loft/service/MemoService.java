package loft.service;

import java.util.List;

import loft.model.Memo;
import loft.search.MemoSearchCondition;

public interface MemoService {

	public List<Memo> getCityList(MemoSearchCondition searchCondition);

}
