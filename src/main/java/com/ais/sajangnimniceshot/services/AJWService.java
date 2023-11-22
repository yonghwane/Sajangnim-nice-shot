package com.ais.sajangnimniceshot.services;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;
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
	private ReservationBean ReservationBean;
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
		case "moveBook":
			this.moveBook(mav);
			break;
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

	private void moveBook(ModelAndView mav) {

	}

	private void bookPage(ModelAndView mav) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		ReservationBean reservationBean = (ReservationBean) mav.getModel().get("reservationBean");

		String memNickname = accessInfo.getMemNickname(); // 닉네임
		System.out.println("memNickname: " + memNickname);

		String rsvCount = reservationBean.getRsvCount(); // 인수
		System.out.println("rsvCount: " + rsvCount);

		String rsvHole = reservationBean.getRsvHole(); // 홀
		System.out.println("rsvHole: " + rsvHole);

		String rsvCaddy = reservationBean.getRsvCaddy(); // 캐디
		System.out.println("rsvCaddy: " + rsvCaddy);

		String rsvClothes = reservationBean.getRsvClothes(); // 옷
		System.out.println("rsvClothes: " + rsvClothes);

		String rsvShoes = reservationBean.getRsvShoes(); // 신발
		System.out.println("rsvShoes: " + rsvShoes);

//		String rsvPrice = "0"; // 가격
//		System.out.println("rsvPrice: " + rsvPrice);

//		String rsvStatus = reservationBean.getRsvStatus(); // 양도.필요한지는 일단 미정.
//		String rsvDate = "23/11/10"; // 날짜.필요한지는 일단 미정.
//		String rsvTime = "0700";// 시간.필요한지는 일단 미정.
		// String rsvCode = reservationBean.getRsvCode();// 예약번호.필요한지는 일단 미정.
		System.out.println("서비스 탔지롱1~~~~");
		mav.addObject("book",
				this.gson.toJson(this.mapper.booking(memNickname, rsvCount, rsvHole, rsvCaddy, rsvClothes, rsvShoes)));
		System.out.println("서비스 탔지롱2~~~~");

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
