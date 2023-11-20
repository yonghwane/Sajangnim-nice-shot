package com.ais.sajangnimniceshot.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper
public interface KDBMapper {
	boolean authenticateMember(MemberBean memberBean);

	MemberBean getMemberInfo(String memNickname);

	List<ReservationBean> getRsvList(String memNickname);

	int deleteReservation(String memNickname, String rsvCode);

	List<ReservationBean> getReservationDetail(String rsvCode);

	boolean checkMemNickname(String memNickname);

//	int insertReservedTransfer(String memNickname, String rsvTime, String rsvDate, String rsvCount, String rsvHole,
//			String rsvCaddy, String rsvClothes, String rsvShoes, String rsvStatus, String rsvPrice);

	int updateReservedTransfer(String rsvCode, String memNickname);
}