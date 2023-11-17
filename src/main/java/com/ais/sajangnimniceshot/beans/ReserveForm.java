package com.ais.sajangnimniceshot.beans;

import lombok.*;

@Data
@NoArgsConstructor
public class ReserveForm {
//	private String rsvCode;
	private String rsvDate;
	
	// 이걸 왜 만들었지??????
	public static ReservationBean reservationBean(ReserveForm reserveForm, MemberBean memberBean) {
		ReservationBean reservationBean = new ReservationBean();
//		reservationBean.setRsvDate();
		
		return reservationBean;
	}
}
