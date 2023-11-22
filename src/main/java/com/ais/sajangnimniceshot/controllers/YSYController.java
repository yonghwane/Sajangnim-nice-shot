package com.ais.sajangnimniceshot.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.services.Authentication;
import com.ais.sajangnimniceshot.services.YSYService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RequiredArgsConstructor
@Controller
public class YSYController {
	
	@Autowired
	private YSYService service;
	
	@Autowired
	private Authentication auth;

       
	// 로그아웃
    @GetMapping("logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
    
    // 예약화면 이동
    @GetMapping("reservationDate")
    public ModelAndView moveReservation(ModelAndView mav) {
    	mav.setViewName("reservationDate");
    	this.service.backController("moveReservation", mav);
    	this.auth.backController("changeHeader", mav);
    	return mav;
    }
    
    // 예약 동의화면
    @PostMapping("/reservationAgree/{memNickname}")
    public ModelAndView updateReservation(ModelAndView mav) {
    	mav.setViewName("reservationAgree");
    	this.service.backController("agreeReservation", mav);
    	this.auth.backController("changeHeader", mav);
    	return mav;
    }
   
    
}
