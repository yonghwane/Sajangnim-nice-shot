package com.ais.sajangnimniceshot.services;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.mappers.KDBMapper;
import com.google.gson.Gson;

@Service
public class KDBService implements ServiceRule {

	@Autowired
	private KDBMapper kdbMapper;
	@Autowired
	private Authentication auth;
	@Autowired
	private Gson gson;

	public void backController(String serviceCode, ModelAndView mav) { // 동기식
		// 로그인 불필요
		switch (serviceCode) {
		default:
			break;
		}
		// 로그인 필요
		MemberBean accessInfo = this.auth.getAccessInfo();
		if (accessInfo == null) {
			mav.addObject("message", "먼저 로그인해주세요");
			return;
		}
		switch (serviceCode) {
		case "moveMyPage":
			this.moveMyPage(mav);
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
			model.addAttribute("message", this.encode("먼저 로그인해주세요"));
			return;
		}
		// 로그인 필요
		switch (serviceCode) {
		case "removeReservation":
			this.removeReservation(model);
			break;
		}
	}

	private void removeReservation(Model model) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		try {
			int deleteReservation = this.kdbMapper.deleteReservation(accessInfo.getMemNickname(),
					String.valueOf((int) model.getAttribute("rsvCode")));
			model.addAttribute("deleteReservation", deleteReservation);
		} catch (Exception e) {
			model.addAttribute("deleteReservation", 0);
		}
	}

	private void moveMyPage(ModelAndView mav) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		System.out.println("accessInfo : " + accessInfo);
		if (accessInfo == null) {
			mav.addObject("message", "먼저 로그인해주세요");
			return;
		}
		System.out.println("mapper : " + this.kdbMapper.getRsvList(accessInfo.getMemNickname()));
		mav.addObject("getRsvList", this.gson.toJson(this.kdbMapper.getRsvList(accessInfo.getMemNickname())));
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
