package com.ais.sajangnimniceshot.services;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.mappers.YSYMapper;
import com.google.gson.Gson;

@Service
public class YSYService implements ServiceRule {

    @Autowired
    private YSYMapper ysyMapper;
    @Autowired
    private Authentication auth;
    @Autowired
    private Gson gson;

    public void backController(String serviceCode, ModelAndView mav) { // 동기식
		// 로그인 불필요
		switch (serviceCode) {
		case "":
			return;
		default:
			break;
		}
		// 로그인 필요
		MemberBean accessInfo = this.auth.getAccessInfo();
		if (accessInfo == null) {
			mav.setViewName("redirect:/");
			mav.addObject("message", "先にログインをしてください");
			return;
		}
		switch (serviceCode) {
		case "":
			break;
		}
	}

	public void backController(String serviceCode, Model model) { // 비동기식
		// 로그인 불필요
		switch (serviceCode) {
		default:
			break;
		}
		MemberBean accessInfo = this.auth.getAccessInfo();
		if (accessInfo == null) {
			model.addAttribute("message", this.encode("先にログインをしてください"));
			return;
		}
		// 로그인 필요
		switch (serviceCode) {
		case "":
			break;
		}
	}
	
//	private void moveReservation(ModelAndView mav) {
//		String rsvCode = (String) mav.getModel().get("rsvCode");
//		mav.addObject("insertReservation", this.gson.toJson(this.ysyMapper.getReservation(rsvCode)));
//		
//	}
	
//	private void updateReservation(ModelAndView mav) {
//		String rsvCode = (String) mav.getModel().get("rsvCode");
//		this.ysyMapper.updateReservation(rsvCode, memNickname);
//	}
	

	private String encode(String s) {
		try {
			s = URLEncoder.encode(s, "UTF-8");
		} catch (Exception e) {
		} finally {
			return s;
		}
	}
	
	

}
