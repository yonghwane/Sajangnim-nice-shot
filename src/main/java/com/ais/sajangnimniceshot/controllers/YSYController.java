package com.ais.sajangnimniceshot.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.mappers.YSYMapper;
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
//    @GetMapping("reservationDate")
//    public ModelAndView moveReservation(ModelAndView mav) {
//    	mav.setViewName("reservationDate");
//    	this.service.backController("moveReservation", mav);
//    	this.auth.backController("changeHeader", mav);
//    	return mav;
//    }
    
//	@PostMapping("reservation")
//	public ModelAndView reservation(ModelAndView mav, ReservationBean reservationBean) {
//		mav.setViewName("reservationResult");
//		mav.addObject("reservationBean", reservationBean);
//		this.service.backController("reservation", mav);
//		this.auth.backController("changeHeader", mav);
//		return mav;
//	}
    
//    @PostMapping("/reservationDate")
//    public String createReservation(@RequestParam("rsvDate") String rsvDate,
//                                    @RequestParam("rsvTime") String rsvTime,
//                                    @RequestParam("rsvMember") String rsvMember,
//                                    Model model) {
//
//        // 예약 날짜와 시간을 검증
//        if (!ReservationCheck(rsvDate, rsvTime, rsvMember)) {
//            model.addAttribute("error", "이미 예약된 시간입니다.");
//            return "/"; // 홈으로 이동
//        }
//
//        return "/"; // 어떤 다른 화면으로
//    }
//    
//    private boolean reservationCheck(String rsvDate, String rsvTime, String rsvMember) {
//        MemberBean accessInfo = this.auth.getAccessInfo();
//        ReservationBean reservationBean = new ReservationBean();
//        reservationBean.setRsvDate(rsvDate);
//        reservationBean.setRsvTime(rsvTime);
//        reservationBean.setRsvMemNickname(rsvMember);
//
//        // 날짜 중복 체크
//        return !this.ysyMapper.checkDateOverlap(reservationBean.getRsvDate(), reservationBean.getRsvTime());
//    }
    
    
    
    // 예약 동의화면
//    @PostMapping("/reservationAgree/{memNickname}")
//    public ModelAndView updateReservation(ModelAndView mav) {
//    	mav.setViewName("reservationAgree");
//    	this.service.backController("agreeReservation", mav);
//    	this.auth.backController("changeHeader", mav);
//    	return mav;
//    }
   
    
}
