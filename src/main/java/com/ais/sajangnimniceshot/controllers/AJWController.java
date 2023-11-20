package com.ais.sajangnimniceshot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.services.AJWService;
import com.ais.sajangnimniceshot.services.Authentication;

@Controller
public class AJWController {

	@Autowired
	private AJWService ajwService;

	@Autowired
	private Authentication auth;
	
	@GetMapping("/bookPage")
	public ModelAndView bookPage(ModelAndView mav, ReservationBean reservationBean) {
		// @RequestParam 폼에서 날아온 값 저장

		mav.addObject("reservationBean", reservationBean);

		this.ajwService.backController("bookPage", mav);
		this.auth.backController("changeHeader", mav); // 모든 컨트롤러 메소드 안에 꼭 넣기. 안넣으면 실제로 로그인 세션이 저장되어있는데 뷰단에 로그인해달라고

		return mav;
	}

}