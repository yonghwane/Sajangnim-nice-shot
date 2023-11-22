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

	@GetMapping("/moveBook")
	public ModelAndView moveBook(ModelAndView mav) {
		mav.setViewName("book");
		this.ajwService.backController("moveBook", mav);
		System.out.println("moveBook");
		return mav;

	}

	@GetMapping("/bookPage")
	public ModelAndView bookPage(ModelAndView mav, ReservationBean reservationBean) {

		mav.setViewName("book1");

		mav.addObject("reservationBean", reservationBean);

		System.out.println("컨트롤러 탔지롱1~~~~");

		this.ajwService.backController("bookPage", mav);
		this.auth.backController("changeHeader", mav); // 모든 컨트롤러 메소드 안에 꼭 넣기. 안넣으면 실제로 로그인 세션이 저장되어있는데 뷰단에 로그인해달라고

		System.out.println("컨트롤러 탔지롱2~~~~");

		return mav;
	}

}