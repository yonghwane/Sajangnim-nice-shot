package com.ais.sajangnimniceshot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.services.Authentication;

@Controller
public class SNPController {
	@Autowired
	private Authentication auth;

    @GetMapping("/") // http://localhost:9000/
    public ModelAndView main(ModelAndView mav) {
        mav.setViewName("main");
        this.auth.backController("changeHeader", mav);
        return mav;
    }

    @PostMapping("/login")
    public ModelAndView login(ModelAndView mav, MemberBean memberBean) {
        mav.setViewName("main");
        mav.addObject("memberBean", memberBean);
        this.auth.backController("login", mav);
        this.auth.backController("changeHeader", mav);
        return mav;
    }

}
