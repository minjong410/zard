package loft.dao.impl;

import java.util.List;

import loft.config.SqlMapConfig;
import loft.dao.TravelDao;
import loft.model.Travel;
import loft.search.TravelSearchCondition;

import org.springframework.stereotype.Repository;

@Repository
public class TravelDaoImpl extends SqlMapConfig implements TravelDao{

	
	@SuppressWarnings("unchecked")
	public List<Travel> getCityList(TravelSearchCondition searchCondition){
		List<Travel> result = null;
		try {
			result = queryForList("Travel.getCityList", searchCondition);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Travel getCity(TravelSearchCondition searchCondition){
		Travel result = null;
		try {
			result = (Travel) queryForObject("Travel.getCity", searchCondition);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public Travel getShuffle(TravelSearchCondition searchCondition){
		Travel result = null;
		try {
			result = (Travel) queryForObject("Travel.getShuffle", searchCondition);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public Travel getNav(TravelSearchCondition searchCondition){
		Travel result = null;
		try {
			result = (Travel) queryForObject("Travel.getNav", searchCondition);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Travel> getItemList(TravelSearchCondition searchCondition){
		List<Travel> result = null;
		try {
			result = queryForList("Travel.getItemList", searchCondition);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Travel> getTagList(TravelSearchCondition searchCondition){
		List<Travel> result = null;
		try {
			result = queryForList("Travel.getTagList", searchCondition);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

}

