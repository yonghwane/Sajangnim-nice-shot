package com.ais.sajangnimniceshot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.services.Authentication;
import com.ais.sajangnimniceshot.services.SHSService;

@Controller
public class SHSController {
	@Autowired
	private SHSService service;
	@Autowired
	private Authentication auth;
	
	@GetMapping("/moveMyPage/{rsvCode}")
    public ModelAndView moveMyPageDetail(ModelAndView mav, @PathVariable String rsvCode) {
		mav.setViewName("myPageDetail");
		mav.addObject("rsvCode", rsvCode);
		this.service.backController("moveMyPageDetail", mav);
        this.auth.backController("changeHeader", mav);
		return mav;
        
    }
}
