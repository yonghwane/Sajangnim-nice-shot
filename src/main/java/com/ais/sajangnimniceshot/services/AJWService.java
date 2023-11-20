package com.ais.sajangnimniceshot.services;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.mappers.AJWMapper;
import com.google.gson.Gson;

@Service
public class AJWService implements ServiceRule {

	@Autowired
	private AJWMapper mapper;
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
		case "bookPage":
			this.bookPage(mav);
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

	private void bookPage(ModelAndView mav) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		ReservationBean reservationBean = (ReservationBean) mav.getModel().get("reservationBean");

		String memNickname = accessInfo.getMemNickname(); // 닉네임
		String rsvCount = reservationBean.getRsvCount(); // 인수
		String rsvHole = reservationBean.getRsvHole(); // 홀
		String rsvCaddy = reservationBean.getRsvCaddy(); // 캐디
		String rsvClothes = reservationBean.getRsvClothes(); // 옷
		String rsvShoes = reservationBean.getRsvShoes(); // 신발
		String rsvPrice = reservationBean.getRsvPrice(); // 가격

		String rsvStatus = reservationBean.getRsvStatus(); // 양도.필요한지는 일단 미정.
		String rsvDate = reservationBean.getRsvDate(); // 날짜.필요한지는 일단 미정.
		String rsvTime = reservationBean.getRsvTime();// 시간.필요한지는 일단 미정.
		String rsvCode = reservationBean.getRsvCode();// 예약번호.필요한지는 일단 미정.

		mav.addObject("book",
				/*
				 * this.gson.toJson(this.mapper.booking(accessInfo.getMemNickname(),
				 * reservationBean.getRsvCount(), reservationBean.getRsvHole(),
				 * reservationBean.getRsvCaddy(), reservationBean.getRsvClothes(),
				 * reservationBean.getRsvShoes(), reservationBean.getRsvPrice(),
				 * reservationBean.getRsvTime(), reservationBean.getRsvDate(),
				 * reservationBean.getRsvStatus(), reservationBean.getRsvCode())));
				 */
				this.gson.toJson(this.mapper.booking(accessInfo.getMemNickname(), reservationBean.getRsvCode())));
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
