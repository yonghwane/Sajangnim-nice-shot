package com.ais.sajangnimniceshot.services;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.PricesBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;
import com.ais.sajangnimniceshot.mappers.KDBMapper;
import com.ais.sajangnimniceshot.mappers.SHSMapper;
import com.google.gson.Gson;

@Service
public class KDBService implements ServiceRule {

	@Autowired
	private KDBMapper kdbMapper;
	@Autowired
	private SHSMapper shsMapper;
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
			mav.setViewName("redirect:/");
			mav.addObject("message", "先にログインをしてください");
			return;
		}
		switch (serviceCode) {
		case "moveMyPage":
			this.moveMyPage(mav);
			break;
		case "moveReservedDetail":
			this.moveReservedDetail(mav);
			break;
		case "moveReservedTransfer":
			this.moveReservedTransfer(mav);
			break;
		case "reservedTransfer":
			this.reservedTransfer(mav);
			break;
		case "moveReservation":
			this.moveReservation(mav);
			break;
		case "reservation":
			this.reservation(mav);
			break;
//		case "reservation":
//			this.reservation(mav);
//			break;
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

//	private void reservation(ModelAndView mav) {
//		MemberBean accessInfo = this.auth.getAccessInfo();
//		ReservationBean reservationBean = (ReservationBean) mav.getModel().get("reservationBean");
//
//		String rsvCode = reservationBean.getRsvCode();
//		String rsvMemNickname = accessInfo.getMemNickname();
//		String rsvTime = reservationBean.getRsvTime();
//		String rsvDate = reservationBean.getRsvDate();
//		String rsvCount = reservationBean.getRsvCount();
//		String rsvHole = reservationBean.getRsvHole();
//		String rsvCaddy = reservationBean.getRsvCaddy();
//		String rsvClothes = reservationBean.getRsvClothes();
//		String rsvShoes = reservationBean.getRsvShoes();
//		String rsvPrice = reservationBean.getRsvPrice();
//
//		PricesBean getHolePrice = this.kdbMapper.getHolePrice(rsvHole);
//		PricesBean getCaddyPrice = this.kdbMapper.getCaddyPrice(rsvCaddy);
//		PricesBean getClothesPrice = this.kdbMapper.getClothesPrice(rsvClothes);
//		PricesBean getShoesPrice = this.kdbMapper.getShoesPrice(rsvShoes);
//
//		Integer totalPrice = Integer.parseInt(getHolePrice.getPriPrice())
//				+ Integer.parseInt(getCaddyPrice.getPriPrice()) + Integer.parseInt(getClothesPrice.getPriPrice())
//				+ Integer.parseInt(getShoesPrice.getPriPrice());
//
//		System.out.print("totalPrice:" + totalPrice);
//
////				+ " " + "getCaddyPrice:" + getCaddyPrice + " "
////				+ "getClothesPrice:" + getClothesPrice + " " + "getShoesPrice:" + getShoesPrice);
//
//		mav.addObject("getReservationDetail", this.gson.toJson(this.shsMapper.getReservationDetail(rsvCode)));
////		this.kdbMapper.updateReservation(rsvCode, rsvCount, rsvHole, rsvCaddy, rsvClothes, rsvShoes);
//		mav.addObject("getRsvDetailList", this.gson.toJson(this.shsMapper.getReservationDetail(rsvCode)));
//	}

	private void reservation(ModelAndView mav) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		ReservationBean reservationBean = (ReservationBean) mav.getModel().get("reservationBean");

		if (this.kdbMapper.checkDate(reservationBean.getRsvDate(), reservationBean.getRsvTime())) {
			// TimeSlots에 동일한 날짜, 시간 있을 경우
			mav.addObject("message", "예약할 수 없습니다.");
			mav.setViewName("reservation");
			return;
		}
		System.out.println("date:" +reservationBean.getRsvDate()+ "time: "+ reservationBean.getRsvTime());
		String rsvMemNickname = accessInfo.getMemNickname();
		String rsvTime = reservationBean.getRsvTime();
		String rsvDate = reservationBean.getRsvDate();
		String rsvCount = reservationBean.getRsvCount();
		String rsvHole = reservationBean.getRsvHole();
		String rsvCaddy = reservationBean.getRsvCaddy();
		String rsvClothes = reservationBean.getRsvClothes();
		String rsvShoes = reservationBean.getRsvShoes();
		PricesBean getHolePrice = this.kdbMapper.getHolePrice(rsvHole);
		PricesBean getCaddyPrice = this.kdbMapper.getCaddyPrice(rsvCaddy);
		PricesBean getClothesPrice = this.kdbMapper.getClothesPrice(rsvClothes);
		PricesBean getShoesPrice = this.kdbMapper.getShoesPrice(rsvShoes);

		Integer totalPrice = Integer.parseInt(getHolePrice.getPriPrice())
				+ Integer.parseInt(getCaddyPrice.getPriPrice()) + Integer.parseInt(getClothesPrice.getPriPrice())
				+ Integer.parseInt(getShoesPrice.getPriPrice());

		System.out.print("totalPrice:" + totalPrice);
		
		this.kdbMapper.insertReservation(rsvMemNickname, rsvDate, rsvTime, rsvCount, rsvHole, rsvCaddy, rsvClothes,
				rsvShoes, String.valueOf(totalPrice));
		this.kdbMapper.insertTimeslots(rsvDate, rsvTime);
		
		
		System.out.println("getRsvCode : " + this.kdbMapper.getRsvCode());

//		mav.addObject("getRsvDetailList",
//				this.gson.toJson(this.shsMapper.getReservationDetail(this.kdbMapper.getRsvCode())));
		mav.addObject("rsvDetail", this.gson.toJson(this.shsMapper.getReservationDetail(this.kdbMapper.getRsvCode())));
	}

	private void moveReservation(ModelAndView mav) {

	}

	private void moveReservedTransfer(ModelAndView mav) {
		String rsvCode = (String) mav.getModel().get("rsvCode");
		mav.addObject("getReservationDetail", this.gson.toJson(this.kdbMapper.getReservationDetail(rsvCode)));
	}

	private void reservedTransfer(ModelAndView mav) {
		MemberBean accessInfo = this.auth.getAccessInfo();
		String memNickname = (String) mav.getModel().get("memNickname"); // 프론트에서 받아온 양도자
		// db에 해당 멤버가 있는지 확인
		if (!this.kdbMapper.checkMemNickname(memNickname)) {
			mav.addObject("message", "존재하지 않는 회원입니다.");
			mav.setViewName("reservedTransfer");
			return;
		}

		if (memNickname.equals(accessInfo.getMemNickname())) {
			mav.addObject("message", "본인에게 양도할 수 없습니다.");
			mav.setViewName("reservedTransfer");
			return;
		}

		String rsvCode = (String) mav.getModel().get("rsvCode"); // 기존 예약을 불러오기 위한 rsvCode
		this.kdbMapper.updateReservedTransfer(rsvCode, memNickname);
		mav.addObject("getRsvList", this.gson.toJson(this.kdbMapper.getRsvList(accessInfo.getMemNickname())));
		mav.addObject("message", "양도 성공");
	}

	private void moveReservedDetail(ModelAndView mav) {
		String rsvCode = (String) mav.getModel().get("rsvCode");
		mav.addObject("getReservationDetail", this.gson.toJson(this.kdbMapper.getReservationDetail(rsvCode)));

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
