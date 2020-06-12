package loft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import loft.model.Travel;
import loft.search.TravelSearchCondition;
import loft.service.JwtService;
import loft.service.TravelService;

@Controller
public class TravelController {

	public static Logger logger = Logger.getLogger(TravelController.class);

	@Autowired
	private TravelService travelService;

	@RequestMapping({ "/travel" })
	public ModelAndView travel(HttpServletRequest request, TravelSearchCondition searchCondition) throws Exception {
		List<Travel> cityList = this.travelService.getCityList(searchCondition);

		ModelAndView mav = new ModelAndView("travel/inventory");
		mav.addObject("cityList", cityList);
		return mav;
	}

	@RequestMapping({ "/tags/{city}" })
	public ModelAndView tags(@PathVariable String city) throws Exception {
		TravelSearchCondition searchCondition = new TravelSearchCondition();
		searchCondition.setTag(city);

		List<Travel> cityList = this.travelService.getCityList(searchCondition);

		ModelAndView mav = new ModelAndView("travel/inventory");
		mav.addObject("cityList", cityList);
		return mav;
	}

	@RequestMapping({ "/travel/{city}" })
	public ModelAndView magazine(@PathVariable String city) throws Exception {
		TravelSearchCondition searchCondition = new TravelSearchCondition();
		searchCondition.setCity(city);

		Travel travel = this.travelService.getCity(searchCondition);
		List<Travel> tagList = this.travelService.getTagList(searchCondition);
		List<Travel> itemList = this.travelService.getItemList(searchCondition);
		
		for(Travel obj : itemList){
			if( "INSTAGRAM".equals(obj.getLayout()) || "TILES".equals(obj.getLayout()) || "SHUFFLE".equals(obj.getLayout()) ){
				searchCondition.setItemId(obj.getItemId());
				Travel shuffle = this.travelService.getShuffle(searchCondition);
				obj.setShuffle(shuffle);
			}
		}
		
		searchCondition.setSort(travel.getSort());
		Travel nav = this.travelService.getNav(searchCondition);

		ModelAndView mav = new ModelAndView("travel/magazine");
		mav.addObject("travel", travel);
		mav.addObject("tagList", tagList);
		mav.addObject("itemList", itemList);
		mav.addObject("nav", nav);
		return mav;
	}

}
