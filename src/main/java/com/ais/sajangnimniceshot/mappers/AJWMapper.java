package com.ais.sajangnimniceshot.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ais.sajangnimniceshot.beans.ReservationBean;

@Mapper

public interface AJWMapper {

	String booking(String memNickname, String rsvCount, String rsvHole,
			String rsvCaddy, String rsvClothes, String rsvShoes);
	
	// String booking(ReservationBean reservationBean); Service단에서 맞춰야해서 이거 못씀..ㅠㅠ이거
	// 쓰면 에러.
}

