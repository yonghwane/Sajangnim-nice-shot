package com.ais.sajangnimniceshot.services;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.mappers.SHSMapper;
import com.google.gson.Gson;

@Service
public class SHSService implements ServiceRule {

    @Autowired
    private SHSMapper shsMapper;
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
		case "moveMyPageDetail":
			this.moveMyPageDetail(mav);
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
	private void moveMyPageDetail(ModelAndView mav) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		String rsvCode = (String) mav.getModel().get("rsvCode");
		mav.addObject("getRsvDetailList",this.gson.toJson(this.shsMapper.getReservationDetail(rsvCode)));
    }
	
	

	private String encode(String s) {
		try {
			s = URLEncoder.encode(s, "UTF-8");
		} catch (Exception e) {
		} finally {
			return s;
		}
	}
}
