package com.ais.sajangnimniceshot.controllers;

import java.io.Console;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.beans.ReserveForm;
import com.ais.sajangnimniceshot.mappers.YSYMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RequiredArgsConstructor
@Controller
public class YSYController {
	
	@Autowired
	private YSYMapper ysyMapper;
	

       
	// 로그아웃
    @GetMapping("logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
    
    
//	@Autowired
//	private AuthenticateAction auth;
//    @GetMapping("/main1")
//    public ModelAndView main(ModelAndView mav, ReserveBean reserveBean) {
//    	mav.setViewName("main1");
//    	mav.addObject("reserveBean", reserveBean);
//    	return mav;
//    }
    
    
//    // 캘린더 컨트롤러
//    @GetMapping("/toReservation")
//    public ModelAndView moveReservation(ModelAndView mav, ReservationBean reservationBean) {
//    	mav.setViewName("reservation");
//    	mav.addObject("reservationBean", reservationBean);
//    	return mav;
//    }
    
//    @GetMapping("/test")
//    public String moveReservation(@RequestParam("selectDate")String selectDate,
//    								@RequestParam("selectTime")String selectTime) {
//    	ReservationBean rsvDate = ysyMapper.getReserveDate(selectDate);
//    	ReservationBean rsvTime = ysyMapper.getReserveTime(selectTime);
//    	log.info("selectDate:{}", selectDate);
//    	log.info("selectTate:{}", selectTime);
//    	
//    	// 선택한 날 예약이 모두 차면 선택 불가
//    	if (rsvDate != null) {
//    		return "redirect:/";
//    	}
//    	
//    	if (rsvTime != null) {
//    		return "redirect:/";
//    	}
//    	return "/";
//    }
    
//    @GetMapping("/test")
//    public String moveResrvation(@RequestParam String rsvDate) {
//    	ReserveForm reserveForm = ysyMapper.getReserveDate(rsvDate);
//    	
//    }
    

}
