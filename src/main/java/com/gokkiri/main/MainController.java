package com.gokkiri.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gokkiri.area.AreaModel;
import com.gokkiri.area.AreaService;
import com.gokkiri.schedule.ScheduleModel;
import com.gokkiri.schedule.ScheduleService;
import com.gokkiri.tip.TipModel;
import com.gokkiri.tip.TipService;

@Controller
public class MainController {
	
	ModelAndView mav = new ModelAndView();
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	@Resource(name="tipService")
	private TipService tipService;
	
	@RequestMapping(value="/main.go")
	public ModelAndView main(){
		
		List<ScheduleModel> scheduleList = scheduleService.scheduleHitList();
		List<AreaModel> areaList = areaService.areaCountList();
		List<TipModel> tipList = tipService.tipHitList();
		
		mav.addObject("tipList", tipList);
		mav.addObject("areaList", areaList);
		mav.addObject("scheduleList", scheduleList);
		mav.setViewName("main");
		return mav;
		
	}

}
