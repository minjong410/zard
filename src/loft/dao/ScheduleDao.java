package loft.dao;

import java.util.List;

import loft.model.Schedule;
import loft.search.ScheduleSearchCondition;

public interface ScheduleDao {

	public List<Schedule> getCityList(ScheduleSearchCondition searchCondition);

}
