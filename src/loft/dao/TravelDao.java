package loft.dao;

import java.util.List;

import loft.model.Travel;
import loft.search.TravelSearchCondition;

public interface TravelDao {

	public List<Travel> getCityList(TravelSearchCondition searchCondition);
	
	public Travel getCity(TravelSearchCondition searchCondition);
	
	public Travel getShuffle(TravelSearchCondition searchCondition);
	
	public Travel getNav(TravelSearchCondition searchCondition);
	
	public List<Travel> getItemList(TravelSearchCondition searchCondition);
	
	public List<Travel> getTagList(TravelSearchCondition searchCondition);
}
