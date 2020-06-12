package loft.dao.impl;

import java.util.List;

import loft.config.SqlMapConfig;
import loft.dao.ScheduleDao;
import loft.model.Schedule;
import loft.model.Travel;
import loft.search.ScheduleSearchCondition;

import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDaoImpl extends SqlMapConfig implements ScheduleDao{

	@SuppressWarnings("unchecked")
	public List<Schedule> getCityList(ScheduleSearchCondition searchCondition){
		List<Schedule> result = null;
		try {
			result = queryForList("Schedule.getCityList", searchCondition);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}

