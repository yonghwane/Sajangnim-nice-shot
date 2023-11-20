package com.ais.sajangnimniceshot.services;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.mappers.KYHMapper;
import com.google.gson.Gson;

@Service
public class KYHService implements ServiceRule {

	@Autowired
	private KYHMapper kyhmapper;
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
			mav.addObject("message", "먼저 로그인해주세요");
			return;
		}
		switch (serviceCode) {
		case "moveMyPageTransfer":
			this.moveMyPageTransfer(mav);
			break;
		case "transferReservation":
			this.transferReservation(mav);
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
		case "moveMyPageTransfer":
			break;
		}
	}
	
	private void moveMyPageTransfer(ModelAndView mav) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		String rsvCode = (String) mav.getModel().get("rsvCode");
		mav.addObject("");
//
	}
	private void transferReservation(ModelAndView mav) {
	MemberBean accessInfo = this.auth.getAccessInfo();
	String memNickName =	(String) mav.getModel().get("memNickName");
	String rsvCode = (String) mav.getModel().get("rsvCode");
			
	if(!kyhmapper.checkNickname(memNickName)) {
		mav.addObject("message", "존재하지 않는 회원입니다.");
		mav.setViewName("redirect:/");
	}		
	if(memNickName == null) {
		mav.setViewName("redirect:/");
		mav.addObject("message", "값이 비어있습니다.");
		return;
	} else if(memNickName.equals(accessInfo.getMemNickname())) {
		mav.setViewName("redirect:/");
		mav.addObject("message", "동일한 회원에게는 양도를 할 수 없습니다.");
	} else {
		mav.addObject(memNickName);
		mav.addObject("transferReservation",this.gson.toJson(this.kyhmapper.transferReservation(rsvCode, memNickName) ));
		mav.setViewName("redirect:/");
	}
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
