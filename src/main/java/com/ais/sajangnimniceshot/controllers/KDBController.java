package com.ais.sajangnimniceshot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.services.Authentication;
import com.ais.sajangnimniceshot.services.KDBService;

@Controller
public class KDBController {
	@Autowired
	private KDBService service;

	@Autowired
	private Authentication auth;

	@GetMapping("/moveMyPage")
	public ModelAndView moveMyPage(ModelAndView mav) {
		mav.setViewName("myPage");
		this.service.backController("moveMyPage", mav);
		this.auth.backController("changeHeader", mav);
		return mav;
	}

	// 예약화면 이동
	@GetMapping("moveReservation")
	public ModelAndView moveReservation(ModelAndView mav) {
		mav.setViewName("reservation");
		this.service.backController("moveReservation", mav);
		this.auth.backController("changeHeader", mav);
		return mav;
	}

	// 예약
	@PostMapping("reservation")
	public ModelAndView reservation(ModelAndView mav, ReservationBean reservationBean) {
		mav.setViewName("reservationResult");
		mav.addObject("reservationBean", reservationBean);
		this.service.backController("reservation", mav);
		this.auth.backController("changeHeader", mav);
		return mav;
	}


}
