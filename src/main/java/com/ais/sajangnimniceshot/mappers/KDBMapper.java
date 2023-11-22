package com.ais.sajangnimniceshot.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.PricesBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper
public interface KDBMapper {
	boolean authenticateMember(MemberBean memberBean);

	MemberBean getMemberInfo(String memNickname);

	List<ReservationBean> getRsvList(String memNickname);

	int deleteReservation(String memNickname, String rsvCode);

	List<ReservationBean> getReservationDetail(String rsvCode);

	boolean checkMemNickname(String memNickname);

	int updateReservedTransfer(String rsvCode, String memNickname);

	boolean checkDate(String tiDate, String tiTime);

	int insertDateAndTime(String memNickname, String rsvDate, String rsvTime);

	String getRsvCode();

	int updateReservation(String rsvCode, String rsvCount, String rsvHole, String rsvCaddy, String rsvClothes,
			String rsvShoes, String rsvPrice);

	PricesBean getHolePrice(String rsvHole);

	PricesBean getCaddyPrice(String rsvCaddy);

	PricesBean getClothesPrice(String rsvClothes);

	PricesBean getShoesPrice(String rsvShoes);
//	List<PricesBean> getPrice(String rsvHole, String rsvCaddy, String rsvClothes, String rsvShoes);
}