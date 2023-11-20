package com.ais.sajangnimniceshot.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ais.sajangnimniceshot.beans.MemberBean;
import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper
public interface KYHMapper {

	boolean authenticateMember(MemberBean memberBean);

	MemberBean getMemberInfo(String memNickname);

	ReservationBean getReservationDetail(String rsvCode);

	int transferReservation(@Param("rsvCode") String rsvCode, @Param("memNickName") String memNickName);

	// List<ReservationBean> transferReservation(String rsvCode, String
	// memNickName);
	boolean checkNickname(String memNickname);
}
