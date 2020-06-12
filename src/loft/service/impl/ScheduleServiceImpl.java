package loft.service.impl;

import java.util.List;

import loft.dao.ScheduleDao;
import loft.model.Schedule;
import loft.search.ScheduleSearchCondition;
import loft.service.ScheduleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleDao scheduleDao;

	public List<Schedule> getCityList(ScheduleSearchCondition searchCondition) {
		
		List<Schedule> itemList = scheduleDao.getCityList(searchCondition);

		return itemList;
	}
	
}

