package loft.service.impl;

import java.util.List;

import loft.dao.TravelDao;
import loft.model.Travel;
import loft.search.TravelSearchCondition;
import loft.service.TravelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TravelServiceImpl implements TravelService{

	@Autowired
	private TravelDao travelDao;

	public List<Travel> getCityList(TravelSearchCondition searchCondition) {
		
		List<Travel> itemList = travelDao.getCityList(searchCondition);
		
		for(Travel record : itemList){
			searchCondition.setCity(record.getCityId());
			List<Travel> tagList = travelDao.getTagList(searchCondition);
			
			record.setTagList(tagList);
		}

		return itemList;
	}

	public Travel getCity(TravelSearchCondition searchCondition) {
		return travelDao.getCity(searchCondition);
	}

	public Travel getShuffle(TravelSearchCondition searchCondition) {
		
		Travel shuffle = travelDao.getShuffle(searchCondition);

		return shuffle;
	}

	public Travel getNav(TravelSearchCondition searchCondition) {
		
		Travel shuffle = travelDao.getNav(searchCondition);

		return shuffle;
	}
	
	public List<Travel> getItemList(TravelSearchCondition searchCondition) {
		
		List<Travel> itemList = travelDao.getItemList(searchCondition);

		return itemList;
	}
	
	public List<Travel> getTagList(TravelSearchCondition searchCondition) {
		
		List<Travel> itemList = travelDao.getTagList(searchCondition);

		return itemList;
	}
	
}

