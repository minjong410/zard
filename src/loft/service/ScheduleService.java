package loft.service;

import java.util.List;

import loft.model.Schedule;
import loft.search.ScheduleSearchCondition;

public interface ScheduleService {

	public List<Schedule> getCityList(ScheduleSearchCondition searchCondition);
	
}
