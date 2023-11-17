package com.ais.sajangnimniceshot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

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
        System.out.println(mav);
        this.service.backController("moveMyPage", mav);
        this.auth.backController("changeHeader", mav);
        return mav;
    }
}
