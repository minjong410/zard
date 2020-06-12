package loft.service.impl;

import java.util.List;

import loft.dao.MemoDao;
import loft.model.Memo;
import loft.search.MemoSearchCondition;
import loft.service.MemoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemoServiceImpl implements MemoService{

	@Autowired
	private MemoDao memoDao;

	public List<Memo> getCityList(MemoSearchCondition searchCondition) {
		
		List<Memo> itemList = memoDao.getCityList(searchCondition);

		return itemList;
	}
	
}

