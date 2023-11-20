package com.ais.sajangnimniceshot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.services.Authentication;
import com.ais.sajangnimniceshot.services.KYHService;

@Controller
public class KYHController {

	@Autowired
	private KYHService service;

	@Autowired
	private Authentication auth;

	@GetMapping("/moveMyPageTransfer/{rsvCode}")
	public ModelAndView moveMyPage(ModelAndView mav, @PathVariable String rsvCode) {
		mav.setViewName("myPageTransfer");
		mav.addObject("rsvCode", rsvCode);
		System.out.println(mav);
		System.out.println(rsvCode);
		this.service.backController("moveMyPageTransfer", mav);
		this.auth.backController("changeHeader", mav);

		return mav;
	}

	@PostMapping("/transferReservation")
	public ModelAndView transferReservation(ModelAndView mav, @RequestParam("rsvCode") String rsvCode,
			@RequestParam("memNickName") String memNickName) {
		mav.setViewName("myPageTransfer");
		mav.addObject("rsvCode", rsvCode);
		mav.addObject("memNickName", memNickName);
		System.out.println("rsvCode: "+rsvCode);
		System.out.println("닉넴입력 :"+memNickName);
		this.service.backController("transferReservation", mav);
		return mav;
	}

}
